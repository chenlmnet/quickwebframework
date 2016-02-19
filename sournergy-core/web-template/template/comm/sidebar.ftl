<#import "/spring.ftl" as spring />
<div class="panel panel-default hlsort">
    <div class="panel-heading">
        <h5>
            <span class="glyphicon glyphicon-th-list"></span>
            最新评论
        </h5>
    </div>
    <table class="table table-hover">
        <tr>
            <th>
                <span class="label label-default">1</span>
            </th>
            <td>adfaf</td>
            <td>
                <a href="<@spring.url '/user/center'/>?uid=chenlm">
                    网友1
                </a>
            </td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">2</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">3</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">4</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">5</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">6</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">7</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">8</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
    </table>
</div>
<div class="panel panel-default hlsort">
    <div class="panel-heading">
        <h5>
            <span class="glyphicon glyphicon-th-list"></span>
            最新添加的公司
        </h5>
    </div>
<#if top10??>
    <table class="table table-hover">
        <#list top10.content?sort_by("opttime")?reverse as comp>
            <#if (comp_index < 10)>
                <tr>
                    <th><span class="label label-default">${comp_index + 1}</span></th>
                    <td><a href="<@spring.url '/comp/info'/>?id=${comp.id}">${(comp.title)!""}</a></td>
                    <td>
                        <#if (comp.aUser.id)??>
                            <a href="<@spring.url '/user/center'/>?id=${comp.aUser.id}">${comp.aUser.userName}</a>
                        <#else >
                            <a href="#">匿名</a>
                        </#if>
                    </td>
                </tr>
            </#if>
        </#list>
    </table>
</#if>
</div>

<div class="panel panel-default hlsort">
    <div class="panel-heading">
        <h5>
            <span class="glyphicon glyphicon-th-list"></span>
            会员排名
        </h5>
    </div>
    <table class="table table-hover">
        <tr>
            <th>
                <span class="label label-default">1</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">2</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">3</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">4</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">5</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">6</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">7</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
        <tr>
            <th>
                <span class="label label-default">8</span>
            </th>
            <td>adfaf</td>
            <td>bas</td>
        </tr>
    </table>
</div>