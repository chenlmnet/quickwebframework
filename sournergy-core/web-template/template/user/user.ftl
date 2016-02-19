<#import "/spring.ftl" as spring />
<#import "../comm/comm.ftl" as comm/>
<!DOCTYPE html>
<html>
<head lang="en">
<#assign title="用户中心"/>
<@comm.bootstrap "${title!''}"/>
<@comm.css/>
<@comm.md5js/>
</head>
<body>
<body>
<h1 class="sr-only">制造业点评网</h1>

<!-- header area -->
<div id="headerContainer">
<#include "../comm/header.ftl"/>
</div>
<#assign commentLength=30/>
<#assign titleLength=20/>
<div class="container" style="margin-top: 10px;">
    <!-- main area -->
    <div class="row">
        <!-- content -->
        <div id="contentContainer" class="col-md-12">
            <div class="panel panel-default panel_user">
                <div class="panel-heading">
                    <h5>
                        <span class="glyphicon glyphicon-user"></span>
                        用户中心
                    </h5>
                </div>
                <div class="panel-body">
                <#if login??>
                    <div class="row user_info">
                        <div class="col-md-2">
                            <div class="col-md-12 text-center" style="margin-bottom: 10px;">
                                <div class="col-md-6" style="border-right: 1px dotted lightgray;">
                                    <span class="glyphicon glyphicon-eye-open"></span>

                                    <div>关注了${(login.focusUsers?size)!0}人</div>
                                </div>
                                <div class="col-md-6">
                                    <span class="glyphicon glyphicon-eye-close"></span>

                                    <div>被关注${(login.bfocusUsers?size)!0}人</div>
                                </div>
                            </div>
                            <div class="col-md-12 text-center">
                                <span class="glyphicon glyphicon-transfer"></span>

                                <div>关注了${(login.companies?size)!0}家公司</div>
                            </div>
                            <img class="img-thumbnail"
                                 src="{$path.resources.components}/core/admin-welcome-page/icon_manual_72x72.png"/>

                            <h3>${login.userName}</h3>
                            <a class="btn btn-default btn-xs">修改基本信息</a>
                            <a class="btn btn-default btn-xs">申请认证</a>

                            <div>
                                <span class="glyphicon glyphicon-lock"></span>
                            ${login.role.description}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-share-alt"></span>
                                邀请码：${login.inviteCode}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-ok-sign"></span>
                                已邀请20人
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-grain"></span>
                                积分：${login.score}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-map-marker"></span>
                                所在地：${login.location!""}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-copyright-mark"></span>
                                所在公司：${login.companyName!""}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-education"></span>
                            ${login.univercity!""} | ${login.professional!""}
                            </div>
                            <p>
                            ${login.description!""}
                            </p>
                        </div>
                        <div class="col-md-10 info_box">
                            <ul class="nav nav-tabs">
                                <li class="active" role="presentation">
                                    <a>所有动态
                                        <span class="badge">12</span>
                                    </a>
                                </li>
                            <#--<li role="presentation">
                                <a>收到的消息
                                    <span class="badge">12</span>
                                </a>
                            </li>-->
                                <li role="presentation">
                                    <a>朋友的动态
                                        <span class="badge">${(login.focusUsers?size)!0}</span>
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a>评论的公司
                                        <span class="badge">${(login.comments?size)!0}</span>
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a>关注的公司
                                        <span class="badge">${(login.companies?size)!0}</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="alert alert-info alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                        <strong>1</strong>消息一
                                    </div>
                                    <div class="alert alert-info alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                        <strong>2</strong>消息二
                                    </div>
                                    <div class="alert alert-info alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                        <strong>3</strong>消息三
                                    </div>
                                    <div class="alert alert-info alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                        <strong>4</strong>消息四
                                    </div>
                                </div>
                            </div>
                        <#--<div class="panel panel-default hidden">
                            <div class="panel-body">
                                <div class="alert alert-info alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                    <strong>1</strong>消息一
                                </div>
                                <div class="alert alert-info alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                    <strong>2</strong>消息二
                                </div>
                                <div class="alert alert-info alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                    <strong>3</strong>消息三
                                </div>
                                <div class="alert alert-info alert-dismissible" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true" class="glyphicon glyphicon-remove"></span></button>
                                    <strong>4</strong>消息四
                                </div>
                            </div>
                        </div>-->
                            <div class="panel panel-default hidden">
                                <div class="panel-body">
                                    <#if login.focusUsers?? && login.focusUsers?size gt 0>
                                        <#list login.focusUsers as fuser>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">朋友 ${fuser.userName} 的动态
                                                    <button alt="${fuser.id}"
                                                            class="btn btn-primary btn-xs btn_cancel_focus">取消关注
                                                    </button>
                                                </div>

                                            <#--<div class="panel-body">关注</div>-->
                                                <#if fuser.companies?? && fuser.companies?size gt 0>
                                                    <table class="table table-hover">
                                                        <caption>他关注的公司</caption>
                                                        <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>公司名</th>
                                                            <th>添加人</th>
                                                            <th>添加时间</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                            <#list fuser.companies as company>
                                                            <tr>
                                                                <td>${company_index+1}</td>
                                                                <td><@comm.cutTitle company.title titleLength/></td>
                                                                <td>${(company.aUser.userName)!""}</td>
                                                                <td>${(company.opttime)?string("yyyy-MM-dd")}</td>
                                                            </tr>
                                                            </#list>
                                                        </tbody>
                                                    </table>
                                                </#if>
                                                <#if fuser.comments?? && fuser.comments?size gt 0>
                                                    <table class="table table-hover">
                                                        <caption>他发布的评论</caption>
                                                        <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>评论</th>
                                                            <th>公司</th>
                                                            <th>评论时间</th>
                                                        </tr>
                                                        </thead>
                                                        <#list fuser.comments as comment>
                                                            <tr>
                                                                <td>${comment_index+1}</td>
                                                                <td><@comm.cutTitle comment.content commentLength/></td>
                                                                <td><@comm.cutTitle comment.company.title titleLength/></td>
                                                                <td>${(comment.date?string("yyyy-MM-dd"))!""}</td>
                                                            </tr>
                                                        </#list>
                                                    </table>
                                                </#if>
                                                <#if fuser.focusUsers?? && fuser.focusUsers?size gt 0>
                                                    <table class="table table-hover">
                                                        <caption>他关注的朋友</caption>
                                                        <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>姓名</th>
                                                            <th>关注/被关注</th>
                                                            <th>关注公司数</th>
                                                        </tr>
                                                        </thead>
                                                        <#list fuser.focusUsers as user>
                                                            <tr>
                                                                <td>${user_index+1}</td>
                                                                <td>${user.userName}</td>
                                                                <td>${(user.focusUsers?size)!0}
                                                                    /${(user.bfocusUsers?size)!0}</td>
                                                                <td>${(user.companies?size)!0}</td>
                                                            </tr>
                                                        </#list>
                                                    </table>
                                                </#if>
                                            </div>
                                        </#list>
                                    <#else>
                                        <div class="alert alert-warning">
                                            您还没有关注朋友
                                        </div>
                                    </#if>
                                </div>
                            </div>
                            <div class="panel panel-default hidden">
                                <div class="panel-body">
                                    <#if login.comments??>
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>评论</th>
                                                <th>公司</th>
                                                <th>评论时间</th>
                                            </tr>
                                            </thead>
                                            <#list login.comments as comment>
                                                <tr>
                                                    <td>${comment_index+1}</td>
                                                    <td><@comm.cutTitle comment.content commentLength/></td>
                                                    <td><a href="<@spring.url '/comp/info'/>?id=${comment.company.id}"><@comm.cutTitle comment.company.title titleLength/></a></td>
                                                    <td>${(comment.date?string("yyyy-MM-dd"))!""}</td>
                                                </tr>
                                            </#list>
                                        </table>
                                    <#else>
                                        <div class="alert alert-warning">
                                            您还没有评论公司
                                        </div>
                                    </#if>
                                </div>
                            </div>
                            <div class="panel panel-default hidden">
                                <div class="panel-body">
                                    <#if login.companies??>
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>公司名</th>
                                                <th>添加人</th>
                                                <th>添加时间</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <#list login.companies as company>
                                                <tr>
                                                    <td>${company_index+1}</td>
                                                    <td><@comm.cutTitle company.title titleLength/></td>
                                                    <td>${(company.aUser.userName)!""}</td>
                                                    <td>${(company.opttime)?string("yyyy-MM-dd")}</td>
                                                </tr>
                                                </#list>
                                            </tbody>
                                        </table>
                                    <#else>
                                        <div class="alert alert-warning">
                                            您还没有关注公司
                                        </div>
                                    </#if>

                                <#--<#if login.createCompanies??>
                                    <#list login.createCompanies as company>
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                            <button type="button" class="close" data-dismiss="alert"
                                                    aria-label="Close">
                                                <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            您创建了 <a href="<@spring.url '/comp/info'/>?id=${company.id}"><strong>${(company.title)!""}</strong></a>
                                        </div>
                                    </#list>
                                <#else>
                                    <div class="alert alert-warning">
                                        您还没有创建公司
                                    </div>
                                </#if>-->

                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("ul.nav li").each(function (n) {
                        $(this).click(function () {
                            $(this).addClass("active").siblings().removeClass("active");
                            $("div.info_box>div.panel").addClass("hidden").eq(n).removeClass("hidden");
                        });
                    });
                });
            </script>
        </div>
    </div>
    <script type="text/javascript">
        $("button.btn_cancel_focus").click(function () {
        <#if login??>
            $.ajax({
                url: '<@spring.url "/user/focus"/>',
                method: "post",
                traditional: true,
                data: {id: $(this).attr("alt"), focus: false},
                dataType: "json",
                success: function (data) {
                    if (data.code == 0) {
                        alert("取消关注成功");
                        location.reload();
                    } else {
                        alert("取消关注失败");
                    }
                },
                error: function () {
                    alert("服务器忙");
                }
            });
        <#else>
            alert("请登录后取消关注");
        </#if>
        });
    </script>
    <!-- page footer -->
    <div id="footerContainer">
    <#include "../comm/footer.ftl"/>
    </div>
</div>
</body>
</html>