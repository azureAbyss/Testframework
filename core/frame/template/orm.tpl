<?php

// date: !date
// project name: !prjname
// project author: !prjauthor

$rule = function($fields) {
	if(is_array($fields)) {
		$res = $fields[0];
		foreach ($fields[1] as $k=>$field) {
			if($k>0) {
				$res.=',';
			}
			$res.=$field.orm::_aliastb($field);					
		}				

		return $res;
	} else {
		return $fields;
	}
};

class orm
{
	public $sql = array(
		'select' => 'select ',
		'from' => [' from ',[]],
		'where' => ' where ',
		'orderby' => ' order by ',
		'limit' => ' limit ',
	);

	public $backsql = array();

	function __construct() {
		$this->backsql = $this->sql;
	}

	function select() {
		$select_fields = func_get_args();
		foreach ($select_fields as $field) {
			if(is_array($field)) {
				$tb_name = key($field);
				$tb_val = $field[$tb_name];
				$select_str = $this->_aliastb($tb_name).'.'.$tb_val;
				$this->_add(__FUNCTION__, $select_str);
			} else {
				$this->_add(__FUNCTION__, $field);	
			}
		}
		return $this;
	}

	function from($table) {
		if(is_array($table)) {
			if(count($table) != 2) return $this;
			$table1 = $table[0];
			$table2 = $table[1];
			$table1_key = key($table1);
			$table1_val = $table1[$table1_key];
			$table2_key = key($table2);
			$table2_val = $table2[$table2_key];
			$this->_add(__FUNCTION__,$table1_key);
			$this->_add(__FUNCTION__,$table2_key);
			$where_str = $this->_aliastb($table1_key).'.'.$table1_val.'='.$this->_aliastb($table2_key).'.'.$table2_val;
			$this->where($where_str);


		} else {
			$this->_add(__FUNCTION__,$table);
		}
		return $this;
	}

	function where($wherestr) {
		$this->_add(__FUNCTION__,$wherestr,' AND ');
		return $this;
	}

	function orderby($field, $sort='ASC') {
		if(is_array($field)) {
			$tb_name = key($field);
			$tb_filed = $field[$tb_name];
			$order_str = $this->_aliastb($tb_name).'.'.$tb_filed;
			$this->_add(__FUNCTION__, $order_str.' '.$sort);
		} else {
			$this->_add(__FUNCTION__, $field.' '.$sort);
		}
		return $this;
	}

	function limit($start,$size='null') {
		if(is_numeric($size)) {
			$this->_add(__FUNCTION__, $start.','.$size);
		} else {
			$this->_add(__FUNCTION__, $start);
		}
		return $this;
	}

	function _add($name,$field,$sep=',') {
		//if(!$this->sql[$name]) return;

		if(!array_key_exists($name, $this->sql)) return;

		// array push
		if(is_array($this->sql[$name])) {
			if(!in_array($field, $this->sql[$name][1])) {
				$this->sql[$name][1][] = $field;
			}
		// string
		} else {
			//if($name != trim($this->sql[$name])) {
			if($name != preg_replace('/\s/', '', $this->sql[$name])) {
				$this->sql[$name].=$sep;
			}
			$this->sql[$name].=$field;
		}

	}

	function _aliastb($tbname) {
		return ' _'.$tbname;
	}

	function __toString() {
		//return implode(array_values($this->sql), ' ');
		
		// filter
		$filter = function($value, $key) {
			if(is_array($value)) {
				if(count($value[1]) > 0) {
					return true;
				}
			} else {
				if($key != preg_replace('/\s/', '', $value)) {
					return true;
				}
			}
			return false;
		};
		$res = array_filter($this->sql, $filter, ARRAY_FILTER_USE_BOTH);

		// output
		global $rule;
		$rule = closure::bind($rule,$this,'orm');
		$res = array_map($rule, array_values($res));

		// return back sql
		$this->sql = $this->backsql;

		return implode($res, ' ');
	}

}
