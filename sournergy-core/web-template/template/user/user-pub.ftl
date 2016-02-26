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
<h1 class="sr-only">制造业点评网</h1>

<!-- header area -->
<div id="headerContainer">
<#include "../comm/header.ftl"/>
</div>

<div class="container" style="margin-top: 10px;">
    <!-- company login form -->
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
                <#if user??>
                    <div class="row user_info">
                        <div class="col-md-2">
                            <div class="col-md-12 text-center" style="margin-bottom: 10px;">
                                <div class="col-md-6" style="border-right: 1px dotted lightgray;">
                                    <span class="glyphicon glyphicon-eye-open"></span>

                                    <div>关注了${(user.focusUsers?size)!0}人</div>
                                </div>
                                <div class="col-md-6">
                                    <span class="glyphicon glyphicon-eye-close"></span>

                                    <div>被关注${(user.bfocusUsers?size)!0}人</div>
                                </div>
                            </div>
                            <div class="col-md-12 text-center">
                                <span class="glyphicon glyphicon-transfer"></span>

                                <div>关注了${(user.companies?size)!0}家公司</div>
                            </div>
                            <img class="img-thumbnail"
                                 src="{$path.resources.components}/core/admin-welcome-page/icon_manual_72x72.png"/>

                            <h3>${(user.userName)!"匿名"}
                                <button class="btn btn-warning btn-xs btn_focus">+关注</button>
                            </h3>

                            <div>
                                <span class="glyphicon glyphicon-lock"></span>
                            ${(user.role.description)!""}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-share-alt"></span>
                                邀请码：${login.inviteCode}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-map-marker"></span>
                                所在地：${user.location!""}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-copyright-mark"></span>
                                所在公司：${user.companyName!""}
                            </div>
                            <div>
                                <span class="glyphicon glyphicon-education"></span>
                            ${user.univercity!""} | ${user.professional!""}
                            </div>
                            <p>
                            ${user.description!""}
                            </p>
                        </div>
                        <div class="col-md-10 info_box">
                            <ul class="nav nav-tabs">
                                <li class="active" role="presentation">
                                    <a href="#">评论的公司
                                        <span class="badge">12</span>
                                    </a>
                                </li>
                                <li role="presentation">
                                    <a href="#">添加的公司
                                        <span class="badge">12</span>
                                    </a>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="panel-body">
                                        <div class="alert alert-info alert-dismissible" role="alert">
                                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                <span aria-hidden="true" class="glyphicon glyphicon-remove"></span>
                                            </button>
                                            <em>2015年10月06日</em>
                                            网友AAA<em>评论</em>了
                                            <a href="#">
                                                <xsl:attribute name="href">
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="$path.pulsar"/>
                                                        /.Company.show..?id=106
                                                    </xsl:attribute>
                                                </xsl:attribute>
                                                <strong>某某公司</strong>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </#if>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("button.btn_focus").click(function () {
        <#if login??>
            $.ajax({
                url: '<@spring.url "/user/focus"/>',
                method: "post",
                traditional: true,
                data: {id: '${RequestParameters.id}', focus: true},
                dataType: "json",
                success: function (data) {
                    if (data.code == 0) {
                        alert("关注成功");
                        location.reload();
                    } else {
                        alert("关注失败");
                    }
                },
                error: function () {
                    alert("服务器忙");
                }
            });
        <#else>
            alert("请登录后进行关注");
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