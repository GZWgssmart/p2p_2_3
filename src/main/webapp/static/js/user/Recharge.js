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
        dateQuery:{
            startTime:'',
            endTime:''
        }
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