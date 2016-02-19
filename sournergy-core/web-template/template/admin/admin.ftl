<#import "/spring.ftl" as spring />
<#import "../comm/comm.ftl" as comm/>
<!DOCTYPE html>
<html>
<head lang="en">
<#assign title="管理中心"/>
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
        <div id="contentContainer" class="col-md-12">
            <div class="panel panel-default panel_user">
                <div class="panel-heading">
                    <h5>
                        <span class="glyphicon glyphicon-user"></span>
                        管理中心
                    </h5>
                </div>
                <div class="panel-body">
                    <div class="row user_info">
                        <div class="col-md-2">
                            <div class="alert alert-success" role="alert">
                                管理员：${login.userName}
                                <a class="btn btn-default btn-sm">修改密码</a>
                            </div>
                            <div class="alert alert-info" role="alert" style="overflow: hidden;">
                                <div>
                                    登录时间：<br/>
                                ${.now?string("yyyy-MM-dd hh:mm:ss")}
                                </div>
                                <div>
                                    系统时间：<br/>
                                ${.now?string("yyyy-MM-dd hh:mm:ss")}
                                </div>
                            </div>
                        </div>
                    <#assign paramHide='hidden' tagsHide='hidden' userHide='hidden' compHide='hidden' commentHide='hidden' paramActive='' tagsActive='' userActive='' compActive='' commentActive=''/>
                    <#if !RequestParameters.tab?? || RequestParameters.tab == 'param'>
                        <#assign paramHide='' paramActive='active'/>
                    <#elseif RequestParameters.tab == 'tags'>
                        <#assign tagsHide='' tagsActive='active'/>
                    <#elseif RequestParameters.tab == 'user'>
                        <#assign userHide='' userActive='active'/>
                    <#elseif RequestParameters.tab == 'comp'>
                        <#assign compHide='' compActive='active'/>
                    <#elseif RequestParameters.tab == 'comment'>
                        <#assign commentHide='' commentActive='active'/>
                    <#else>
                        <#assign paramHide='' paramActive='active'/>
                    </#if>
                        <div class="col-md-10 info_box">
                            <ul class="nav nav-tabs">
                                <li class="${paramActive}" role="presentation">
                                    <a>系统参数</a>
                                </li>
                                <li class="${tagsActive}" role="presentation">
                                    <a>标签管理</a>
                                </li>
                                <li class="${userActive}" role="presentation">
                                    <a>会员管理</a>
                                </li>
                                <li class="${compActive}" role="presentation">
                                    <a>公司管理</a>
                                </li>
                                <li class="${commentActive}" role="presentation">
                                    <a>评论管理</a>
                                </li>
                            </ul>
                            <!--参数设置-->
                            <div class="panel panel-default ${paramHide}">
                                <div class="panel-body">
                                    <form class="form-horizontal" method="post">
                                        <input type="hidden" name="tab" value="param"/>

                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">网站名</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control"
                                                       value="${(pmap["sys.sitename"])!""}"
                                                       name="sys.sitename"
                                                       placeholder="站点名称"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">网站宗旨</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control"
                                                       value="${(pmap["sys.sitedesc"])!""}"
                                                       name="sys.sitedesc"
                                                       placeholder="网站宗旨"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">排序指数</label>

                                            <div class="col-sm-10">
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon">关注数</span>
                                                    <input type="text" class="form-control" name="sort.focus"
                                                           value="${(pmap["sort.focus"])!""}"
                                                           placeholder="关注数权重"/>
                                                </div>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon">点赞数</span>
                                                    <input type="text" class="form-control" name="sort.updown"
                                                           value="${(pmap["sort.updown"])!""}"
                                                           placeholder="点赞数权重"/>
                                                </div>
                                                <div class="col-sm-4 input-group">
                                                    <span class="input-group-addon">调整数</span>
                                                    <input type="text" class="form-control" name="sort.manual"
                                                           value="${(pmap["sort.manual"])!""}"
                                                           placeholder="手动调整数权重"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">发件服务器smtp</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control"
                                                       value="${(pmap["sys.smtp"])!""}"
                                                       name="sys.smtp"
                                                       placeholder="发件服务器"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">发件人账号</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control"
                                                       value="${(pmap["sys.account"])!""}"
                                                       name="sys.account"
                                                       placeholder="发件人账号"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPassword3" class="col-sm-2 control-label">发件人密码</label>

                                            <div class="col-sm-10">
                                                <input type="password" class="form-control"
                                                       value="${(pmap["sys.password"])!""}"
                                                       name="sys.password"
                                                       placeholder="发件人密码"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-default">保存</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="panel panel-default ${tagsHide}">
                                <div class="panel-body tags">

                                    <h3>行业标签</h3>

                                <#list busi?sort_by("id") as business>
                                    <div alt="${business.id}" class="btn btn-default tag_remove">${business.name}
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </div>
                                </#list>
                                    <div class="btn btn-warning" data-toggle="modal" data-target="#myModal"
                                         data-type="busi">
                                        <span class="glyphicon glyphicon-plus-sign"></span>
                                        添加行业
                                    </div>
                                </div>
                                <div class="panel-body tags">
                                    <h3>专业能力标签</h3>

                                <#list pro?sort_by("id") as prof>
                                    <#if prof.name == 'pro'>
                                        <#list prof.children?sort_by("id") as p0>
                                            <dl>
                                                <dt>${p0.name}
                                                <div class="btn btn-warning btn-sm" data-toggle="modal" data-type="pro"
                                                     data-pid="${p0.id}" data-target="#myModal">
                                                    <span class="glyphicon glyphicon-plus-sign"></span>
                                                    新增
                                                </div>
                                                </dt>
                                                <dd>
                                                    <#list p0.children?sort_by("id") as p1>
                                                        <div alt="${p1.id}"
                                                             class="btn btn-default tag_remove">${p1.name}
                                                            <span class="glyphicon glyphicon-remove"></span>
                                                        </div>
                                                        <div class="btn btn-warning btn-sm" data-toggle="modal"
                                                             data-type="pro" data-pid="${p1.id}"
                                                             data-target="#myModal">
                                                            <span class="glyphicon glyphicon-plus-sign"></span>
                                                            新增
                                                        </div>
                                                        <div class="col-xs-offset-1">
                                                            <#list p1.children?sort_by("id") as p2>
                                                                <div alt="${p2.id}"
                                                                     class="btn btn-default btn-sm tag_remove">
                                                                ${p2.name}
                                                                    <span class="glyphicon glyphicon-remove"></span>
                                                                </div>
                                                            </#list>
                                                        </div>
                                                    </#list>
                                                </dd>
                                            </dl>
                                        </#list>
                                    </#if>
                                </#list>
                                </div>
                                <div class="panel-body tags">
                                    <h3>质量体系标签</h3>

                                <#list quality?sort_by("id") as qual>
                                    <div alt="${qual.id}" class="btn btn-default tag_remove">${qual.name}
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </div>
                                </#list>
                                    <div class="btn btn-warning" data-toggle="modal" data-type="quality"
                                         data-target="#myModal">
                                        <span class="glyphicon glyphicon-plus-sign"></span>
                                        添加质量体系
                                    </div>
                                </div>

                                <div class="panel-body tags">
                                    <h3>总体评价标签</h3>

                                <#list votes?sort_by("id") as vote>
                                    <div alt="${vote.id}" class="btn btn-default tag_remove">${vote.name}
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </div>
                                </#list>
                                    <div class="btn btn-warning" data-toggle="modal" data-type="quality"
                                         data-target="#myModal">
                                        <span class="glyphicon glyphicon-plus-sign"></span>
                                        添加总体评价
                                    </div>
                                </div>

                                <!-- Modal -->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                     aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close"><span aria-hidden="true">&times;</span>
                                                </button>
                                                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                            </div>
                                            <div class="modal-body">
                                                <label>标签名:</label>
                                                <input class="form-control tag_type" type="hidden"/>
                                                <input class="form-control tag_pid" type="hidden"/>
                                                <input class="form-control tag_name"/>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    取消
                                                </button>
                                                <button type="button" class="btn btn-primary save_tag">保存</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(function () {
                                        $("#myModal").on("show.bs.modal", function (e) {
                                            var relatedTarget = e.relatedTarget;
                                            var text = $(relatedTarget).parents("div.tags").find("h3").text();
                                            $(this).find("h4.modal-title").text("添加" + text);
                                            $("input.tag_type").val($(relatedTarget).attr("data-type"));
                                            $("input.tag_pid").val($(relatedTarget).attr("data-pid"));
                                        });
                                        $("button.save_tag").click(function () {
                                            $("#myModal").modal("hide");
                                            $.ajax({
                                                url: '<@spring.url "/admin/tag/add"/>',
                                                method: "post",
                                                traditional: true,
                                                data: {
                                                    pid: $("input.tag_pid").val(),
                                                    name: $("input.tag_name").val(),
                                                    type: $("input.tag_type").val()
                                                },
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data.code == 0) {
                                                        alert("添加标签成功");
                                                        location.href = '<@spring.url "/admin"/>?tab=tags';
                                                    } else {
                                                        alert("添加标签失败");
                                                    }
                                                },
                                                error: function () {
                                                    alert("服务器忙");
                                                }
                                            });
                                        });
                                        $("div.tag_remove").click(function () {
                                            if (confirm("确认删除标签：" + $(this).text().trim())) {
                                                $.ajax({
                                                    url: '<@spring.url "/admin/tag/delete"/>',
                                                    method: "post",
                                                    traditional: true,
                                                    data: {id: $(this).attr("alt")},
                                                    dataType: "json",
                                                    success: function (data) {
                                                        if (data.code == 0) {
                                                            alert("删除加标签成功");
                                                            location.href = '<@spring.url "/admin"/>?tab=tags';
                                                        } else {
                                                            alert("删除标签失败");
                                                        }
                                                    },
                                                    error: function () {
                                                        alert("服务器忙");
                                                    }
                                                });
                                            }
                                        });
                                    });
                                </script>
                            </div>
                            <div class="panel panel-default ${userHide}">
                            <#if users.content?? && users.content?size gt 0>
                                <div class="panel-body">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>会员</th>
                                            <th>类型</th>
                                            <th>邮箱</th>
                                            <th>公司邮箱</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <#list users.content as user>
                                            <tr>
                                                <td>${user_index + 1}</td>
                                                <td>
                                                    <a href="<@spring.url '/user/center'/>?id=${user.id}">${(user.userName)!}</a>
                                                </td>
                                                <td>${(user.role.description)!}</td>
                                                <td>${(user.email)!}</td>
                                                <td>${(user.companyEmail)!}</td>
                                                <td>
                                                    <#if (user.role)??>
                                                        <#if (user.enabled)>
                                                            <div alt="${user.id}" class="btn btn-warning user_forbid">
                                                                禁用
                                                            </div>
                                                        <#else>
                                                            <div alt="${user.id}" class="btn btn-warning user_normal">
                                                                启用
                                                            </div>
                                                        </#if>
                                                        <#switch user.role.level>
                                                            <#case 0>
                                                            <#case 2>
                                                                <div alt="${user.id}" class="btn btn-primary user_adv">
                                                                    审核为专业会员
                                                                </div>
                                                                <#break>
                                                            <#case 3>
                                                                <div alt="${user.id}"
                                                                     class="btn btn-danger user_normal">调整为普通会员
                                                                </div>
                                                                <#break>
                                                            <#default>
                                                        </#switch>
                                                    <#else>
                                                        <div class="btn btn-warning">禁用</div>
                                                        <div class="btn btn-danger">调整为普通会员</div>
                                                    </#if>
                                                </td>
                                            </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>

                                <#assign page=users.number/>
                                <#assign last=users.totalPages - 1/>
                                <@comm.pager page last "user"/>
                            <#else>

                            </#if>
                                <#--todo-->
                                <script type="text/javascript">
                                    $("div.tag_remove").click(function () {
                                        if (confirm("确认删除标签：" + $(this).text().trim())) {
                                            $.ajax({
                                                url: '<@spring.url "/admin/tag/delete"/>',
                                                method: "post",
                                                traditional: true,
                                                data: {id: $(this).attr("alt")},
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data.code == 0) {
                                                        alert("删除加标签成功");
                                                        location.href = '<@spring.url "/admin"/>?tab=tags';
                                                    } else {
                                                        alert("删除标签失败");
                                                    }
                                                },
                                                error: function () {
                                                    alert("服务器忙");
                                                }
                                            });
                                        }
                                    });

                                </script>
                            </div>
                            <div class="panel panel-default ${compHide}">
                            <#if companies.content?? && companies.content?size gt 0>
                                <div class="panel-body">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>公司名</th>
                                            <th>添加人</th>
                                            <th>添加时间</th>
                                            <th>关注/点赞/评论</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <#list companies.content as company>
                                            <tr>
                                                <td>${company_index + 1}</td>
                                                <td>
                                                    <a href="<@spring.url '/comp/info'/>?id=${company.id}"><@comm.cutTitle company.title 20/></a>
                                                </td>
                                                <td>${(company.aUser.userName)!}</td>
                                                <td>${(company.opttime?string("yyyy-MM-dd hh:mm:ss"))!}</td>
                                                <td>${(company.focusUsers?size)!0}/${(company.votes?size)!0}
                                                    /${(company.comments?size)!0}</td>
                                                <td>
                                                    <div class="btn btn-warning">删除</div>
                                                    <div class="btn btn-warning">修改</div>
                                                </td>
                                            </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                                <#assign page=companies.number/>
                                <#assign last=companies.totalPages - 1/>
                                <@comm.pager page last "comp"/>
                            </#if>
                            </div>
                            <div class="panel panel-default ${commentHide}">
                            <#if comments.content?? && comments.content?size gt 0>
                                <div class="panel-body">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>公司名</th>
                                            <th>评论人</th>
                                            <th>评论时间</th>
                                            <th>顶/踩数</th>
                                            <th>评论内容</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <#list comments.content as comment>
                                            <tr>
                                                <td>${comment_index + 1}</td>
                                                <td>
                                                    <a href="<@spring.url '/comp/info'/>?id=${(comment.company.id)!}"><@comm.cutTitle comment.company.title 20/></a>
                                                </td>
                                                <td>${(comment.auser.userName)!}</td>
                                                <td>${(comment.auser.opttime)!}</td>
                                                <#assign up=0 down=0/>
                                                <#if comment.votes??>
                                                    <#list comment.votes as vote>
                                                        <#if vote.updown>
                                                            <#assign up=up+1/>
                                                        <#else>
                                                            <#assign down=down+1/>
                                                        </#if>
                                                    </#list>
                                                </#if>
                                                <td>${up}/${down}</td>
                                                <td><@comm.cutTitle comment.content 40/></td>
                                                <td>
                                                    <button alt="${(comment.id)!}"
                                                            class="btn btn-warning comment_delete">删除
                                                    </button>
                                                </td>
                                            </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                                <#assign page=comments.number/>
                                <#assign last=comments.totalPages - 1/>
                                <@comm.pager page last "comment"/>
                            </#if>
                                <script type="text/javascript">
                                    $(function () {
                                        $("ul.pagination li a").click(function () {
                                            var page = $(this).attr("title");
                                            if (page != undefined) {
                                                var pagerForm = $(this).parents("nav").siblings("form");
                                                pagerForm.find("input[name=page]").val(page - 1);
                                                pagerForm.submit();
                                            }
                                            return false;
                                        });
                                        $("button.comment_delete").click(function () {
                                            $.ajax({
                                                url: '<@spring.url "/admin/comment/delete"/>',
                                                method: "post",
                                                traditional: true,
                                                data: {id: $(this).attr("alt")},
                                                dataType: "json",
                                                success: function (data) {
                                                    if (data.code == 0) {
                                                        alert("评论删除成功");
                                                        location.href = '<@spring.url "/admin"/>?tab=comment';
                                                    } else {
                                                        alert("评论删除失败");
                                                    }
                                                },
                                                error: function () {
                                                    alert("服务器忙");
                                                }
                                            });
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("ul.nav li").each(function (n) {
                        $(this).click(function () {
                            $(this).addClass("active").siblings().removeClass("active");
                            $("div.info_box div.panel").addClass("hidden").eq(n).removeClass("hidden");
                        });
                    });
                });
            </script>
        </div>
    </div>
    <!-- page footer -->
    <div id="footerContainer">
    <#include "../comm/footer.ftl"/>
    </div>
</div>
</body>
</html>