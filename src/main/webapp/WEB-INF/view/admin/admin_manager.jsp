<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- saved from url=(0052)http://getbootstrap.com/docs/4.0/examples/dashboard/ -->
<html lang="en">
<head>
    <title>个人资料-于初个人博客后台管理</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="keywords" content="个人博客,于云阔个人博客,个人博客系统,于初博客,于云阔">
    <meta name="description" content="于初博客系统，一个站在java开发之路上的草根程序员个人博客网站。">
    <LINK rel="Bookmark" href="${ctx}/favicon.ico">
    <LINK rel="Shortcut Icon" href="${ctx}/favicon.ico"/>

    <%--layui--%>
    <link rel="stylesheet" href="${ctx}/css/bootstrap4.0.min.css">
    <script src="${ctx}/js/jquery.slim.min.js"></script>
    <script src="${ctx}/js/popper.min.js"></script>
    <%--弹出框--%>
    <script src="${ctx}/js/mdialog.js" type="text/javascript"></script>
    <script src="${ctx}/js/zepto.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/mdialog.css"/>
    <script src="${ctx}/js/jquery.min.js" type="text/javascript"></script>
    <!-- Custom styles for this template -->
    <link href="${ctx}/asserts/css/dashboard.css" rel="stylesheet">
    <style type="text/css">
        /* Chart.js */
        @-webkit-keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }
            to {
                opacity: 1
            }
        }

        @keyframes chartjs-render-animation {
            from {
                opacity: 0.99
            }
            to {
                opacity: 1
            }
        }

        .chartjs-render-monitor {
            -webkit-animation: chartjs-render-animation 0.001s;
            animation: chartjs-render-animation 0.001s;
        }
    </style>


    <style>
        .photo {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            border: 1px solid rgb(0, 150, 136);
            margin: 0 auto;
            margin-top: 20px;
            position: relative;
            overflow: hidden;
            background: rgb(0, 150, 136);
        }

        .photo:hover {
            background: #fff;
            border: 1 solid rgb(0, 150, 136);
        }

        #file {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            z-index: 999;
            cursor: pointer;
        }

        .photo p {
            line-height: 150px;
            color: #ccc;
            font-size: 18px;
            position: absolute;
            z-index: 99;
            left: 35px;
        }

        #img {
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div>
                <form action="${ctx}/admin/updateAdmin" onsubmit="return subMit()" method="post">
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="title" name="id" value="${admins.id}"/>
                    </div>
                    <div class="form-group">
                        <label for="username">真实姓名</label>
                        <input type="text" class="form-control" id="username" disabled
                               name="username"
                               value="${admins.username}"/>
                        <span id="msg"></span>
                    </div>
                    <div class="form-group">
                        <label for="keywords">个性签名</label>
                        <textarea rows="3" onblur="return onBulUserName()" class="form-control" id="keywords" name="sign">${admins.sign}</textarea>
                        <span id="msgkeywords"></span>
                    </div>
                    <div class="form-group">
                        <label for="email">我的邮箱</label>
                        <input type="text" class="form-control" onblur="return OnBulEmail()" id="email" name="email" value="${admins.email}"/>
                        <span id="msgemail"></span>
                    </div>
                    <div class="form-group">
                        <label for="address">我的地址</label>
                        <input type="text" class="form-control" id="address" onblur="return OnBulAddress()" name="address" value="${admins.address}"/>
                        <span id="msgaddress"></span>
                    </div>


                    <div class="form-group">
                        <input type="hidden" class="form-control" id="register_time"
                               name="register_time"
                               value="<fmt:formatDate value="${admins.register_time}"/>"
                        />
                    </div>
                    <input type="submit" class="btn btn-warning" value="在线更改"/>
                </form>
                <form action="${ctx}/admin/updatePhoto"  method="post"  enctype="multipart/form-data" onsubmit="return submitFile()">
                    <div class="photo">
                        <input type="file" name="file" accept="" id="file">
                        <img src="${ctx}/${admins.photo}" id="img" alt="">
                    </div>
                    <script>
                        $("#file").change(function (e) {
                            var files = e.target.files[0];
                            if (!/image\/\w+/.test(files.type)) {
                                alert("请上传图片");
                                return;
                            }
                            var reader = new FileReader();
                            reader.readAsDataURL(files);
                            reader.onload = function () {
                                var url = this.result;
                                $("#img").attr('src', url);
                                $(".photo>p").html(' ');
                            };
                            console.log(e.target.files[0])
                        })
                    </script>
                    <div style=" width: auto; margin-top: 10px;margin-left: 46%;"><input type="submit" class="btn btn-success " value="点我更换"/></div>
                </form>
            </div>
        </main>

<!-- Bootstrap core JavaScript
================================================== -->
<script src="${ctx}/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${ctx}/asserts/js/popper.min.js"></script>
<script type="text/javascript" src="${ctx}/asserts/js/bootstrap.min.js"></script>
<script>

    function submitFile() {
        if($("#file").val()!=''){
            return true;
        }else{
            alert("头像不能为空!");
            return false;
        }
    }

    function subMit(){
        if(onBulUserName() && OnBulEmail() && OnBulAddress()) { //如果 匹配都正确那么:
            return true;
        }else{
            return false;
        }
    }
    //常规用法
    /**
     * 验证真实姓名
    */
    function onBulUserName() {
        if( $("#keywords").val()=='') {
            $("#keywords").css({"border-color": "red"});
            $("#msgkeywords").html("<p style='color:red;'>个性签名不允许为空.</p>");
            return false;
        }else{
            $("#keywords").css({"border-color": "#4cae4c"});
            $("#msgkeywords").html("<p style='color:#4cae4c;'>√ 该签名可以使用</p>");
            return true;
        }
    }

    /**
     验证邮箱
     * @returns {boolean}
     * @constructor
     */
    function OnBulEmail() {
        var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        var email = $("#email").val();
        if($("#email").val()=='') {
            $("#email").css({"border-color": "red"});
            $("#msgemail").html("<p style='color:red;'>邮箱不允许为空.</p>");
            return false;
        }else if(!pattern.test(email)){
            $("#email").css({"border-color": "red"});
            $("#msgemail").html("<p style='color:red;'>邮箱格式不正确!</p>");
            return false;
        }else{
            $("#email").css({"border-color": "#4cae4c"});
            $("#msgemail").html("<p style='color:#4cae4c;'>√ 该邮箱可以使用</p>");
            return true;
        }
    }
    function OnBulAddress() {
        if($("#address").val()=='') {
            $("#address").css({"border-color": "red"});
            $("#msgaddress").html("<p style='color:red;'>地址信息不允许为空.</p>");
            return false;
        }else{
            $("#address").css({"border-color": "#4cae4c"});
            $("#msgaddress").html("<p style='color:#4cae4c;'>√ 该地址信息正确!</p>");
            return true;
        }
    }
</script>
<!-- Icons -->
<script type="text/javascript" src="${ctx}/asserts/js/feather.min.js"></script>
<script>
    feather.replace()
</script>

<!-- Graphs -->
<script type="text/javascript" src="${ctx}/asserts/js/Chart.min.js"></script>
<script>
    function fullScreen(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            area: ['70%', '70%'],
            content: url,
            maxmin: true
        });
        layer.full(index);
    }

    function ifdelete(id, title) {
        layer.confirm('确定删除该文章吗?', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            $.ajax({
                type: 'POST',
                url: '${ctx}/api/admin/del',
                datatype: 'json',
                data: {"id": id},
                success: function (data) {
                    if (data['stateCode'] == 1) {
                        layer.msg('删除成功!', {icon: 1, time: 1000});
                        setTimeout("window.location.reload()", 1000);
                    }
                    else {
                        layer.msg('删除失败!', {icon: 5, time: 1000});
                    }
                },
                error: function (data) {
                    console.log('错误...');
                },
            });
        }, function () {

        });
    }
</script>
<script>
    var ctx = document.getElementById("myChart");
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["文章数", "评论数", "用户数量", "登陆次数"],
            datasets: [{
                data: [${adminCount}, ${commentCount}, ${adminCount}, ${loginNum}],
                lineTension: 0,
                backgroundColor: 'transparent',
                borderColor: '#007bff',
                borderWidth: 4,
                pointBackgroundColor: '#007bff'
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            },
            legend: {
                display: false,
            }
        }
    });
</script>
<script type="text/javascript">
    //文章搜索
    function submitSeach() {
        var word = $("#word").val();
        if (word == '') {
            new TipBox({type: 'tip', str: '请输入博客信息', clickDomCancel: true, setTime: 10000500, hasBtn: true});
            return false;
        } else {
            //alert(word);
            /*$.ajax({
                type:"GET",
                url:"",
                data:{"word":word}
            });*/
            window.location.href = "${ctx}/admin/admin/search?word=" + word;
        }
    }

</script>

</body>

</html>