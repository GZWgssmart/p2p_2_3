var laypage;
layui.use(['laypage','layer','element'], function(){
    var element = layui.element;
    laypage = layui.laypage
    vue.getJsonWithdraw(laypage);
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
            this.getJsonWithdraw(laypage);
        },
        getJsonWithdraw(laypage){
            $.getJSON('/LogTx/data/json/PagerCriteria', {
                pageNumber: 1,
                pageSize: 5,
                dateQuery:vue.dateQuery
            }, function(res){
                laypage.render({
                    elem: 'withdraw',
                    count: res.total,
                    limit :5,
                    jump: function(e, first){
                        if (!first) {
                            vue.getJsonWithdrawList(e);
                        } else {
                            vue.getJsonWithdrawList(e);
                        }
                    }
                });
            });
        },
        getJsonWithdrawList (e) {
            $.getJSON('/LogTx/data/json/PagerCriteria', {
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