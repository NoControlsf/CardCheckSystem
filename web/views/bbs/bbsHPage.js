/**
 * Created by Administrator on 2017/6/29.
 */
$(function () {
    //项目根路径
    var basePath=$("#txtRootPath").val();
    //先销毁表格
    $("#mainArticle_table").bootstrapTable("destroy");
    //查询主贴结果
    $("#mainArticle_table").bootstrapTable({
        url:basePath + '/bbs/getMainArticle',
        method:'post',
        contentType:'application/x-www-form-urlencoded',
        dataType:'json',
        dataField:'rows',
        height:368,
        striped:true,//是否显示间隔栏颜色
        cache:false,//是否使用缓存，默认为true
        pagination: true,                   //是否显示分页（*）
        smartDisplay:false,
        sidePagination:'server',
        pageNumber: 1,                       //初始化加载第一页，默认第一页
        pageSize: 5,                       //每页的记录行数（*）
        pageList: [5],        //可供选择的每页的行数（*）
        clickToSelect: true,                //是否启用点击选中行
        //uniqueId: "num",                     //每一行的唯一标识，一般为主键列
        cardView: false,                    //是否显示详细视图
        detailView: false,                   //是否显示父子表
        singleSelect:true,                  //单选
        queryParamsType:"",
        queryParams:function (params) {
            var temp ={
                pSize:params.pageSize,//页码
                pNumber:params.pageNumber//页面大小

            };
            return temp;
        },
        columns:[
            /*{
                field:"num",
                title:"序号",
                halign:"center",
                align:"center",
                width:"5%",
                //页面序号num自增
                formatter:function (value,row,index) {
                    var options = $("#mainArticle_table").bootstrapTable("getOptions");
                    return (options.pageNumber - 1)*(options.pageSize)+index +1;
                }
            },*/
            {
                field:"title",
                title:"主题帖",
                halign:"center",
                align:"left",
                width:"35%"
            },
            {
                field:"contribute_time",
                title:"发布时间",
                halign:"center",
                align:"left",
                width:"35%"
            },
            {
                field:"username",
                title:"作者",
                halign:"center",
                align:"left",
                width:"15%"
            },
            {
                title:"详情",
                halign:"center",
                align:"left",
                width:"10%",
                events:{
                    'click.text-warning':function (e,value,row) {
                        var postD={
                            AID:row.AID
                        };
                        window.location.href="bbsArticle.jsp?postD="+postD;
                    }
                },
                formatter:function () {
                    return [
                        '<a class="text-warning" href="javascript:void(0)" title="帖子详情">',
                        '<i class="fa fa-fw fa-search"></i>查看',
                        '</a> '
                    ].join('');
                }
            }
        ],
        onClickRow:function () {
            
        }




    })
});
