{% import "forms.html" as forms %}
<html>
<head>
<link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<h1>{{id}}</h1>
{{ forms.label('Username') }}
{{ forms.field('user') }}
{{ forms.label('Password') }}
{{ forms.field('pass', type='password') }}
<div>
{% for key, value in questions.fields %}
    {% if value.main %}
        <h1 style="color:red">{{value.main}}</h1>
    {% endif %}
    {% if value.sub %}
        <h3 style="color:blue">{{value.sub}}</h3>
    {% endif %}
    {% for key2, value2 in value.fields %}
        <li>{{ value2.label }}</li>
        {% if value2.renderType=="text" %}
        <div>
            <div class="row">
                <div class="col-md-6 form-item">
                    <div class="form-group check-box form-group-sm">
                        <label for="dateAndTime" class="col-md-4 control-label">发生日期时间</label>
                        <div class="col-md-6">
                            <input required readonly id="dateAndTime" name="adverseEventsReportedInfo[dateAndTime]"
                                   class="form-control workinput wicon"
                                   type="text">
                        </div>
                        <div class="col-md-2">
                            <p id="dateAndTimeFormate" style="line-height: 30px;text-align: left;"></p>
                        </div>
                    </div>
                </div>
            </div>
        {% endif %}
    {% else %}
        <li>This would display if the 'item' collection were empty</li>
    {% endfor %}
{% else %}
  <li>This would display if the 'item' collection were empty</li>
{% endfor %}
</div>
<p class="form-tit">发生不良事件/错误的名称</p>
<div class="form-radio">
    <label style="width:22%;margin-left: 10px;" class="radio-inline">
        <input required type="radio" name="adverseEventContent[adverseEventOrWrongName]" value="处方/用药医嘱错误">
        处方/用药医嘱错误
    </label>
    <label style="width:22%" class="radio-inline">
        <input required type="radio" name="adverseEventContent[adverseEventOrWrongName]" value="药品准备错误">
        药品准备错误
    </label>
    <label style="width:22%" class="radio-inline">
        <input required type="radio" name="adverseEventContent[adverseEventOrWrongName]" value="药品用法错误">药品用法错误
    </label>
    <label style="width:22%" class="radio-inline">
        <input required type="radio" name="adverseEventContent[adverseEventOrWrongName]" value="配与管理错误">配与管理错误
    </label>
    <label style="width:22%" class="radio-inline">
        <input required type="radio" name="adverseEventContent[adverseEventOrWrongName]" value="药物不良反应">药物不良反应
    </label>
    <script class="selected-radio-tmpl" type="text/html">
        <div class="selected-radio">
            <div class="form-group check-box">
                <label class="col-md-2 control-label">处方/用药医嘱错误</label>
                <div class="col-md-10">
                    <select required class="form-control"
                            name="adverseEventContent[adverseEventOrWrongNameSelection]"
                            style="width:230px">
                        <option value="-1">选择处方/用药医嘱错误</option>
                        <option value="口头处方/用药医嘱">口头处方/用药医嘱</option>
                        <option value="口头变更处方/用药医嘱">口头变更处方/用药医嘱</option>
                        <option value="手写处方/用药医嘱字跡潦草不清">手写处方/用药医嘱字跡潦草不清</option>
                        <option value="处方/用药医嘱变更字跡潦草不清">处方/用药医嘱变更字跡潦草不清</option>
                        <option value="处方/医嘱无用法">处方/医嘱无用法</option>
                        <option value="处方/医嘱剂量单位不正确">处方/医嘱剂量单位不正确</option>
                        <option value="使用不正确的缩写/略语">使用不正确的缩写/略语</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
        </div>
    </script>
    <script class="selected-radio-tmpl" type="text/html">
        <div class="selected-radio">
            <div class="form-group check-box">
                <label class="col-md-2 control-label">药品准备错误</label>
                <div class="col-md-10">
                    <select required class="form-control"
                            name="adverseEventContent[adverseEventOrWrongNameSelection]"
                            style="width:230px">
                        <option value="药品准备错误">药品准备错误</option>
                    </select>
                </div>
            </div>
        </div>
    </script>
    <script class="selected-radio-tmpl" type="text/html">
        <div class="selected-radio">
            <div class="form-group check-box">
                <label class="col-md-2 control-label">药品用法错误</label>
                <div class="col-md-10">
                    <select required class="form-control"
                            name="adverseEventContent[adverseEventOrWrongNameSelection]"
                            style="width:230px">
                        <option value="-1">选择药品用法错误</option>
                        <option value="皮下注射">皮下注射</option>
                        <option value="肌肉注射">肌肉注射</option>
                        <option value="静脉注射">静脉注射</option>
                        <option value="动脉注射">动脉注射</option>
                        <option value="周围静脉滴注">周围静脉滴注</option>
                        <option value="中心周围静脉滴注">中心周围静脉滴注</option>
                        <option value="外用">外用</option>
                        <option value="口服">口服</option>
                        <option value="直肠内用药">直肠内用药</option>
                        <option value="滴眼、滴耳、滴鼻">滴眼、滴耳、滴鼻</option>
                        <option value="其他用法">其他用法</option>
                    </select>
                </div>
            </div>
        </div>
    </script>
    <script class="selected-radio-tmpl" type="text/html">
        <div class="selected-radio">
            <div class="form-group check-box">
                <label class="col-md-2 control-label">调配与管理错误</label>
                <div class="col-md-10">
                    <select required class="form-control"
                            name="adverseEventContent[adverseEventOrWrongNameSelection]"
                            style="width:230px">
                        <option value="-1">选择调配与管理错误</option>
                        <option value="内服药调配与管理">内服药调配与管理</option>
                        <option value="外用药调配与管理">外用药调配与管理</option>
                        <option value="注射药调配与管理">注射药调配与管理</option>
                        <option value="血液制剂管理">血液制剂管理</option>
                    </select>
                </div>
            </div>
        </div>
    </script>
    <script class="selected-radio-tmpl" type="text/html">
        <div class="selected-radio">
            <div class="form-group check-box">
                <label class="col-md-2 control-label">药物不良反应</label>
                <div class="col-md-10">
                    <select required class="form-control"
                            name="adverseEventContent[adverseEventOrWrongNameSelection]"
                            style="width:230px">
                        <option value="-1">选择药物不良反应</option>
                        <option value="药品不良反应">药品不良反应</option>
                        <option value="用药错误">用药错误</option>
                        <option value="药品质量问题">药品质量问题</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
        </div>
    </script>
</div>
<div>copyright</div>
<script>
$(function(){
$(document).on("change", ".form-radio input:radio", function () {
        var label = $(this).parent();
        label.siblings(".selected-radio").remove();
        label.parent().append(label.siblings(".selected-radio-tmpl").eq(label.index()).html())
    });
})
    
</script>
</body>
