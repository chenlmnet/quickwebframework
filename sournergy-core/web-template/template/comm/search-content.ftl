<#import "/spring.ftl" as spring />
<form id="pager" method="post" action="<@spring.url '/search'/>">
    <input type="hidden" name="keyword" value="${keyword!""}"/>
    <input type="hidden" name="pagesize" value="${pagesize!""}"/>
    <input type="hidden" name="page" value="${page!""}"/>
</form>
<div class="panel panel-default panel_comp">
    <div class="panel-heading">
        <xsl:if test="$action.result/controller/result/Attributes/total > 0">
            <div class="search_no">
            <#if all??>
                <span class="glyphicon glyphicon-star"></span>
                搜索到 <span class="text-danger">${all?size}</span> 家公司
                （<span class="text-danger">${all?size}</span> are searched）
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
<#list all as comp>
    <#if (comp_index < 10)>
        <div class="panel-body">
            <dl class="dl-horizontal">
                <dt>
                    <img class="img-thumbnail" src="${logo!""}"/>
                </dt>
                <dd>
                    <div class="pull-right comp_point">
                        <div class="btn btn-default btn-xs">
                            关注
                            <span class="badge">3</span>
                        </div>
                        <div class="btn btn-default btn-xs">
                            评论
                            <span class="badge">3</span>
                        </div>
                        <div class="btn btn-default btn-xs">
                            点赞
                            <span class="badge">3</span>
                        </div>
                    </div>
                    <h3>${comp.title}&#160;</h3>

                    <p>
                        公司成立于xxxx年，有员工X人，年销售额X万人民币，地址位于xxxx，产品主要是xxx、yyy,拥有认证xxx，xxx，客户涉及行业xxxx
                    </p>
                </dd>
            </dl>
        </div>
    </#if>
</#list>
    <div class="panel-footer text-right">
        <input type="hidden" name="loginurl" id="loginurl" value=""/>
        <nav>
            <xsl:variable name="page" select="number($action.result/controller/result/Attributes/page)"/>
            <xsl:variable name="lastpage"
                          select="number($action.result/controller/result/Attributes/lastpage)"/>
            <xsl:variable name="pager"
                          select="(1 to $action.result/controller/result/Attributes/lastpage)"/>
        <#assign page=5/>
        <#assign lastpage=10/>
            <ul class="pagination">
            <#if page<=1>
                <li class="disabled">
                    <a href="#" aria-label="上一页">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
            <#else>
                <li>
                    <a href="#" aria-label="上一页" title="{$page - 1}">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
            </#if>
            <#list 1..10 as pg>
                <#if page == pg>
                    <li class="disabled">
                        <a>${pg}</a>
                    </li>
                <#else >
                    <li>
                        <a href="#" title="${pg}">${pg}</a>
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
                    <a href="#" aria-label="下一页" title="{$page + 1}">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </#if>
            </ul>
        </nav>
    </div>
</div>
<xsl:choose>
    <xsl:when test="/result/meta-data/User">
        <script type="text/javascript">
            $(function () {
                $("ul.pagination li a").click(function () {
                    var page = $(this).attr("title");
                    if (page != undefined) {
                        $("#pager input[name=page]").val(page);
                        $("#pager").submit();
                    }
                    return false;
                });
            });
        </script>
    </xsl:when>
    <xsl:otherwise>
        <script type="text/javascript">
            $(function () {
                $("ul.pagination li a").click(function () {
                    $(this).attr("href", $("input#loginurl").val());
                });
            });
        </script>
    </xsl:otherwise>
</xsl:choose>