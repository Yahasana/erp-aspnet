﻿$(document).ready(function(){
    });    
    var pageCount = 10;//每页计数
    var totalRecord = 0;
    var pagerStyle = "flickr";//jPagerBar样式
    var currentPageIndex = 1;
    var action = "";//操作
    var orderBy = "";//排序字段
    //jQuery-ajax获取JSON数据
    function TurnToPage(pageIndex)
    {
           currentPageIndex = pageIndex;
           document.getElementById("btnAll").checked=false;
           var serch=document.getElementById("hidSearchCondition").value;
           currentPageIndex = pageIndex;
           var Subquey="";
           $.ajax({
           type: "POST",//用POST方式传输
           dataType:"json",//数据格式:JSON
           url:  '../../../Handler/Office/SystemManager/RoleInfoList.ashx',//目标地址
           cache:false,
          data: "pageIndex="+pageIndex+"&pageCount="+pageCount+"&action="+action+"&orderby="+orderBy+"&" + serch,//数据
           beforeSend:function(){AddPop();$("#pageDataList1_Pager").hide();},//发送数据之前
           
           success: function(msg){
                    //数据获取完毕，填充页面据显示
                    //数据列表
                    $("#pageDataList1 tbody").find("tr.newrow").remove();
                    $.each(msg.data,function(i,item){
                        if(item.RoleID != null && item.RoleID != "")
                        $("<tr class='newrow'></tr>").append("<td height='22' align='center'>"+"<input id='Checkbox1' name='Checkbox1'  value="+item.RoleID+" onclick=IfSelectAll('Checkbox1','btnAll') type='checkbox'/>"+"</td>"+
                        "<td height='22' align='center'><a href='" + GetLinkParamEdit() + "&RoleIDFlag=" + item.RoleID + "')>"+ item.RoleName+"</a></td>"+
                        "<td height='22' align='center'>"+item.ModifiedDate.substring(0,10)+"</td>"+
                        "<td height='22' align='center'>"+item.ModifiedUserID+"</td>"+
                        "<td height='22' align='center'>"+item.remark+"</td>").appendTo($("#pageDataList1 tbody"));
                   });
                    //页码
                   ShowPageBar("pageDataList1_Pager",//[containerId]提供装载页码栏的容器标签的客户端ID
                   "<%= Request.Url.AbsolutePath %>",//[url]
                    {style:pagerStyle,mark:"pageDataList1Mark",
                    totalCount:msg.totalCount,showPageNumber:3,pageCount:pageCount,currentPageIndex:pageIndex,noRecordTip:"没有符合条件的记录",preWord:"上一页",nextWord:"下一页",First:"首页",End:"末页",
                    onclick:"TurnToPage({pageindex});return false;"}//[attr]
                    );
                  totalRecord = msg.totalCount;
                 // $("#pageDataList1_Total").html(msg.totalCount);//记录总条数
                 document.getElementById('Text2').value=msg.totalCount;
//                  document.all["Text2"].value=msg.totalCount;
                  $("#ShowPageCount").val(pageCount);
                  ShowTotalPage(msg.totalCount,pageCount,pageIndex);
                    ShowTotalPage(msg.totalCount,pageCount,pageIndex,$("#pagecount"));
                  $("#ToPage").val(pageIndex);
                  },
           error: function() {showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","请求发生错误！");}, 
           complete:function(){hidePopup();$("#pageDataList1_Pager").show();Ifshow(document.getElementById('Text2').value);pageDataList1("pageDataList1","#E7E7E7","#FFFFFF","#cfc","cfc");}//接收数据完毕
           });
    }
    
    
 function GetLinkParamEdit()
{
  //获取模块功能ID
    var ModuleID = document.getElementById("hidModuleID").value;
    //获取查询条件
    searchCondition = document.getElementById("hidSearchCondition").value;
    //是否点击了查询标识
    var flag = "0";//默认为未点击查询的时候
    if (searchCondition != "") flag = "1";//设置了查询条件时
    linkParam = "RoleInfo_Add.aspx?orderby=" + orderBy + "&PageIndex=" + currentPageIndex + "&PageCount=" + pageCount + "&" + searchCondition + "&Flag=" + flag+"&ModuleID="+ModuleID;
    //返回链接的字符串
    return linkParam;
}    
    //table行颜色
function pageDataList1(o,a,b,c,d){
	var t=document.getElementById(o).getElementsByTagName("tr");
	for(var i=1;i<t.length;i++){
		t[i].style.backgroundColor=(t[i].sectionRowIndex%2==0)?a:b;
		t[i].onmouseover=function(){
			if(this.x!="1")this.style.backgroundColor=c;
		}
		t[i].onmouseout=function(){
			if(this.x!="1")this.style.backgroundColor=(this.sectionRowIndex%2==0)?a:b;
		}
	}
}

function Fun_Search_UserInfo(currPage)
{
      var fieldText = "";
      var msgText = "";
      var isFlag = true;
      var RetVal=CheckSpecialWords();
    if(RetVal!="")
    {
            isFlag = false;
            fieldText = fieldText + RetVal+"|";
   		    msgText = msgText +RetVal+  "不能含有特殊字符|";
    }
      if(!isFlag)
      {
           popMsgObj.Show(fieldText,msgText);
           return;
      }
    var search = "";
    var RoleName= document.getElementById("txtRoleName").value;
    search+="RoleName="+escape(RoleName);
    //设置检索条件
    document.getElementById("hidSearchCondition").value = search;
    if (currPage == null || typeof(currPage) == "undefined")
    {
        TurnToPage(1);
    }
    else
    {
        TurnToPage(parseInt(currPage));
    }
}

function GetLinkParam()
{
    //获取模块功能ID
    var ModuleID = document.getElementById("hidModuleID").value;
    //获取查询条件
    searchCondition = document.getElementById("hidSearchCondition").value;
    //是否点击了查询标识
    var flag = "0";//默认为未点击查询的时候
    if (searchCondition != "") flag = "1";//设置了查询条件时
    linkParam = "RoleInfo_Edit.aspx?orderby=" + orderBy + "&PageIndex=" + currentPageIndex + "&PageCount=" + pageCount + "&" + searchCondition + "&Flag=" + flag+"&ModuleID="+ModuleID;
    //返回链接的字符串
    return linkParam;
}


//删除角色信息
 function DelRoleInfo()
   {
   
        var c=window.confirm("确认执行删除操作吗？")
        if(c==true)
        {
              var ck = document.getElementsByName("Checkbox1");
        var x=Array(); 
        var ck2 = "";
        var str="";
        for( var i = 0; i < ck.length; i++ )
        {
            if ( ck[i].checked )
            {
               ck2 += ck[i].value+',';
            }
        }
         x=ck2;
        var str = ck2.substring(0,ck2.length-1);
        if(x.length-1<1)
            showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","删除角色至少要选择一项！");
        else
          {
        var userid=str;
        var flag="del";
        $.ajax({ 
                  type: "POST",
                 url: "../../../Handler/Office/SystemManager/RoleInfo.ashx?RoleID="+str+"&flag="+flag+"",
                  dataType:'json',//返回json格式数据
//                  data:flag,
                  cache:false,
                  beforeSend:function()
                  { 
                     //AddPop();
                  }, 
                  //complete :function(){ //hidePopup();},
                  error: function() 
                  {
                    popMsgObj.ShowMsg('请求发生错误');
                    
                  }, 
                  success:function(data) 
                  { 
                    if(data.sta==1) 
                    {
                        popMsgObj.ShowMsg(data.info);
                        Fun_Search_UserInfo();
                    }
                    else
                    {
                        popMsgObj.ShowMsg(data.info);
                    }
                  } 
               });
            
          }
        }  
        else   return   false;   
   
   }
function Ifshow(count)
    {
       if(count=="0")
        {
        document.getElementById('divpage').style.display = "none";
        document.getElementById('pagecount').style.display = "none";
        }
        else
        {
         document.getElementById('divpage').style.display = "block";
        document.getElementById('pagecount').style.display = "block";
        }
    }
    
    function SelectDept(retval)
    {
        alert(retval);
    }
    
    //改变每页记录数及跳至页数
    function ChangePageCountIndex(newPageCount,newPageIndex)
    {
            if(!IsZint(newPageCount))
       {  showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","显示条数格式错误，必须是正整数！");
          return;
       }
       if(!IsZint(newPageIndex))
       {  showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","跳转页数格式错误，必须是正整数！");
          return;
       }
        if(newPageCount <=0 || newPageIndex <= 0 ||  newPageIndex  > ((totalRecord-1)/newPageCount)+1 )
        {
            showPopup("../../../Images/Pic/Close.gif","../../../Images/Pic/note.gif","转到页数超出查询范围！");
            return false;
        }
        else
        {
            this.pageCount=parseInt(newPageCount);
            TurnToPage(parseInt(newPageIndex));
        }
    }
    //排序
    function OrderBy(orderColum,orderTip)
    {
        var ordering = "a";
        //var orderTipDOM = $("#"+orderTip);
        var allOrderTipDOM  = $(".orderTip");
        if( $("#"+orderTip).html()=="↓")
        {
             allOrderTipDOM.empty();
             $("#"+orderTip).html("↑");
        }
        else
        {
            ordering = "d";
            allOrderTipDOM.empty();
            $("#"+orderTip).html("↓");
        }
        orderBy = orderColum+"_"+ordering;
        TurnToPage(1);
    }

 function Show()
    {
        window.location.href = GetLinkParam();
    }
    function OptionCheckAll()
{

  if(document.getElementById("btnAll").checked)
  {
     var ck = document.getElementsByName("Checkbox1");
        for( var i = 0; i < ck.length; i++ )
        {
        ck[i].checked=true ;
        }
  }
  else if(!document.getElementById("btnAll").checked)
  {
    var ck = document.getElementsByName("Checkbox1");
        for( var i = 0; i < ck.length; i++ )
        {
        ck[i].checked=false ;
        }
  }
}