<#import "/spring.ftl" as spring />
<#import "comm/comm.ftl" as comm/>
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
<#switch code>
    <#case "role">
        <#assign rt_title="角色错误" rt_msg="用户角色有误，没有权限访问"/>
        <#break >
    <#case "forbidden">
        <#assign rt_title="权限不足" rt_msg="没有权限访问"/>
        <#break >
    <#case "role">
        <#assign rt_title="角色错误" rt_msg="用户角色有误"/>
        <#break >
    <#case "nologin">
        <#assign rt_title="请登录" rt_msg="您没有登录或登录已失效"/>
        <#break >
    <#case "useridnotexists">
        <#assign rt_title="用户不存在" rt_msg="用户不存在"/>
        <#break >
    <#default>
        <#assign rt_title="未知错误" rt_msg="未知错误"/>
</#switch>
<!-- header area -->
<div id="headerContainer">
<#include "comm/header.ftl"/>
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
                    ${rt_title!""}
                    </h5>
                </div>
                <div class="panel-body">
                ${rt_msg!""}
                </div>
            </div>
        </div>
    </div>
    <!-- page footer -->
    <div id="footerContainer">
    <#include "comm/footer.ftl"/>
    </div>
</div>
</body>
</html>