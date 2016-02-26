<#import "/spring.ftl" as spring />
<#import "../comm/comm.ftl" as comm/>
<!DOCTYPE html>
<html>
<head lang="en">
<#assign title="添加公司"/>
<@comm.bootstrap "${title!''}"/>
<@comm.css/>
<@comm.md5js/>
<@comm.provCityJs/>
</head>
<body>
<h1 class="sr-only">制造业点评网</h1>

<!-- header area -->
<div id="headerContainer">
<#include "../comm/header.ftl"/>
</div>

<div class="container" style="margin-top: 10px;">
    <!-- content -->
    <div class="row">
        <!-- content -->
        <div id="contentContainer" class="col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5>
                        <span class="glyphicon glyphicon-pencil"></span>
                        添加公司
                    </h5>
                </div>
                <div class="panel-body">
                <#if success?? && success>
                    <div class="alert alert-success text-center" role="alert">
                        添加成功
                        <a class="alert-link" href="<@spring.url '/comp/add'/>">继续添加</a>
                        <a class="alert-link" href="<@spring.url '/'/>">返回首页</a>
                    </div>
                <#else >
                    <form class="form-horizontal" action="<@spring.url '/comp/add'/>"
                          method="post" enctype="multipart/form-data">
                        <div class="info_box">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">
                                    <a href="#">基本信息/General Data</a>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="form-group col-sm-2">
                                            <label class="col-sm-12 control-label">公司名/Company Name</label>
                                        </div>
                                        <div class="col-sm-10">
                                            <div class="col-sm-12">
                                                <input name="title" placeholder="请输入公司名" class="form-control"
                                                       type="text"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4 control-label">公司网址/Website</label>

                                            <div class="col-sm-7">
                                                <input name="website" placeholder="请输入公司网址" class="form-control"
                                                       type="text"/>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4 control-label">公司Logo</label>

                                            <div class="col-sm-8">
                                                <input type="file" class="logoFile" placeholder="请选择公司logo文件上传"
                                                       name="logoFile"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-2">
                                            <label class="col-sm-12 control-label">所在地/Location</label>
                                        </div>
                                        <div class="col-sm-10">
                                            <div class="col-sm-12">
                                                <div class="form-group col-sm-12">
                                                    <input type="hidden" name="country" value="中国/China"/>
                                                    <input type="hidden" name="province"/>
                                                    <input type="hidden" name="city"/>
                                                    <input type="hidden" name="district"/>

                                                    <div class="input-group">
                                                        <div class="input-group-btn country">
                                                            <div class="btn btn-primary dropdown-toggle"
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
                                                        <div class="input-group-btn select_btn province">
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
                                                        <div class="input-group-btn select_btn city">
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
                                                        <div class="input-group-btn select_btn district">
                                                            <div class="btn btn-default dropdown-toggle"
                                                                 data-toggle="dropdown"
                                                                 aria-haspopup="true" aria-expanded="false">
                                                                <span name="district" class="input">请选择/Select</span>
                                                                <span class="caret"></span>
                                                            </div>
                                                            <ul class="dropdown-menu">
                                                                <li>
                                                                    <a href="#">请选择/Select</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                        <input name="address" placeholder="请输入详细地址" class="form-control"
                                                               type="text"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 alert alert-info">联系人/Contactor
                                        <div class="pull-right add_contractor">
                                            <span class="glyphicon glyphicon-plus"></span> 添加联系人
                                        </div>
                                    </div>
                                    <div class="contractor">
                                        <div class="row">
                                            <div class="form-group col-sm-3">
                                                <label class="col-sm-6 control-label">姓名/Name</label>

                                                <div class="col-sm-5">
                                                    <input name="contractors[0].name" placeholder="请输入联系人姓名"
                                                           class="form-control" type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label class="col-sm-6 control-label">职位/Position</label>

                                                <div class="col-sm-5">
                                                    <input name="contractors[0].position" placeholder="请输入联系人职位"
                                                           class="form-control"
                                                           type="text"/>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label class="col-sm-4 control-label">电话/Phone</label>

                                                <div class="col-sm-7">
                                                    <input name="contractors[0].telephone" placeholder="请输入联系人电话"
                                                           class="form-control"
                                                           type="tel"
                                                           maxlength="11"/>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-3">
                                                <label class="col-sm-4 control-label">邮箱/Email</label>

                                                <div class="col-sm-8">
                                                    <input name="contractors[0].email" placeholder="请输入联系人邮箱"
                                                           class="form-control"
                                                           type="email"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 alert alert-info">公司简介/Introduction</div>
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <textarea name="summary" class="form-control" rows="4"></textarea>
                                        </div>
                                    </div>

                                    <div class="col-sm-12 alert alert-info">标签/Tags</div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-1 control-label">行业：</label>

                                            <div class="col-sm-11">
                                                <#if busi??>
                                                    <#list busi as bus>
                                                        <div class="checkbox-inline">
                                                            <label>
                                                                <input name="business[${bus_index}].id" type="checkbox"
                                                                       value="${(bus.id)!''}"/>${(bus.name)!''}
                                                            </label>
                                                        </div>
                                                    </#list>
                                                </#if>
                                            <#--<label><input name="businesses" type="checkbox" value="medical"/>医疗/Medical</label>
                                            <label><input name="businesses" type="checkbox" value="telecom">IT与通讯/IT&Telecom</label>
                                            <label><input name="businesses" type="checkbox"
                                                          value="auto">车辆交通/Auto</label>
                                            <label><input name="businesses" type="checkbox" value="airspace">航空航天/Airspace</label>
                                            <label><input name="businesses" type="checkbox" value="construction">建筑房产/Construction&Realestate</label>
                                            <label><input name="businesses" type="checkbox" value="textile">纺织服装/Textile</label>
                                            <label><input name="businesses" type="checkbox" value="home">家用电器/Home
                                                appliances</label>
                                            <label><input name="businesses" type="checkbox" value="industrial">工业设备/Industrial</label>
                                            <label><input name="businesses" type="checkbox" value="energy">能源矿产/Energy&minerals</label>
                                            <label><input name="businesses" type="checkbox" value="petrochemical">石油化工/Petrochemical</label>-->
                                            <#--<div class="btn btn-default">行业A
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </div>
                                            <div class="btn btn-primary">
                                                <span class="glyphicon glyphicon-plus-sign"></span>
                                                添加行业
                                            </div>-->
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-1 control-label">专业能力：</label>

                                            <div class="col-sm-11">
                                                <div class="btn btn-default">物料分类
                                                    <span class="glyphicon glyphicon-remove"></span>
                                                </div>
                                                <div class="btn btn-primary">
                                                    <span class="glyphicon glyphicon-plus-sign"></span>
                                                    添加专业能力
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 alert alert-info">销售额/Trend of Turnover</div>
                                    <div class="row">
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-4 control-label">总数/Total</label>

                                            <div class="col-sm-8 input-group">
                                                <span class="input-group-addon">￥</span>
                                                <input name="turnoverTotal" placeholder="请输入销售总额" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">万元/年Year</span>
                                            </div>
                                        </div>
                                    </div>
                                    <p>
                                        <em>按领域(%)/According to Sections(%)</em>
                                    </p>

                                    <div class="row">
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-4 control-label">医疗/Medical</label>

                                            <div class="col-sm-6 input-group">
                                                <input name="turnoverMedical" placeholder="请输入销售额" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-4 control-label">日用品/Consumer</label>

                                            <div class="col-sm-6 input-group">
                                                <input name="turnoverConsumer" placeholder="请输入销售额" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-4 control-label">电讯/Telecom</label>

                                            <div class="col-sm-6 input-group">
                                                <input name="turnoverTelecom" placeholder="请输入销售额" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-4 control-label">汽车/Automotive</label>

                                            <div class="col-sm-6 input-group">
                                                <input name="turnoverAutomotive" placeholder="请输入销售额"
                                                       class="form-control" type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-4 control-label">其他/Others</label>

                                            <div class="col-sm-6 input-group">
                                                <input name="turnoverOther" placeholder="请输入销售额" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 alert alert-info">市场份额/Market Share（%）</div>
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-3 control-label">国内/Domestic</label>

                                            <div class="col-sm-8 input-group">
                                                <input name="marketInside" placeholder="请输入市场份额" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-3 control-label">国际/international</label>

                                            <div class="col-sm-8 input-group">
                                                <input name="marketOutside" placeholder="请输入市场份额" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 alert alert-info">员工/Employees</div>
                                    <div class="row">
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-6 control-label">总数/Total</label>

                                            <div class="col-sm-4 input-group">
                                                <input name="employeeTotal" placeholder="请输入员工总数" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">人</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-6 control-label">操作工/Operators</label>

                                            <div class="col-sm-4 input-group">
                                                <input name="employeeOperators" placeholder="请输入操作工人数"
                                                       class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">人</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-6 control-label">工程师/Eng.</label>

                                            <div class="col-sm-4 input-group">
                                                <input name="employeeEng" placeholder="请输入工程师人数" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">人</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="col-sm-6 control-label">质量控制/Quality Control</label>

                                            <div class="col-sm-4 input-group">
                                                <input name="employeeQuality" placeholder="请输入质量控制人数"
                                                       class="form-control" type="text"/>
                                                <span class="input-group-addon">人</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info_box">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">
                                    <a href="#">生产/Production</a>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="form-group col-sm-6 col-md-6">
                                            <label class="col-sm-5 control-label">机器利用率/Machine
                                                Utilisation</label>

                                            <div class="col-sm-4 input-group">
                                                <input name="machineRate" placeholder="请输入机器利用率" class="form-control"
                                                       type="text"/>
                                                <span class="input-group-addon">%</span>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-4 col-md-6">
                                            <label class="col-sm-3 control-label">班次/Shifts per day</label>

                                            <div class="col-sm-4 input-group">
                                                <select name="shifts" class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                </select>
                                                <span class="input-group-addon">班/天</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info_box">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">
                                    <a href="#">客户/Customers</a>
                                </li>
                                <li class="pull-left">
                                    <div class="btn btn-primary btn-sm btn_more">
                                        <span class="glyphicon glyphicon-plus"></span> 添加客户
                                    </div>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>主要客户<br/>Main Customers</th>
                                            <th>国家<br/>Country</th>
                                            <th>占销售额百分比<br/>% of Turnover</th>
                                        <#--<th>操作<br/>Deal</th>-->
                                        </tr>
                                        <tr class="more">
                                            <td><input class="form-control" placeholder="请输入客户名称"
                                                       name="customers[0].name"/></td>
                                            <td><input class="form-control" placeholder="请输入客户所在国家"
                                                       name="customers[0].country"/></td>
                                            <td><input class="form-control" placeholder="请输入销售额占比"
                                                       name="customers[0].turnover"/></td>
                                        <#--<td>-->
                                        <#--<div class="btn btn-primary">删除</div>-->
                                        <#--</td>-->
                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <div class="info_box">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">
                                    <a href="#">主要供应商/Major Suppliers</a>
                                </li>
                                <li class="pull-left">
                                    <div class="btn btn-primary btn-sm btn_more">
                                        <span class="glyphicon glyphicon-plus"></span> 添加供应商
                                    </div>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <table class="table table-bordered">
                                        <tr>
                                            <th>公司名称<br/>Name Of Company</th>
                                            <th>采购金额<br/>Puchasing volume</th>
                                            <th>国家<br/>Country</th>
                                        <#--<th>操作<br/>Deal</th>-->
                                        </tr>
                                        <tr class="more">
                                            <td><input class="form-control" placeholder="请输入供应商名称"
                                                       name="suppliers[0].name"/></td>
                                            <td><input class="form-control" placeholder="请输入采购金额"
                                                       name="suppliers[0].puchasing"/></td>
                                            <td><input class="form-control" placeholder="请输入供应商所在国家"
                                                       name="suppliers[0].country"/></td>
                                        <#--<td>-->
                                        <#--<div class="btn btn-primary">删除</div>-->
                                        <#--</td>-->
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="info_box">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">
                                    <a href="#">质量体系/Quality System</a>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body form-group">
                                    <div class="col-sm-12">
                                        <#if quality??>
                                            <#list quality as qual>
                                                <div class="checkbox-inline">
                                                    <label class="control-label">
                                                        <input name="quality[${qual_index}].id" type="checkbox"
                                                               value="${(qual.id)!''}"/>${(qual.name)!''}</label>
                                                </div>
                                            </#list>
                                        </#if>
                                    </div>
                                <#--<label class="col-sm-1 control-label">
                                    <input type="checkbox" name="iso9001"/>ISO9001
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="iso13485"/>ISO13485
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="iso14001"/>ISO14001
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="ts16949"/>TS16949
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="qs9001"/>QS9001
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="sa8000"/>SA8000
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="sa8000"/>SA8000
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="sa8000"/>SA8000
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="sa8000"/>SA8000
                                </label>
                                <label class="col-sm-1 control-label">
                                    <input type="checkbox" name="sa8000"/>SA8000
                                </label>-->
                                </div>
                            </div>
                        </div>
                        <div class="info_box">
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active">
                                    <a href="#">附件（请尽可能提供）/Attached
                                        Documents (please provide if possible)
                                    </a>
                                </li>
                            </ul>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">年度报表Annual Report</label>

                                        <div class="col-sm-6">
                                            <input type="file" name="reportFiles"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">加工设备清单List of Machines</label>

                                        <div class="col-sm-6">
                                            <input type="file" name="machinesFiles"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">组织结构图Organisation Chart</label>

                                        <div class="col-sm-6">
                                            <input type="file" name="organisationFiles"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">质量体系证书Quality System Certificates
                                        </label>

                                        <div class="col-sm-6">
                                            <input type="file" name="qualityFiles"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">测试设备清单List of Testing Equipment
                                        </label>

                                        <div class="col-sm-6">
                                            <input type="file" name="testingFiles"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">质量手册Quality Manual</label>

                                        <div class="col-sm-6">
                                            <input type="file" name="manualFiles"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">产品认可证书Product Certificate</label>

                                        <div class="col-sm-6">
                                            <input type="file" name="certificateFiles"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12 text-center">
                            <button type="submit" class="btn btn-primary">确认添加</button>
                        </div>
                    </form>
                </#if>
                </div>
            </div>
        </div>

    </div>
    <!-- page footer -->
    <div id="footerContainer">
    <#include "../comm/footer.ftl"/>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("div.add_contractor").click(function () {
            var html = $($("div.contractor>div.row")[0].outerHTML);
            html.find("input").each(function () {
                var name = $(this).attr("name").replace("0", $("div.contractor>div.row").length);
                $(this).attr("name", name);
            })
            $(".contractor").append(html);
        });
        $("div.btn_more").click(function () {
            var trmore = $("tr.more", $(this).parent().parent().parent());
            var html = $(trmore[0].outerHTML);
            html.find("input").each(function () {
                var name = $(this).attr("name").replace("0", trmore.length);
                $(this).attr("name", name);
            })
            trmore.parent().append(html);
        });
        $("form").submit(function () {
            var toSubmit = true;
            $("div.province, div.city, div.district").each(function () {
                if ($(this).is(":visible") && $("span.input", this).attr("value") == 0) {
                    toSubmit = false;
                    alert("请选择所在地");
                    return false;
                }
            });
            if (!toSubmit)
                return toSubmit;
            $("input[type!=hidden][type!=file]", this).each(function () {
                if ($(this).val() == "") {
                    alert($(this).attr("placeholder"));
                    toSubmit = false;
                    $(this).focus();
                    return false;
                }
            });
            if ($("input[type=file].logoFile").val() == "") {
                alert("请上传公司logo");
                return false;
            }
            return toSubmit;
        });
    })
</script>
</body>
</html>