# v0.1
PHP>=5.6
更新时间：2017/12/5 10:54

## 主要命令：
* **god -v** 获取程序版本
* **god init** 初始化项目并录入项目信息，并在根目录生成项目信息
* **god ini** 获取当前目录项目信息
* **god make** 初始化生成项目目录文件
* **god compile** 编译.func.php、.var.php、.class.php内容，前两者会在项目目录生成functions和vars文件，后者会生成controller_route的路由规则文件

## 主要功能：
1. **创建基本MVC项目架构**
2. **内置简单代码优化器，优化Controller文件夹下的xxx.var.php和xxx.func.php以及xxx.class.php**
3. **实现简单的pathinfo路由，如果Controller文件夹下存在xxx.class.php，并在class声明上方标注：**
```php
/**
 * 如果在class声明上方标注，该类是一个控制器：
 * @Controller
 **/
```
```php
/**
 * 如果在function声明上方标注，则该方法是一个对浏览器公开方法
 * RequestMapping参数：(对应的浏览器地址，支持写入正则, 请求方式)
 * @RequestMapping("/login$",Method=GET);
 */  
```
4. **支持GET或POST方式的参数传入：**

GET传入需要在方法上方的注解中加入相应的参数规则（必须使用别名，且只支持英文字母），并在方法参数中与之对应，如：
```
/**
 * @RequestMapping("/member/(?<name>\w{2,10})/(?<age>\d+)$",Method=GET);
 */
function showUser($name, $age) {
    echo 'name:'.$name.' age:'.$age;
}
```
POST传入只需在方法中添加与POST对应且参数名相同的参数即可（如果某个POST值不存在参数列表中，则不会传入）如：
```
/**
 * userLoginCheck()
 * @RequestMapping("/loginCheck$",Method=POST);
 */
function userLoginCheck($uname, $upwd) {
    $map['username'] = $uname;
    $map['userpassword'] = $upwd;
    echo json_encode($map);
}
```
支持POST的自定义enctype格式（默认只支持application/json，其他类型可在start.php45行加入自定义解析规则），用其他MIME类型来取代默认的application/x-www-
form-urlencoded，如AJAX请求：
```
$.ajax({
    type: "POST",   
    contentType: "application/json", //自定义类型，json
    url: "/loginCheck",
    data: JSON.stringify(userData), //格式：{paraName:paraValue}
    dataType: 'json',
    success: function (result) {     
        alert(result.username);
    },
    error:function(response,error)
    {
        alert(error);
    }
});
```
5. **加载模板：在需要的控制器方法中添加参数$display即可调用模板，支持自定义传参，系统会自动加载vars和自定义变量，如：**
```
/**
 * showUser()
 * RequestMapping参数：(模板名称，View目录下.tpl后缀的文件, 自定义变量,数组格式，可在模板中使用)
 * @RequestMapping("/member/(?<name>\w{2,10})/(?<age>\d+)$",Method=GET);
 */
function showUser($name, $age, $display) {
    $map['name'] = $name;
    $map['age'] = $age;
    $display('tp1', $map);
}
```

## Other：
1. 自定义ORM框架：Core/Orm/orm.php，目前只实现了简单的select、where、from的SQL语句拼接
