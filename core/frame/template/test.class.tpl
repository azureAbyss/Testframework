<?php

// date: !date
// project name: !prjname
// project author: !prjauthor

/**
 * @Controller
 */
class test {
	/**
	 * @RequestMapping("/member/(?<name>\w{2,10})/(?<age>\d+)$",Method=GET);
	 */
	function showUser($name, $age, $display) {
		//echo 'user/showUser(),name:'.$name.' age:'.$age;
		$map['name'] = $name;
		$map['age'] = $age;
		$display('test', $map);
	}

	/**
	 * @RequestMapping("/login$",Method=GET);
	 */
	function userLogin($display) {
		$display('test');
	}

	/**
	 * @RequestMapping("/loginCheck$",Method=POST);
	 */
	function userLoginCheck($uname, $upwd) {
		//$uname = json_encode($uname);
		$map['username'] = $uname;
		$map['userpassword'] = $upwd;
		echo json_encode($map);
	}
}