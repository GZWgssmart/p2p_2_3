<html>
<body>
<h2>Hello World!</h2>
</body>
</html>
<script>

    //一次性请求多条数据
    function getSexProduct() {
        return axios.get('/product/data/json/sex');
    }

    function getUser() {
        return axios.get('/User/data/json/sex');
    }

    axios.all([getSexProduct(),getUser()]).then(axios.spread((product,user)=>{
        this.list = product.data.data;
    }));
    //一次性请求多条数据

    // Get请求
    axios.get('/User', {params: {ID: 12345}}).then((response)=>{

    },(error)=>{

    });

    //Post
    var params = new URLSearchParams();
    params.append('phone', this.phone);
    params.append('password', this.password);
    axios.post('/User/data/json/login',params).then((response)=>{

    },(error)=>{

    });



    new Vue({
        el:"id",
        data:{
            sex:0
        },
        created:{
            //Vue实例化之后
        },
        computed: {
            analysis () {
                return this.sex==0?'男':'女';
            }
        },
        methods:{
            method () {

            }
        },
        watch:{
            sex (val,oldval){

            }
        }
    })



</script>
