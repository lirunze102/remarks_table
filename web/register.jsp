<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8 ]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html lang="en" class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>用户注册页面</title>


  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <![endif]-->


  <link href="css/normalize.css" rel="stylesheet"/>
  <link href="css/jquery-ui.css" rel="stylesheet"/>
  <link href="css/jquery.idealforms.min.css" rel="stylesheet" media="screen"/>

  <style type="text/css">
    body{font:normal 15px/1.5 Arial, Helvetica, Free Sans, sans-serif;color: #222;background:url(pattern.png);overflow-y:scroll;padding:60px 0 0 0;}
    #my-form{width:755px;margin:0 auto;border:1px solid #ccc;padding:3em;border-radius:3px;box-shadow:0 0 2px rgba(0,0,0,.2);}
    #comments{width:350px;height:100px;}
  </style>

</head>
<body>
<div class="row">
  <div class="eightcol last">
    <!-- Begin Form -->
    <form id="my-form" action="">
        <div><h1>用户注册</h1></div>
        <div><label>用户名:</label><input id="uName" name="uName" type="text"/></div><div id="ruName"></div>
        <div><label>密码:</label><input id="uPassWord" name="uPassWord" type="password"/></div>
        <div><label>性别:</label>
            <input id="uSex" name="uSex" data-ideal="required email" type="text"/>
        </div>
        <div><label>上传头像:</label><input id="file" name="file" multiple type="file"/></div>
      <div><hr/></div>
      <div>
        <button type="submit">提交</button>
        <button id="reset" type="button">重置</button>
      </div>
    </form>
    <!-- End Form -->
  </div>
</div>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.idealforms.js"></script>
<script type="text/javascript">
    var options = {

        onFail: function(){
            alert( $myform.getInvalid().length +' invalid fields.' )
        },

        inputs: {
            'uPassWord': {
                filters: 'required pass',
            },
            'uName': {
                filters: 'required username',
                data: {
                }
            },
            'comments': {
                filters: 'min max',
                data: { min: 50, max: 200 }
            },

        }

    };

    var $myform = $('#my-form').idealforms(options).data('idealforms');

    $('#reset').click(function(){
        $myform.reset().fresh().focusFirst()
    });

    $myform.focusFirst();
</script>
<script >
    $(function(){
        $name = $(':input[name="uName"]')
        $name.blur(function(){
            // alert($name.val())
            $.get("reg.jhtml", {username:$name.val()}, function(data, status){
                alert(data)
                alert(status)
                $('#ruName').html(data)

            })
        })
    })
</script>
</body>
</html>