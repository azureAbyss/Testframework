#! /usr/local/php/bin/php
<?php
	
	define('CLS_STR','json');

	require substr(PHP_VERSION, 0, 1) == 7 ? 'god_func7' : 'god_func';
	require 'core/godinit';
	use core\godinit;

	if($argc == 1) exit('i am god'.PHP_EOL);
	
	$v1 = $argv[1];

	// the var
	if(substr($v1, 0, 1) == '-') {
		//ex: -v to v
		$v1 = substr($v1, 1);
		$res = isset(godinit::$$v1) ? godinit::$$v1 : 'error:invalid field '.$v1.'!';

	// the method
	} else {
		$res = godinit::$v1();
	}

	/*
	$res = $argv[1];
	'-v' == $res && $res = godinit::$version;
	'init' == $res && godinit::init() && $res = init(array('pro_name'=>godinit::$pro_name, 'pro_author'=>godinit::$pro_author));*/

	echo $res.PHP_EOL;


	
	