/**
 * Created by chenlm on 15-10-31.
 */
$(function () {
    $("div.products_all").click(function () {
        $("div.products ul.dropdown-menu li a:first").click();
    });
    $("div.products span.input").text(products['0'].name).attr("value", '0');
    $("div.products ul.dropdown-menu").html(getHtmlLi(products));
    $("div.products ul.dropdown-menu li a").click(function () {
        var target = $(this).parent().parent().siblings("div");
        $("span.input", target).text($(this).text()).attr("value", $(this).attr("value"));
        $("input[name=products]").val($(this).text()); // 设置值
        if ($("span.input", target).attr("value") != 0) {
            target.removeClass("btn-default").addClass("btn-primary");
            target.parent().siblings("div.btn").removeClass("btn-primary").addClass("btn-default");
        } else {
            target.removeClass("btn-primary").addClass("btn-default");
            target.parent().siblings("div.btn-group").find("div.btn").removeClass("btn-primary").addClass("btn-default");
            target.parent().siblings("div.btn").removeClass("btn-default").addClass("btn-primary");
        }
        var cities = products[$("div.products span.input").attr("value")].sub;
        $("div.material span.input").text(cities['0'].name).attr("value", "0");
        $("div.material ul.dropdown-menu").html(getHtmlLi(cities));
        $("div.methodology span.input").text("请选择/Select").attr("value", "0");
        $("div.methodology ul.dropdown-menu").html(getHtmlLi([{"name": "请选择/Select"}]));

        $("div.material ul.dropdown-menu li a").click(function () {
            var target = $(this).parent().parent().siblings("div");
            $("span.input", target).text($(this).text()).attr("value", $(this).attr("value"));
            $("input[name=material]").val($(this).text()); // 设置值

            if ($("span.input", target).attr("value") != 0) {
                target.removeClass("btn-default").addClass("btn-primary");
            } else {
                target.removeClass("btn-primary").addClass("btn-default");
            }

            var methodology = cities[$("div.material span.input").attr("value")].sub;
            if (methodology != undefined) {
                $("div.methodology").show();
                $("div.methodology span.input").text(methodology['0'].name).attr("value", "0");
                $("div.methodology ul.dropdown-menu").html(getHtmlLi(methodology));
                $("div.methodology ul.dropdown-menu li a").click(function () {
                    var target = $(this).parent().parent().siblings("div");
                    $("span.input", target).text($(this).text()).attr("value", $(this).attr("value"));
                    $("input[name=methodology]").val($(this).text()); // 设置值

                    if ($("span.input", target).attr("value") != 0) {
                        target.removeClass("btn-default").addClass("btn-primary");
                    } else {
                        target.removeClass("btn-primary").addClass("btn-default");
                    }
                });
            } else {
                $("div.methodology").hide();
            }
            $("div.methodology div.btn").removeClass("btn-primary").addClass("btn-default");
        });
        $("div.material div.btn,div.methodology div.btn").removeClass("btn-primary").addClass("btn-default");
    });
});
function getHtmlLi(array) {
    var html = "";
    for (var a in array) {
        html += "<li><a value='" + a + "'>" + array[a].name + "</a></li>";
    }
    return html;
};
var products = [{"name":"请选择/Select","sub":[{"name":"请选择/Select"}],"type":1},{"name":"金属","sub":[{"name":"请选择/Select","sub":[]},{"name":"金属机械加工","sub":[{"name":"请选择/Select"},{"name":"金属切削加工"},{"name":"钳工"},{"name":"压力加工"},{"name":"焊接"},{"name":"铸造"},{"name":"特种加工"},{"name":"其他"}],"type":0},{"name":"表面防护处理","sub":[{"name":"请选择/Select"},{"name":"表面电镀"},{"name":"涂护处理"},{"name":"其他"}],"type":0},{"name":"热处理","sub":[{"name":"请选择/Select"},{"name":"整体热处理"},{"name":"表面热处理"},{"name":"化学热处理"},{"name":"其他"}],"type":0},{"name":"装配与包装","sub":[{"name":"请选择/Select"},{"name":"装配"},{"name":"试验与检测"},{"name":"包装"},{"name":"其他"}],"type":0},{"name":"其他","sub":[{"name":"请选择/Select"},{"name":"浇注"},{"name":"编织"},{"name":"缠绕"},{"name":"其他"}],"type":0}],"type":1},{"name":"非金属","sub":[{"name":"请选择/Select","sub":[]},{"name":"塑料加工","sub":[{"name":"请选择/Select"},{"name":"挤出成型"},{"name":"袋压成型"},{"name":"注射成型"},{"name":"压制成型"},{"name":"增塑"},{"name":"固化"},{"name":"其他"}],"type":0},{"name":"复合材料加工","sub":[{"name":"请选择/Select"},{"name":"手糊成型"},{"name":"拉出成型"},{"name":"喷射成型"},{"name":"层压成型"},{"name":"高能成型"},{"name":"干法成型"},{"name":"湿法成型"},{"name":"其他"}],"type":0},{"name":"陶瓷制品","sub":[{"name":"请选择/Select"},{"name":"研磨"},{"name":"烧结"},{"name":"抛光"},{"name":"其他"}],"type":0},{"name":"橡胶制品","sub":[{"name":"请选择/Select"},{"name":"硫化"},{"name":"后硫化"},{"name":"塑炼"},{"name":"热塑炼"},{"name":"湿炼"},{"name":"开炼"},{"name":"密炼"},{"name":"返炼"},{"name":"切边"},{"name":"其他"}],"type":0},{"name":"玻璃制品","sub":[{"name":"请选择/Select"},{"name":"雕刻"},{"name":"粘贴"},{"name":"其他"}],"type":0},{"name":"石材","sub":[{"name":"请选择/Select"},{"name":"切割"},{"name":"其他"}],"type":0},{"name":"其他","sub":[{"name":"请选择/Select"},{"name":"微细加工"},{"name":"纳米加工"},{"name":"其他"}],"type":0}],"type":1}];