<#import "/spring.ftl" as spring />
<div id="searchpanContainer" class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" method="post" id="searchForm" action="<@spring.url '/search'/>">
                    <input type="hidden" name="pagesize" value="${pagesize!""}"/>
                    <input type="hidden" name="page" value="${page!""}"/>
                    <input name="keyword" value="${RequestParameters["keyword"]!""}" type="hidden"/>

                    <div class="form-group">
                        <label class="col-lg-2 col-md-3 col-sm-3 control-label">应用领域/ApplyFor：</label>
                        <input type="hidden" name="applyFor"/>

                        <div class="col-lg-10 col-md-9 col-sm-9 btn_radio">
                            <div class="btn btn-primary" value="all">全部/ALL</div>
                            <div class="btn btn-default" value="medical">医疗/Medical</div>
                            <div class="btn btn-default" value="telecom">IT与通讯/IT&Telecom</div>
                            <div class="btn btn-default" value="auto">车辆交通/Auto</div>
                            <div class="btn btn-default" value="airspace">航空航天/Airspace</div>
                            <div class="btn btn-default" value="construction">建筑房产/Construction&Realestate</div>
                            <div class="btn btn-default" value="textile">纺织服装/Textile</div>
                            <div class="btn btn-default" value="home">家用电器/Home appliances</div>
                            <div class="btn btn-default" value="industrial">工业设备/Industrial</div>
                            <div class="btn btn-default" value="energy">能源矿产/Energy&minerals</div>
                            <div class="btn btn-default" value="petrochemical">石油化工/Petrochemical</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-md-3 col-sm-3 control-label">物料/Category：</label>
                        <input type="hidden" name="products"/>
                        <input type="hidden" name="material"/>
                        <input type="hidden" name="methodology"/>

                        <div class="col-lg-10 col-md-9 col-sm-9">
                            <div class="btn btn-primary products_all">全部/ALL</div>
                            <div class="btn-group products">
                                <div class="btn btn-default dropdown-toggle"
                                     data-toggle="dropdown"
                                     aria-haspopup="true" aria-expanded="false">
                                    <span name="products" class="input">请选择/Select</span>
                                    <span class="caret"></span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a>请选择/Select</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-group material">
                                <div class="btn btn-default dropdown-toggle"
                                     data-toggle="dropdown"
                                     aria-haspopup="true" aria-expanded="false">
                                    <span name="material" class="input">请选择/Select</span>
                                    <span class="caret"></span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a>请选择/Select</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-group methodology">
                                <div class="btn btn-default dropdown-toggle"
                                     data-toggle="dropdown"
                                     aria-haspopup="true" aria-expanded="false">
                                    <span name="methodology" class="input">请选择/Select</span>
                                    <span class="caret"></span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a>请选择/Select</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-md-3 col-sm-3 control-label">地区/Area：</label>
                        <input type="hidden" name="country" value="中国/China"/>
                        <input type="hidden" name="province"/>
                        <input type="hidden" name="city"/>
                        <input type="hidden" name="district"/>

                        <div class="col-lg-10 col-md-9 col-sm-9">
                            <div class="btn btn-primary dropdown-toggle area_all">全部/ALL</div>
                            <div class="btn-group country">
                                <div class="btn btn-default dropdown-toggle"
                                     data-toggle="dropdown"
                                     aria-haspopup="true" aria-expanded="false">
                                    <span name="country" class="input">中国/China</span>
                                    <span class="caret"></span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li>
                                        <span href="#">中国/China</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-group province">
                                <div class="btn btn-default dropdown-toggle"
                                     data-toggle="dropdown"
                                     aria-haspopup="true" aria-expanded="false">
                                    <span name="province" class="input">请选择/Select</span>
                                    <span class="caret"></span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li>
                                        <span href="#">请选择/Select</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-group city">
                                <div class="btn btn-default dropdown-toggle"
                                     data-toggle="dropdown"
                                     aria-haspopup="true" aria-expanded="false">
                                    <span name="city" class="input">请选择/Select</span>
                                    <span class="caret"></span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li>
                                        <span href="#">请选择/Select</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-group district">
                                <div class="btn btn-default dropdown-toggle"
                                     data-toggle="dropdown"
                                     aria-haspopup="true" aria-expanded="false">
                                    <span name="district" class="input">请选择/Select</span>
                                    <span class="caret"></span>
                                </div>
                                <ul class="dropdown-menu">
                                    <li>
                                        <span href="#">请选择/Select</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-md-3 col-sm-3 control-label">员工人数/Employee：</label>
                        <input type="hidden" name="employee"/>

                        <div class="col-lg-10 col-md-9 col-sm-9 btn_radio">
                            <div class="btn btn-primary" value="all">全部/ALL</div>
                            <div class="btn btn-default" value="0-100">≤100</div>
                            <div class="btn btn-default" value="101-500">101-500</div>
                            <div class="btn btn-default" value="500-1000">501-1000</div>
                            <div class="btn btn-default" value="1000-5000">1000-5000</div>
                            <div class="btn btn-default" value="5000-">>5000</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-2 col-md-3 col-sm-3 control-label">所有权/OwnerShip：</label>
                        <input type="hidden" name="ownership"/>

                        <div class="col-lg-10 col-md-9 col-sm-9 btn_radio">
                            <div class="btn btn-primary" value="all">全部/ALL</div>
                            <div class="btn btn-default" value="private">私营/Private</div>
                            <div class="btn btn-default" value="overseas">外资/Overseas</div>
                            <div class="btn btn-default" value="soe">国有/SOE</div>
                            <div class="btn btn-default" value="mix">混合/Mix</div>
                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <button class="btn btn-primary btn-lg" type="submit">搜索供应商View Suppliers</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("ul.dropdown-menu li a").click(function () {
            var target = $(this).parent().parent().siblings("div");
            $("span.input", target).text($(this).text()).attr("value", $(this).attr("value"));
        });
        $("div.btn_radio div.btn").click(function () {
            $(this).removeClass("btn-default").addClass("btn-primary")
                    .siblings().removeClass("btn-primary").addClass("btn-default")
                    .parent().attr("value", $(this).attr("value"));
            $(this).parent().siblings("input[type=hidden]").val($(this).attr("value"));
        });
    <#macro radio_backfill name>
        <#if RequestParameters["${name}"]??>
            $("input[name=${name}]").siblings("div.btn_radio").find("div.btn").each(function () {
                if ($(this).attr("value") == '${RequestParameters["${name}"]}') {
                    $(this).click();
                    return false;
                }
            });
        </#if>
    </#macro>
    <@radio_backfill "applyFor"/>
    <@radio_backfill "area"/>
    <@radio_backfill "employee"/>
    <@radio_backfill "ownership"/>

    <#macro multi_backfill name>
        <#if RequestParameters["${name}"]??>
            $("input[name=${name}]").siblings("div").find("div.${name} ul li a").each(function () {
                if ($(this).text() == '${RequestParameters["${name}"]}') {
                    $(this).click();
                    return false;
                }
            });
        </#if>
    </#macro>
    <@multi_backfill "products"/>
    <@multi_backfill "material"/>
    <@multi_backfill "methodology"/>

    <@multi_backfill "province"/>
    <@multi_backfill "city"/>
    <@multi_backfill "district"/>

    });
</script>