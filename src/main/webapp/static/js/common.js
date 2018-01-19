/**
 * Created by Administrator on 2018/1/2.
 */
function formatDate(date, fmt) {
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    let o = {
        'M+': date.getMonth() + 1,
        'd+': date.getDate(),
        'h+': date.getHours(),
        'm+': date.getMinutes(),
        's+': date.getSeconds()
    };
    for (let k in o) {
        if (new RegExp(`(${k})`).test(fmt)) {
            let str = o[k] + '';
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? str : padLeftZero(str));
        }
    }
    return fmt;
};

function padLeftZero(str) {
    return ('00' + str).substr(str.length);
}

//还款方式格式化
function sway(value) {
    if(value == 1){
        return "等额本息";
    }else if(value == 2){
        return "等额本金"
    }else if(value==3){
        return "每月付息,到期还本";
    }else if(value == 4){
        return "一次性还本付息";
    }
}

//标种格式化
function bz(value) {
    if(value==1){
        return"恒金保"
    }else if(value == 2){
        return "多金宝"
    }else if(value ==3){
        return "新手标"
    }else if(value==4){
        return"普金保"
    }
}

//借款表的借款类型
function borrowapplyType(value) {
    if(value==0){
        return"审核中"
    }else if(value==1){
        return"审核失败"
    }else if(value==2){
        return "投标中"
    }else if(value==3){
        return "已流标"
    }else if(value==4){
        return "还款中"
    }else if(value==5){
        return "已完成"
    }else if(value==6){
        return"前台特殊情况"
    }
}

//用户提现状态
function logTx(value) {
    if(value==0){
        return"未受理"
    }else if(value==1){
        return "提现成功"
    }else if(value==2){
        return"提现失败"
    }
}

function hkbStatus(value) {
    if(value==0){
        return"未还款";
    }else{
        return"已还款";
    }
}

function formatMoney(s,n){
    n = n>0 && n<=20 ? n : 2;
    s = parseFloat((s+"").replace(/[^\d\.-]/g,"")).toFixed(n)+"";
    var l = s.split(".")[0].split("").reverse(),
        r = s.split(".")[1];
    t = "";
    for(i = 0;i<l.length;i++){
        t+=l[i]+((i+1)%3==0 && (i+1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("")+"."+r;
}

