<?php

// date: !date
// project name: !prjname
// project author: !prjauthor

// array_filter的回调函数,获取preg_match结果中定义的参数（参数名只允许为字母）
function param_match($key) {
	return preg_match('/[a-zA-Z]+/', $key);
}

// 检测反射method中是否存在参数key
function exist_param($method, $key) {
	foreach ($method->getParameters() as $param) {
		if($key == $param->name)
			return true;
	}
	return false;
}