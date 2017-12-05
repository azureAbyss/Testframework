<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <script src="/Public/js/jq.js"></script>
  <script>

    $(document).ready(function(){

      $("#jqbtn").click(function(){

        var jsonResult=$("#userfrm").serializeArray();//json对象
        var userData={};
        $.each(jsonResult,function(){
          userData[this.name]=this.value;
        })
        /*alert(JSON.stringify(userData));
        return;*/

      	$.ajax({
           type: "POST",   //使用Post方式请求
           contentType: "application/json",
           url: "/loginCheck",
           //这里是要传递的参数，格式为 data: "{paraName:paraValue}"
           //data: JSON.stringify(userData),
           data: JSON.stringify(userData),
           dataType: 'json',//返回的内容 我们设置为json类型
           success: function (result) {     //回调函数，result，返回值
               alert(result.username);
               $('#res').html(result.userpassword);
           },
           error:function(response,error)
           {
             alert(error);
           }
     	});

      })
    })

  </script>
</head>
<body>
 
<form action="/loginCheck" method="post"   id="userfrm" >
   <div>
     用户名:<input type="text" name="uname"/>
   </div>

  <div>
    密码:<input type="text" name="upwd"/>
  </div>
  
  <div>
    <input type="submit" value="登录"/>
    <input type="button" value="登录(jquery)" id="jqbtn"/>
  </div>
</form>

<div id="res"></div>
<p><?php showName(); ?></p>

</body>
</html>