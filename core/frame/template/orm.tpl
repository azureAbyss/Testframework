<?php

// date: !date
// project name: !prjname
// project author: !prjauthor

class orm
{
	public $sql = array(
		'select' => 'select ',
		'from' => 'from ',
		'where' => 'where ',
	);

	function select() {
		$select_fields = func_get_args();
		foreach ($select_fields as $field) {
			if('select' != trim($this->sql[__FUNCTION__]))
				$this->sql[__FUNCTION__].=',';
			$this->sql[__FUNCTION__].=$field;
		}
		return $this;
	}

	function from($tableName) {
		if('from' != trim($this->sql[__FUNCTION__]))
			$this->sql[__FUNCTION__].=',';
		$this->sql[__FUNCTION__].=$tableName;
		return $this;
	}

	function where($map) {
		$this->sql[__FUNCTION__].=$map;
		return $this;
	}

	function __toString() {
		return implode(array_values($this->sql), ' ');
	}

}