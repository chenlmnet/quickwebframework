<#import "/spring.ftl" as spring />
<#import "../comm/comm.ftl" as comm/>
<!DOCTYPE html>
<html>
<head lang="en">
<#assign title="公司展示页"/>
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
        <div id="contentContainer" class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="pull-right">
                        <button class="btn btn-default i_focus">
                            <span class="glyphicon glyphicon-plus"></span>
                            关注
                            <span style="display: block;">共有${(company.focusUsers?size)!0}人关注</span>
                        </button>
                    </div>
                    <h2>
                    ${(company.title)!""}
                    </h2>
                </div>
                <script type="text/javascript">
                    $(function () {
                        $("button.i_focus").click(function () {
                        <#if login??>
                            $.ajax({
                                url: '<@spring.url "/comp/focus"/>',
                                method: "post",
                                traditional: true,
                                data: {id: '${RequestParameters.id}'},
                                dataType: "json",
                                success: function (data) {
                                    if (data == 0) {
                                        alert("关注成功");
                                        location.reload();
                                    } else if (data == 1) {
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
                    })
                </script>
                <div class="panel-body companyContent">
                    <dl>
                        <dt>
                            公司简介
                            Company Brochure：
                        </dt>
                        <dd>
                            <p>
                                公司成立于xxxx年，有员工${(company.employeeTotal)!""}人，年销售额${(company.turnoverTotal)!""}
                                万人民币，地址位于${(company.province)!""}${(company.city)!""}${(company.district)!""}${(company.address)!""}
                                ，产品主要是xxx、yyy,拥有认证xxx，xxx，客户涉及行业xxxx
                            </p>
                        </dd>
                    </dl>
                </div>
                <div class="panel-footer">
                    <a href="#">
                        <u>我要更正</u>
                    </a>
                    <a class="pull-right showmore" href="#">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        展开详细
                    </a>
                </div>
            </div>
        <#if company.attachments?? && (company.attachments?size gt 0)>
            <div class="panel panel-default products">
                <div class="panel-heading">
                    <h5>产品和证书</h5>
                </div>
                <div class="panel-body">
                    <#list company.attachments?sort_by("id") as attach>
                        <img class="img-thumbnail" src="${springMacroRequestContext.contextPath}${attach.url}"/>
                    </#list>
                </div>
            </div>
        </#if>
            <div class="panel panel-default panel_comp">
                <div class="panel-heading">
                <#--<#if (company.comments?size) gt 0>
                    <div class="pull-right">
                        <a class="sort_" href="">按投票排序</a>
                        |
                        <a href="">按时间排序</a>
                    </div>
                </#if>-->
                    <h5>评论（${(company.comments?size)!0}）</h5>
                </div>
            <#assign more=false/>
            <#list company.comments?sort_by("count")?reverse as comment>
                <#assign hideMore=""/>
                <#if comment_index gt 9>
                    <#assign hideMore="hideMore"/>
                    <#assign more=true/>
                </#if>
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
                <div class="panel-body comments ${hideMore}">
                    <div class="media">
                        <div class="media-left">
                            <button title="赞同" class="btn btn-default commentVote up" alt="${(comment.id)!""}">
                                <span class="glyphicon glyphicon-triangle-top"></span>
                                <span style="display: block;">${up}</span>
                            </button>

                            <button title="反对" class="btn btn-default commentVote down" alt="${(comment.id)!""}">
                                <span class="glyphicon glyphicon-triangle-bottom"></span>
                                <span style="display: block;">${down}</span>
                            </button>
                        </div>
                        <div class="media-body">
                            <dl>
                                <dt>${(comment.auser.userName)!""}</dt>
                                <dd>
                                    <#if comment.votes?? && comment.votes?size gt 0>
                                        <#list comment.votes as vote>
                                            <#if vote.updown>
                                            ${(vote.auser.userName)!""}
                                            </#if>
                                        </#list>
                                        <#if up gt 0>
                                            <span>赞同</span>
                                        </#if>
                                    </#if>
                                </dd>
                                <dd>
                                    <#if comment.votes?? && comment.votes?size gt 0>
                                        <#list comment.votes as vote>
                                            <#if !vote.updown>
                                            ${(vote.auser.userName)!""}
                                            </#if>
                                        </#list>
                                        <#if down gt 0>
                                            <span>反对</span>
                                        </#if>
                                    </#if>
                                </dd>
                                <dd>${(comment.content)!""}</dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </#list>
                <div class="panel-body panel_comment hidden">
                    <label>添加您的评论</label>
                    <textarea id="commentText" class="form-control" name="comment"
                              rows="10"><#if company.comments?? && login??><#list company.comments as comment><#if comment.auser.id == login.id>${(comment.content)!""}</#if></#list></#if></textarea>
                </div>
                <div class="panel-footer text-center">
                    <button class="btn btn-primary btn_comment commentBox" type="button">我要点评</button>
                    <button class="btn btn-primary btn_comment hidden commentSubmit" type="button">确定</button>
                <#if more>
                    <a class="pull-right commentMore">更多点评</a>
                </#if>
                </div>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("button.commentBox").click(function () {
                    <#if login??>
                        $(this).addClass("hidden").siblings().removeClass("hidden");
                        if ($("button.commentSubmit").is(":visible")) {
                            $("div.panel_comment").removeClass("hidden");
                        } else {
                            $("div.panel_comment").addClass("hidden");
                        }
                    <#else>
                        alert("请登录后进行评论");
                    </#if>
                    });
                    $("button.commentSubmit").click(function () {
                    <#if login??>
                        var val = $("#commentText").val();
                        if (val == null || val == "") {
                            alert("请输入评论内容");
                            return false;
                        }
                        var thisBtn = $(this);
                        $.ajax({
                            url: '<@spring.url "/comp/comment"/>',
                            method: "post",
                            traditional: true,
                            data: {id: '${RequestParameters.id}', comment: val},
                            dataType: "json",
                            success: function (data) {
                                if (data == 0) {
                                    alert("评论成功");
                                } else if (data == 1) {
                                    alert("评论失败");
                                }
                                location.reload();
                            },
                            error: function () {
                                alert("服务器忙");
                            }
                        });
                    <#else>
                        alert("请登录后进行评论");
                    </#if>
                    });
                    $("button.commentVote").click(function () {
                    <#if login??>
                        var className = $(this).attr("class");
                        var updown = true;
                        if (className.indexOf("up") != -1) {
                            updown = true;
                        } else if (className.indexOf("down") != -1) {
                            updown = false;
                        }
                        $.ajax({
                            url: '<@spring.url "/comp/updown"/>',
                            method: "post",
                            traditional: true,
                            data: {id: '${RequestParameters.id}', commentid: $(this).attr("alt"), updown: updown},
                            dataType: "json",
                            success: function (data) {
                                if (data == 0) {
                                    alert("投票成功");
                                    location.reload();
                                } else if (data == 1) {
                                    alert("投票失败");
                                }
                            },
                            error: function () {
                                alert("服务器忙");
                            }
                        });
                    <#else>
                        alert("请登录后进行投票");
                    </#if>
                    });
                    $("a.commentMore").click(function () {
                        $("div.comments").show();
                        return false;
                    });
                });
            </script>
        </div>

        <!-- page sidebar -->
        <div id="sidebarContainer" class="col-md-3">
            <div class="panel panel-default panel_comp">
                <div class="panel-heading">
                    <button type="button" class="btn btn-default btn-sm pull-right i_judge">我要评价</button>
                    <button type="button" class="btn btn-warning btn-sm pull-right i_judge judge_submit">确定</button>
                    <input type="hidden" name="votetype" class="votetype" value="vote"/>
                    <h5>
                        <span class="glyphicon glyphicon-th-list"></span>
                        总体评价
                    </h5>
                </div>
                <table class="table table-hover">
                <#list votes as votetag>
                    <#assign vnum=0/>
                    <#assign active=""/>
                    <#list company.votes as cvote>
                        <#if (cvote.tag)?? && cvote.tag.id == votetag.id && cvote.updown>
                            <#assign vnum=vnum+1/>
                            <#if (cvote.auser)?? && login?? && cvote.auser.id == login.id>
                                <#assign active="active"/>
                            </#if>
                        </#if>
                    </#list>
                    <tr>
                        <th>
                            <a class="btn btn-primary" type="button">
                            ${votetag.name}
                                <span class="badge">${vnum}</span>
                            </a>
                        </th>
                        <td class="text-right vmiddle">
                            <div class="users">
                                <#list company.votes as cvote>
                                    <#if (cvote.tag)?? && cvote.tag.id == votetag.id && cvote.updown>
                                        <#assign vnum=vnum+1/>
                                        <a class="glyphicon glyphicon-user"
                                           title="${(cvote.auser.userName)!""}" alt="${(cvote.auser.id)!0}"></a>
                                    </#if>
                                </#list>
                                <#if vnum gt 0>
                                    <span class="glyphicon glyphicon-triangle-right"></span>
                                </#if>
                            </div>
                            <div class="btn-group check_btn hidden" data-toggle="buttons">
                                <input class="voteid" type="hidden" value="${votetag.id}">
                                <label class="btn btn-default ${active!''}">
                                    <input type="checkbox" autocomplete="off"/>
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                </label>
                            </div>
                        </td>
                    </tr>
                </#list>
                </table>
            </div>
            <div class="panel panel-default panel_comp">
                <div class="panel-heading">
                    <button class="btn btn-default btn-sm pull-right i_judge">我要评价</button>
                    <button class="btn btn-warning btn-sm pull-right i_judge judge_submit">确定</button>
                    <input type="hidden" name="votetype" class="votetype" value="pro"/>
                    <h5>
                        <span class="glyphicon glyphicon-th-list"></span>
                        专业能力
                    </h5>
                </div>
                <table class="table table-hover">
                <#list pro as votetag>
                    <#assign vnum=0/>
                    <#assign active=""/>
                    <#list company.votes as cvote>
                        <#if (cvote.tag)?? && cvote.tag.id == votetag.id && cvote.updown>
                            <#assign vnum=vnum+1/>
                            <#if (cvote.auser)?? && login?? && cvote.auser.id == login.id>
                                <#assign active="active"/>
                            </#if>
                        </#if>
                    </#list>
                    <tr>
                        <th>
                            <a class="btn btn-primary" type="button">
                            ${votetag.name}
                                <span class="badge">${vnum}</span>
                            </a>
                        </th>
                        <td class="text-right vmiddle">
                            <div class="users">
                                <#list company.votes as cvote>
                                    <#if (cvote.tag)?? && cvote.tag.id == votetag.id && cvote.updown>
                                        <#assign vnum=vnum+1/>
                                        <a class="glyphicon glyphicon-user"
                                           title="${(cvote.auser.userName)!""}" alt="${(cvote.auser.id)!0}"></a>
                                    </#if>
                                </#list>
                                <#if vnum gt 0>
                                    <span class="glyphicon glyphicon-triangle-right"></span>
                                </#if>
                            </div>
                            <div class="btn-group check_btn hidden" data-toggle="buttons">
                                <input class="voteid" type="hidden" value="${votetag.id}">
                                <label class="btn btn-default ${active!''}">
                                    <input type="checkbox" autocomplete="off" checked="checked"/>
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                </label>
                            </div>
                        </td>
                    </tr>
                </#list>
                    <tr class="newTag hidden">
                        <th>
                            <input class="form-control" width="2" style="width:100px;"/>
                        </th>
                        <td class="text-right vmiddle">
                            <div class="btn-group check_btn hidden" data-toggle="buttons">
                                <label class="btn btn-default">
                                    <input type="checkbox" autocomplete="off" checked="checked"/>
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                </label>
                            </div>
                        </td>
                    </tr>
                    <tr class="addTags hidden">
                        <td class="text-center" colspan="2">
                            <button type="button" class="btn btn-warning add_tag">添加标签</button>
                        </td>
                    </tr>
                </table>
            </div>
            <script type="text/javascript">
                $(function () {
                    $("button.i_judge").click(function () {
                    <#if login??>
                        $(this).hide().siblings("button").show();
                        var parent = $(this).parent().parent();
                        if ($("button.judge_submit", parent).is(":visible")) {
                            parent.addClass("comp_active");
                            parent.find("div.users").hide();
                            parent.find("div.check_btn").removeClass("hidden");
                            parent.find("tr.addTags").removeClass("hidden");
                        } else {
                            parent.removeClass("comp_active");
                            parent.find("div.users").show();
                            parent.find("div.check_btn").addClass("hidden");
                            parent.find("tr.addTags").addClass("hidden");
                        }
                    <#else>
                        alert("请登录后进行评价");
                    </#if>
                    });
                    $("button.judge_submit").click(function () {
                        var votetype = $(this).siblings("input.votetype").val();
                        var voteids = new Array();
                        var votevalues = new Array();
                        $(this).parent().siblings("table").find("input.voteid").each(function () {
                            voteids.push($(this).val());
                            votevalues.push($(this).siblings("label.active").length);
                        });

                        $.ajax({
                            url: '<@spring.url "/comp/vote"/>',
                            method: "post",
                            traditional: true,
                            data: {id: '${RequestParameters.id}', ids: voteids, values: votevalues},
                            dataType: "json",
                            success: function (data) {
                                if (data == 0) {
                                    alert("评价成功");
                                    location.reload();
                                } else if (data == 1) {
                                    alert("评价失败");
                                }
                            },
                            error: function () {
                                alert("服务器忙");
                            }
                        });
                    });
                    $("div.check_btn button").click(function () {
                        $(this).removeClass("btn-default btn-warning").addClass("btn-warning")
                                .siblings().removeClass("btn-default btn-warning").addClass("btn-default");
                    });
                    $("button.add_tag").click(function () {
                        var tagTable = $("tr.newTag", $(this).parent().parent().parent()).eq(0);
                        var html = $(tagTable[0].outerHTML);
                        html.removeClass("hidden");
                        html.insertBefore(tagTable);
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