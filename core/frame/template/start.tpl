<?php

// date: !date
// project name: !prjname
// project author: !prjauthor

require 'lib_param.php';

// display templete
$display = function($tplName='', $vars=array()) {
	if($tplName) {
		extract($vars);
		require 'vars';
		include('View/'.$tplName.'.tpl');
	}
};

// all controller methods
$route = require('controller_route');
$get_path = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : false;

// get controller methods's key
$route_keys = array_keys($route);

foreach ($route_keys as $key) {
	$patten = str_replace('/', '\/', $key);
	$patten = '/'.$patten.'/';
	if(preg_match($patten, $get_path, $param)) {
		$route_obj = $route[$key];
		if($route_obj['request_method'] == $_SERVER['REQUEST_METHOD']){
			
			// get classname and methodname
			$cname = $route_obj['class_name'];
			$mname = $route_obj['method_name'];
			require 'Controller/'.$cname.'.class.php';

			$rfc = new reflectionClass($cname);
			$method = $rfc->getMethod($mname);

			// get args list
			$params = array();
			if($route_obj['request_method'] == 'GET')
			{
				// get method params(array)
				$params = array_filter($param, 'param_match', ARRAY_FILTER_USE_KEY);

			} elseif($route_obj['request_method'] == 'POST') {
				// post method params
				if('application/json' == $_SERVER["CONTENT_TYPE"])
				{
					$get_json = json_decode(file_get_contents("php://input"));
					foreach ($get_json as $k => $v) {
						if(exist_param($method, $k)) {
							$params[$k] = $v;	
						}
					}
				} else {
					foreach ($_POST as $k => $v) {
						if(exist_param($method, $k)) {
							$params[$k] = $v;	
						}
					}
				}
			}
			
			//if($params && count($params)>0) {
				// run method with params
			$params['display'] = $display;
			$method->invokeArgs($rfc->newInstance(), $params);
			//} else {
				// run method
			//	$method->invoke($rfc->newInstance());
			//}

		} else {
			echo '<h1>not allowed!</h1>';
		}
	}else {
		//echo 'path='.$get_path.' patten='.$patten.'<hr/>';
	}
}