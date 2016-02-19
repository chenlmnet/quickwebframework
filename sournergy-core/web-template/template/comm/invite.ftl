<div class="row">
    <!-- content -->
    <div id="contentContainer" class="col-sm-8 col-sm-offset-2">
        <div class="media">
            <div class="media-body invite_code">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h5><span class="glyphicon glyphicon-user"></span> 使用邀请码</h5>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-offset-1 control-label">邀请码</label>

                                <div class="col-sm-8">
                                    <input class="form-control" placeholder="邀请码" type="text"/>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn-warning center-block">开始添加</button>
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer text-right">
                        <a href="#">什么是邀请码？</a>
                    </div>
                </div>
            </div>
            <div class="media-body invite_login">
                <!-- the form -->
                <xsl:call-template name="company.login.form">
                    <xsl:with-param name="show.sign.up.link" select="true()"/>
                    <xsl:with-param name="show.sign.up.reset.password.link" select="true()"/>
                </xsl:call-template>
            </div>
        </div>
    </div>
</div>