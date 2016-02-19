<#import "/spring.ftl" as spring />
<#import "../comm/comm.ftl" as comm/>
<!DOCTYPE html>
<html>
<head lang="en">
<#assign title="登录"/>
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
                        登录
                    </h5>
                </div>
                <div class="panel-body">
                <#if msg ??>
                    <div class="alert alert-danger" role="alert">${msg!""}</div>
                </#if>
                    <form class="form-horizontal" method="post" action="<@spring.url '/user/login'/>">
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-offset-1 control-label">用户名</label>

                            <div class="col-sm-8">
                                <!-- username -->
                                <input class="form-control displayMode" placeholder="用户名" type="text"
                                       name="userName" id="authenticationUsername"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-offset-1 control-label">密码</label>

                            <div class="col-sm-8">
                                <!-- password -->
                                <input class="form-control displayMode" name="passWord"
                                       placeholder="密码" type="password"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-offset-1 control-label">验证码</label>

                            <div class="col-sm-4">
                                <input name="vcode" class="form-control" autocomplete="off" placeholder="验证码" type="text"/>
                            </div>
                            <div class="col-sm-4">
                                <img class="vcode" src="<@spring.url '/vcode?random='+.now?string('yyyyMMddHHmmssSS') />"/>
                                <a class="vcode" href="#">看不清？</a>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <button type="submit" class="btn btn-primary center-block">
                                <span>登录</span>
                            </button>
                        </div>
                    </form>
                </div>
                <div class="panel-footer text-right">
                    <a class="clearBoth right" href="<@spring.url '/user/register'/>">
                        注册
                    </a>
                    |
                    <a class="clearBoth right" href="{$sign.up.reset.password.URL}">
                        忘记密码?
                    </a>
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