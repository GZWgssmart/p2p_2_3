/**
 * layui自定义的验证有：
 * required（必填项）
 phone（手机号）
 email（邮箱）
 url（网址）
 number（数字）
 date（日期）
 identity（身份证）
 */
//自定义layui表单验证
var form;
$(function () {
    layui.use(['form'], function(){
        form = layui.form;
        form.verify({
            //内容不能为空
            title: function (value) {
                if (value.length == 0) {
                    return '不能为空！';
                }
                else if (value.length < 5) {
                    return '至少得5个字符';
                }
            }
            ,isPInt: [
                /^[+]{0,1}(\d+)$/
                ,'必须为正整数'
            ]
            ,isDInt:[
                /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/
                ,'必须为正数'
            ]
            ,dPoint:[
                /^0{1}([.]\d{1,2})?$|^[1-9]\d*([.]{1}[0-9]{1,2})?$/
                ,'最多有两位小数'
            ]
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
        });
    });
})