<#import "/spring.ftl" as spring />
<#import "comm/comm.ftl" as comm/>
<#include "comm/param.ftl"/>
<!DOCTYPE html>
<html>
<head lang="en">
<@comm.bootstrap "${sitename!''}"/>
<@comm.css/>
<@comm.md5js/>
<@comm.provCityJs/>
<@comm.products/>
</head>
<body>
<h1 class="sr-only"><@comm.param "sitename"/></h1>

<!-- header area -->
<div id="headerContainer">
<#include "comm/header.ftl"/>
</div>

<div class="container" style="margin-top: 10px;">
    <!-- filter box -->
<#include "comm/filter.ftl"/>
    <!-- main area -->
    <div class="row">
        <!-- content -->
        <div id="contentContainer" class="col-md-9">
            <div class="panel panel-default panel_comp">
                <div class="panel-heading">
                    <xsl:if test="$action.result/controller/result/Attributes/total > 0">
                        <div class="search_no">
                        <#if all??>
                            <span class="glyphicon glyphicon-star"></span>
                            搜索到 <span class="text-danger">${(all.totalElements)!""}</span> 家公司
                            （ <span class="text-danger">${(all.totalElements)!""}</span> are searched ）
                        </#if>
                        </div>
                    </xsl:if>
                    <div class="text-right order_by">
                        <span>排序/Order by：</span>

                        <div class="btn-group" role="group">
                            <div class="btn btn-default">默认排序/Website Recommend
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </div>
                            <div class="btn btn-default">成立时间/Founded Date
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </div>
                            <div class="btn btn-default">评论量/Comments
                                <span class="glyphicon glyphicon-arrow-down"></span>
                            </div>
                        </div>
                    </div>
                </div>
            <#if (all.content)??>
                <#list all.content as comp>
                    <div class="panel-body">
                        <dl class="dl-horizontal">
                            <dt>
                                <img class="img-thumbnail" src="${springMacroRequestContext.contextPath}${(comp.logo[0].url)!""}"/>
                            </dt>
                            <dd>
                                <div class="pull-right comp_point">
                                    <div class="btn btn-default btn-xs">
                                        关注
                                        <span class="badge">${(comp.focusSize)!0}</span>
                                    </div>
                                    <div class="btn btn-default btn-xs">
                                        评论
                                        <span class="badge">${(comp.commentSize)!0}</span>
                                    </div>
                                    <div class="btn btn-default btn-xs">
                                        点赞
                                        <span class="badge">${(comp.voteSize)!0}<#--${(comp.votes.size())!0}--></span>
                                    </div>
                                </div>
                                <h3><a href="<@spring.url '/comp/info'/>?id=${comp.id}">${comp.title}&#160;</a></h3>

                                <p>
                                    公司成立于xxxx年，有员工${(comp.employeeTotal)!""}人，年销售额${(comp.turnoverTotal)!""}
                                    万人民币，地址位于${(comp.province)!""}${(comp.city)!""}${(comp.district)!""}${(comp.address)!""}
                                    ，产品主要是xxx、yyy,拥有认证xxx，xxx，客户涉及行业xxxx
                                </p>
                            </dd>
                        </dl>
                    </div>
                </#list>
            </#if>
                <div class="panel-footer text-right">
                    <nav>
                    <#assign page=all.number/>
                    <#assign lastpage=all.totalPages - 1/>
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
                        <#list 0..lastpage as pg>
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
                        <#if page gte lastpage>
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
            </div>
        </div>
        <!-- page sidebar -->
        <div id="sidebarContainer" class="col-md-3">
        <#include "comm/sidebar.ftl"/>
        </div>
    </div>
    <!-- page footer -->
    <div id="footerContainer">
    <#include "comm/footer.ftl"/>
    </div>
</div>
<#if login??>
<script type="text/javascript">
    $(function () {
        $("ul.pagination li a").click(function () {
            var page = $(this).attr("title");
            if (page != undefined) {
                $("#searchForm input[name=page]").val(page - 1);
                $("#searchForm").submit();
            }
            return false;
        });
    });
</script>
<#else >
<script type="text/javascript">
    $(function () {
        $("ul.pagination li a").click(function () {
            $(this).attr("href", "<@spring.url '/user/login'/>");
        });
    });
</script>
</#if>
</body>
</html>