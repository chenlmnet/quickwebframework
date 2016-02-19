<#import "/spring.ftl" as spring />
<#include "param.ftl"/>

<#macro viewport>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
</#macro>

<#--导入bootstrap3-->
<#macro bootstrap title >
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title> ${title} </title>
<!-- Bootstrap -->
<link href="<@spring.url '/lib-js/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<@spring.url '/lib-js/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script type="text/javascript" src='<@spring.url "/lib-js/html5/html5shiv.min.js"/>'></script>
<script type="text/javascript" src='<@spring.url "/lib-js/html5/respond.min.js"/>'></script>
<script type="text/javascript" src='<@spring.url "/lib-js/html5/DOMAssistantCompressed-2.7.4.js"/>'></script>
<script type="text/javascript" src='<@spring.url "/lib-js/html5/ie-css3.js"/>'></script>
<![endif]-->
<script type="text/javascript" src="<@spring.url '/lib-js/jquery/jquery-1.11.3.min.js'/>"></script>
<script type="text/javascript" src="<@spring.url '/lib-js/bootstrap/js/bootstrap.min.js'/>"></script>
</#macro>

<#--导入公共css-->
<#macro css>
<link href="<@spring.url '/css/layout.black.css'/>" rel="stylesheet">
</#macro>

<#--导航菜单-->
<#macro nav title url links=[]>
    <#if rc.requestUri == rc.contextPath + url>
    <a href="<@spring.url '${url}'/>" class="list-group-item active">${title}</a>
    <#else>
        <#list links as link>
            <#if rc.requestUri == rc.contextPath + link>
            <a href="<@spring.url '${url}'/>" class="list-group-item active">${title}</a>
                <#return >
            </#if>
        </#list>
    <a href="<@spring.url '${url}'/>?random=${.now?string['yyyyMMddhhmmssSSS']}" class="list-group-item">${title}</a>
    </#if>
</#macro>

<#macro msgbox id title content>
<div class="modal fade" id="${id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="${id}_title">${title}</h4>
            </div>
            <div class="modal-body" id="${id}_content">
            ${content}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
</#macro>

<#macro md5js>
<script type="text/javascript" src='<@spring.url "/lib-js/md5.js"/>'></script>
</#macro>

<#macro provCityJs>
<script type="text/javascript" src='<@spring.url "/lib-js/provCity.js"/>'></script>
</#macro>

<#macro products>
<script type="text/javascript" src='<@spring.url "/lib-js/products.js"/>'></script>
</#macro>

<#macro flashVcode>
<script type="text/javascript">
    $(function () {
        $("img.vcode, a.vcode").click(function () {
            $("img.vcode").attr("src", "<@spring.url '/vcode'/>?random=" + new Date().getTime());
        });
    })
</script>
</#macro>

<#macro copyJs>
<script type="text/javascript">
    function copyText(obj) {
        var rng = document.body.createTextRange();
        rng.moveToElementText(obj);
        rng.scrollIntoView();
        rng.select();
        rng.execCommand("Copy");
        rng.collapse(false);
        alert("复制成功");
    }
</script>
</#macro>

<#macro cutTitle title length>
    <#if title?length gt length>
    ${title[0..length-1]}...
    <#else>
    ${title}
    </#if>
</#macro>

<#macro pager page last tab>
<div class="panel-footer text-right">
    <form class="form-horizontal" method="get">
        <input type="hidden" name="tab" value="${tab}"/>
        <input type="hidden" name="pagesize" value="${pagesize!""}"/>
        <input type="hidden" name="page" value="${page!""}"/>
    </form>
    <nav>
        <ul class="pagination">
            <#if page<=0>
                <li class="disabled">
                    <a href="#" aria-label="上一页">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
            <#else>
                <li>
                    <a href="#" aria-label="上一页" title="${page}">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
            </#if>
            <#list 0..last as pg>
                <#if page == pg>
                    <li class="disabled">
                        <a>${pg+1}</a>
                    </li>
                <#elseif page gte 0>
                    <li>
                        <a href="#" title="${pg+1}">${pg+1}</a>
                    </li>
                </#if>
            </#list>
            <#if page gte last>
                <li class="disabled">
                    <a href="#" aria-label="下一页">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            <#else >
                <li>
                    <a href="#" aria-label="下一页" title="${page + 2}">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </#if>
        </ul>
    </nav>
</div>
</#macro>