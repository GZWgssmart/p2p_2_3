layui.use('laydate', function () {
    var laydate = layui.laydate;
    laydate.render({
        elem: '#date1'
        , type: 'datetime'
    });

    laydate.render({
        elem: '#date2'
        , type: 'datetime'
    });

    laydate.render({
        elem: '#date3'
        , type: 'datetime'
    });

    laydate.render({
        elem: '#date4'
        , type: 'datetime'
    });

    laydate.render({
        elem: '#date5'
        , type: 'datetime'
    });

    laydate.render({
        elem: '#date6'
        , type: 'datetime'
    });

});

var laypage;
layui.use(['laypage','layer','element'], function(){
    var element = layui.element;
    laypage = layui.laypage
    vue.getJsonRecharge(laypage);
});
var vue = new Vue({
    el:"#app",
    data:{
        rows:[],
        
    },
    created () {
    },
    computed: {

    },
    methods:{
        search () {
            this.getJsonRecharge(laypage);
        },
        getJsonRecharge(laypage){
            $.getJSON('/LogCz/data/json/PagerCriteria', {
                pageNumber: 1,
                pageSize: 5,
                dateQuery:vue.dateQuery
            }, function(res){
                laypage.render({
                    elem: 'recharge',
                    count: res.total,
                    limit :5,
                    jump: function(e, first){
                        if (!first) {
                            vue.getJsonRechargeList(e);
                        } else {
                            vue.getJsonRechargeList(e);
                        }
                    }
                });
            });
        },
        getJsonRechargeList (e) {
            $.getJSON('/LogCz/data/json/PagerCriteria', {
                pageNumber: e.curr,
                pageSize: e.limit,
                dateQuery:vue.dateQuery
            }, function (res) {
                vue.rows = res.rows;
            });
        },
    },
    watch:{

    }
});

