<#import "/spring.ftl" as spring />
<#import "../comm/comm.ftl" as comm/>
<@comm.md5js/>
<p>&nbsp;</p>
<form class="form-horizontal" method="post" name="user">
    <div class="form-group">
        <label class="col-sm-offset-1 col-sm-4 control-label">原密码：</label>

        <div class="col-sm-4">
            <input class="form-control has-warning" placeholder="输入原密码"
                   type="password" id="oldpasswd" maxlength="6">
            <input type="hidden" id="oldpwd" name="oldpasswd">
            <input type="hidden" id="newpwd" name="newpasswd">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-offset-1 col-sm-4 control-label">新密码：</label>

        <div class="col-sm-4">
            <input class="form-control" placeholder="输入新密码" type="password" id="newpasswd1" maxlength="6">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-offset-1 col-sm-4 control-label">确认新密码：</label>

        <div class="col-sm-4">
            <input class="form-control" placeholder="再次输入新密码" type="password" id="newpasswd2" maxlength="6">
        </div>
    </div>
    <p id="msg" class="text-danger text-center">${msg!"&nbsp;"}</p>

    <div class="form-group text-center">
        <button id="submit" type="submit" class="btn btn-primary">确认</button>
        <button type="reset" class="btn btn-default">重置</button>
    </div>
</form>
<script>
    function validate() {
        var valids = [{
            "id": "oldpasswd",
            "regex": /^.+$/,
            "msg": "请输入原密码"
        }, {
            "id": "oldpasswd",
            "regex": /^[0-9]{6}$/,
            "msg": "原密码有误，请重新输入"
        }, {
            "id": "newpasswd1",
            "regex": /^.+$/,
            "msg": "请输入新密码"
        }, {
            "id": "newpasswd1",
            "regex": /^[0-9]{6}$/,
            "msg": "新密码不是6位数字"
        }, {
            "id": "newpasswd2",
            "regex": /^.+$/,
            "msg": "请再次输入新密码"
        }, {
            "id": "newpasswd2",
            "regex": /^[0-9]{6}$/,
            "msg": "新密码不是6位数字"
        }];
        for (var i = 0; i < valids.length; i++) {
            var valid = valids[i];
            $("#" + valid.id).parent().removeClass("has-error");
            if (!valid.regex.test($("#" + valid.id).val())) {
                $("#msg").text(valid.msg);
                $("#" + valid.id).focus().parent().addClass("has-error");
                return false;
            }
        }
        return true;
    }
    $(function () {
        $("#submit").click(function () {
            if (!validate()) {
                return false;
            }
            if ($("#newpasswd1").val() != $("#newpasswd2").val()) {
                $("#newpasswd2").focus().parent().addClass("has-error");
                $("#msg").text("两次输入的新密码不一致");
                return false;
            }
            if ($("#oldpasswd").val() == $("#newpasswd1").val()) {
                $("#newpasswd1").focus().parent().addClass("has-error");
                $("#msg").text("新密码不能与原密码相同");
                return false;
            }
            $("#oldpwd").val(passEncode($("#oldpasswd").val()));
            $("#newpwd").val(passEncode($("#newpasswd1").val()));
        });
    });
</script>