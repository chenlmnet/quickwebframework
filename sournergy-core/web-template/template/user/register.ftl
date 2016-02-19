<#import "/spring.ftl" as spring />
<#import "../comm/comm.ftl" as comm/>
<!DOCTYPE html>
<html>
<head lang="en">
<#assign title="注册"/>
<@comm.bootstrap "${title!''}"/>
<@comm.css/>
<@comm.md5js/>
</head>
<body>
<h1 class="sr-only">制造业点评网</h1>

<!-- header area -->
<div id="headerContainer">
<#include "../comm/header.ftl"/>
</div>

<div class="container" style="margin-top: 10px;">
    <!-- main area -->
    <div class="row">
        <!-- content -->
        <div id="contentContainer"
             class="col-xs-8 col-xs-offset-2 col-sm-6 col-sm-offset-3 col-md-5 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5>
                        <span class="glyphicon glyphicon-user"></span>
                        注册
                    </h5>
                </div>
                <div class="panel-body">
                <#if msg ??>
                    <div class="alert alert-danger" role="alert">${msg!""}</div>
                </#if>
                    <form class="form-horizontal" method="post">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>

                            <div class="col-sm-10">
                                <input class="form-control" placeholder="用户名" type="text" name="userName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>

                            <div class="col-sm-10">
                                <input class="form-control" placeholder="邮箱" type="email" name="email"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>

                            <div class="col-sm-10">
                                <input class="form-control" placeholder="密码" type="password" name="passWord"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">确认密码</label>

                            <div class="col-sm-10">
                                <input class="form-control" placeholder="再次输入密码" type="password" name="passWord2"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">验证码</label>

                            <div class="col-sm-6">
                                <input dirname="vcode" class="form-control" autocomplete="off" placeholder="验证码" type="text" name="vcode"/>
                            </div>
                            <div class="col-sm-4">
                                <img class="vcode" src="<@spring.url '/vcode'/>"/>
                                <a class="vcode" href="#">看不清？</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邀请码</label>

                            <div class="col-sm-7">
                                <input class="form-control" placeholder="邀请码" type="text" name="inviteCode"/>
                            </div>
                            <div class="col-sm-3 v_bottom">
                                （可选）
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary center-block">注册</button>
                    </form>
                </div>
                <div class="panel-footer text-right">
                    <a href="<@spring.url '/user/login'/>">已有账号，立即登录</a>
                </div>
            </div>
        </div>
    </div>
    <!-- page footer -->
    <div id="footerContainer">
    <#include "../comm/footer.ftl"/>
    </div>
</div>
<@comm.flashVcode/>
</body>
</html>