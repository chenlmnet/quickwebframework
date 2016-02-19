<#import "/spring.ftl" as spring />
<header class="panel">
    <div class="panel-heading">
        <div class="container text-right">
            <!-- logged in / login error / not logged in -->
        <#if login??>
            <form method="post" action="<@spring.url '/user/login'/>" class="form-inline">
                <!-- info -->
                已登录: ${(login.userName)!""}
                <#assign admin=false/>
                <#if login.role.isAdmin()>
                    <#assign admin=true/>
                </#if>
                <#if admin>
                    <a name="adminAuthenticatedUser" class="btn btn-default btn-xs" href="<@spring.url '/admin'/>">
                        <span class="glyphicon glyphicon-cog"></span>管理中心
                    </a>
                </#if>
                <a name="logoutAuthenticatedUser" class="btn btn-default btn-xs" href="<@spring.url '/user/center'/>">
                    <span class="glyphicon glyphicon-user"></span>用户中心
                </a>
                <a type="submit" name="logoutAuthenticatedUser" class="btn btn-default btn-xs"
                   href="<@spring.url '/user/logout'/>">
                    <span class="glyphicon glyphicon-log-out"></span>登出
                </a>
            </form>
        <#else>
            <div class="row">
                <div class="col-md-12">
                    <a href="<@spring.url '/user/login'/>">登录Login</a>
                    |<a href="<@spring.url '/user/register'/>">注册Register</a>
                </div>
            </div>
        </#if>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4">
                <div class="text-center logo">
                    <a href="<@spring.url '/'/>">${(pmap["sys.sitename"])!"索即Sournergy"}</a>

                    <div class="logo_small">${(pmap["sys.sitedesc"])!"发现中国制造的正能量"}</div>
                </div>
            </div>
            <div class="col-md-8 col-sm-12 col-xs-12">
                <form class="form-inline" method="post" action="<@spring.url '/search'/>">
                    <div class="form-group" id="searchbox">
                        <label class="sr-only">搜索Search</label>

                        <div class="input-group input-group-lg">
                            <input id="keyword" name="keyword" class="form-control" placeholder="输入关键字搜索Keywords" value="${RequestParameters["keyword"]!""}"/>

                            <div class="input-group-btn input-group-lg">
                                <button type="submit" class="btn btn-default" id="searchBtn">
                                    <span class="glyphicon glyphicon-search"></span>
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-primary btn-lg" href="<@spring.url '/comp/add'/>">
                            添加公司Add Company
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type="javascript">
        $(function () {
            $("button#searchBtn").click(function () {
                if ($("input#keyword").val() == "") {
                    alert("请输入关键字");
                    return false;
                }
            });
        });
    </script>
</header>