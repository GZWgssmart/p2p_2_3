var laypage;
layui.use(['laypage','layer','element'], function(){
    var element = layui.element;
    laypage = layui.laypage
    vue.getJsonLogMoney(laypage);
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
            this.getJsonLogMoney(laypage);
        },
        getJsonLogMoney(laypage){
            $.getJSON('/LogMoney/data/json/PagerCriteria', {
                pageNumber: 1,
                pageSize: 5,
                dateQuery:vue.dateQuery
            }, function(res){
                laypage.render({
                    elem: 'logmoney',
                    count: res.total,
                    limit :5,
                    jump: function(e, first){
                        if (!first) {
                            vue.getJsonLogMoneyList(e);
                        } else {
                            vue.getJsonLogMoneyList(e);
                        }
                    }
                });
            });
        },
        getJsonLogMoneyList (e) {
            $.getJSON('/LogMoney/data/json/PagerCriteria', {
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