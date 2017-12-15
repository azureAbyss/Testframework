<html lang="en"><head>
    <meta charset="UTF-8">
    <title></title>
<style id="system" type="text/css">h1,h2,h3,h4,h5,h6,p,blockquote {    margin: 0;    padding: 0;}body {    font-family: "Helvetica Neue", Helvetica, "Hiragino Sans GB", Arial, sans-serif;    font-size: 13px;    line-height: 18px;    color: #737373;    margin: 10px 13px 10px 13px;}a {    color: #0069d6;}a:hover {    color: #0050a3;    text-decoration: none;}a img {    border: none;}p {    margin-bottom: 9px;}h1,h2,h3,h4,h5,h6 {    color: #404040;    line-height: 36px;}h1 {    margin-bottom: 18px;    font-size: 30px;}h2 {    font-size: 24px;}h3 {    font-size: 18px;}h4 {    font-size: 16px;}h5 {    font-size: 14px;}h6 {    font-size: 13px;}hr {    margin: 0 0 19px;    border: 0;    border-bottom: 1px solid #ccc;}blockquote {    padding: 13px 13px 21px 15px;    margin-bottom: 18px;    font-family:georgia,serif;    font-style: italic;}blockquote:before {    content:"C";    font-size:40px;    margin-left:-10px;    font-family:georgia,serif;    color:#eee;}blockquote p {    font-size: 14px;    font-weight: 300;    line-height: 18px;    margin-bottom: 0;    font-style: italic;}code, pre {    font-family: Monaco, Andale Mono, Courier New, monospace;}code {    background-color: #fee9cc;    color: rgba(0, 0, 0, 0.75);    padding: 1px 3px;    font-size: 12px;    -webkit-border-radius: 3px;    -moz-border-radius: 3px;    border-radius: 3px;}pre {    display: block;    padding: 14px;    margin: 0 0 18px;    line-height: 16px;    font-size: 11px;    border: 1px solid #d9d9d9;    white-space: pre-wrap;    word-wrap: break-word;}pre code {    background-color: #fff;    color:#737373;    font-size: 11px;    padding: 0;}@media screen and (min-width: 768px) {    body {        width: 748px;        margin:10px auto;    }}</style><style id="custom" type="text/css"></style></head>
<body marginheight="0"><p><img src="mahua-logo.jpg" alt="mahua">
</p>
<h2>MaHua是什么?</h2>
<p>一个在线编辑markdown文档的编辑器

</p>
<p>向Mac下优秀的markdown编辑器mou致敬

</p>
<h2>MaHua有哪些功能？</h2>
<ul>
<li>方便的<code>导入导出</code>功能<ul>
<li>直接把一个markdown的文本文件拖放到当前这个页面就可以了</li>
<li>导出为一个html格式的文件，样式一点也不会丢失</li>
</ul>
</li>
<li>编辑和预览<code>同步滚动</code>，所见即所得（右上角设置）</li>
<li><code>VIM快捷键</code>支持，方便vim党们快速的操作 （右上角设置）</li>
<li>强大的<code>自定义CSS</code>功能，方便定制自己的展示</li>
<li>有数量也有质量的<code>主题</code>,编辑器和预览区域</li>
<li>完美兼容<code>Github</code>的markdown语法</li>
<li>预览区域<code>代码高亮</code></li>
<li>所有选项自动记忆</li>
</ul>
<h2>有问题反馈</h2>
<p>在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

</p>
<ul>
<li>邮件(dev.hubo#gmail.com, 把#换成@)</li>
<li>QQ: 287759234</li>
<li>weibo: <a href="http://weibo.com/ihubo">@草依山</a></li>
<li>twitter: <a href="http://twitter.com/ihubo">@ihubo</a></li>
</ul>
<h2>捐助开发者</h2>
<p>在兴趣的驱动下,写一个<code>免费</code>的东西，有欣喜，也还有汗水，希望你喜欢我的作品，同时也能支持一下。
当然，有钱捧个钱场（右上角的爱心标志，支持支付宝和PayPal捐助），没钱捧个人场，谢谢各位。

</p>
<h2>感激</h2>
<p>感谢以下的项目,排名不分先后

</p>
<ul>
<li><a href="http://mouapp.com/">mou</a> </li>
<li><a href="http://ace.ajax.org/">ace</a></li>
<li><a href="http://jquery.com">jquery</a></li>
</ul>
<h2>关于作者</h2>
<pre><code class="lang-javascript">  var ihubo = {
    nickName  : "草依山",
    site : "http://jser.me"
  }</code></pre>
<h1>GOD程序v1.0</h1>
<h2>依赖环境：PHP5.6</h2>
<h2>更新时间：2017/12/5 10:54</h2>
<h2>主要命令：</h2>
<ul>
<li><strong>god -v</strong> 获取god程序版本</li>
<li><strong>god init</strong> 初始化项目并录入项目信息，并在根目录生成项目信息</li>
<li><strong>god ini</strong> 获取当前目录项目信息</li>
<li><strong>god make</strong> 初始化生成项目目录文件</li>
<li><strong>god compile</strong> 编译.func.php、.var.php、.class.php内容，前两者会在项目目录生成functions和vars文件，后者会生成controller_route的路由规则文件</li>
</ul>
<h2>主要功能：</h2>
<ol>
<li><strong>创建基本MVC项目架构</strong></li>
<li><strong>内置简单代码优化器，优化Controller文件夹下的xxx.var.php和xxx.func.php以及xxx.class.php</strong></li>
<li><p><strong>实现简单的pathinfo路由，如果Controller文件夹下存在xxx.class.php，并在class声明上方标注：</strong></p>
<pre><code class="lang-php">/**
* 如果在class声明上方标注，该类是一个控制器：
* @Controller
**/</code></pre>
<pre><code class="lang-php">/**
* 如果在function声明上方标注，则该方法是一个对浏览器公开方法
* @RequestMapping("/login$",Method=GET);
*/</code></pre>
<p>@RequestMapping参数：
① 对应的浏览器地址，支持写入正则
② 请求方式</p>
</li>
<li><p><strong>支持GET或POST方式的参数传入：</strong></p>
<ul>
<li>GET传入需要在方法上方的注解中加入相应的参数规则（必须使用别名，且只支持英文字母），并在方法参数中与之对应，如：<pre><code>/**
* @RequestMapping("/member/(?&lt;name&gt;\w{2,10})/(?&lt;age&gt;\d+)$",Method=GET);
*/
function showUser($name, $age) {
  echo 'name:'.$name.' age:'.$age;
}</code></pre>
</li>
<li>POST传入只需在方法中添加与POST对应且参数名相同的参数即可（如果某个POST值不存在参数列表中，则不会传入）如：<pre><code>/**
* userLoginCheck()
* @RequestMapping("/loginCheck$",Method=POST);
*/
function userLoginCheck($uname, $upwd) {
  $map['username'] = $uname;
  $map['userpassword'] = $upwd;
  echo json_encode($map);
}</code></pre>
</li>
<li>支持POST的自定义enctype格式（默认只支持application/json，其他类型可在start.php45行加入自定义解析规则），用其他MIME类型来取代默认的application/x-www-
form-urlencoded，如AJAX请求：<pre><code>$.ajax({
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
});</code></pre>
</li>
</ul>
</li>
<li><strong>加载模板：在需要的控制器方法中添加参数$display即可调用模板，支持自定义传参，系统会自动加载vars和自定义变量，如：</strong><pre><code>/**
* showUser()
* @RequestMapping("/member/(?&lt;name&gt;\w{2,10})/(?&lt;age&gt;\d+)$",Method=GET);
*/
function showUser($name, $age, $display) {
 $map['name'] = $name;
 $map['age'] = $age;
 $display('tp1', $map);
}</code></pre>
参数：
① 模板名称，为View目录下.tpl后缀的文件
② 自定义变量,数组格式，可在模板中使用</li>
</ol>
<h2>未完成功能：</h2>
<ol>
<li>自定义ORM框架：Core/Orm/orm.php，目前只实现了简单的select、where、from的SQL语句拼接 
Edit By <a href="http://mahua.jser.me">MaHua</a></li>
</ol>
</body></html>
