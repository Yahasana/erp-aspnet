﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StorageCheckPrint.aspx.cs"
    Inherits="Pages_PrinttingModel_StorageManager_StorageCheckPrint" ValidateRequest="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <script src="../../../js/common/Common.js" type="text/javascript"></script>

    <style type="text/css">
        @media print
        {
            .onlyShow
            {
                display: none;
            }
            .onlyPrint
            {
                border-bottom: 1px solid #000000;
                page-break-before: always;
            }
        }
    </style>
    <style type="text/css" media="print">
        .noprint
        {
            border: 0px;
        }
        .noprint2
        {
            display: none;
        }
    </style>
    <style type="text/css" id="cssID">
        .busBtn
        {
            background: url(../../../Images/default/btnbg.gif) 0px -5px;
            border: 1px solid #cccccc;
            padding-top: 2px;
            cursor: pointer;
        }
        .trTitle
        {
            text-align: left;
            vertical-align: middle;
            padding-left: 10px;
            height: 36px;
            font-size: 16px;
            border: 1px solid #000000;
        }
        .tdFirstTitleMyLove
        {
            width: 14%;
            border: 1px solid #000000;
            text-align: center;
            padding: 8px 8px 5px 0px;
            font-size: 12px;
            font-weight: bold;
        }
        .tdFirstTitle
        {
            width: 12%;
            border: 1px solid #000000;
            text-align: right;
            border-top: none;
            padding: 8px 8px 5px 0px;
            font-size: 12px;
        }
        .tdTitle
        {
            border: 1px solid #000000;
            text-align: center;
            border-left: none;
            padding: 8px 8px 5px 0px;
            font-size: 12px;
        }
        .tdTitle2
        {
            width: 12%;
            border: 1px solid #000000;
            text-align: right;
            border-left: none;
            padding: 8px 8px 5px 0px;
            font-size: 12px;
            border-top: none;
        }
        .tdContent
        {
            width: 12%;
            border: 1px solid #000000;
            border-left: none;
            text-align: left;
            padding: 8px 0px 8px 5px;
            overflow: visible;
            word-break: break-all;
            font-size: 12px;
            font-weight: bold;
        }
        .tdContent2
        {
            width: 48%;
            border: 1px solid #000000;
            border-left: none;
            text-align: left;
            border-top: none;
            padding: 8px 0px 8px 5px;
            overflow: visible;
            word-break: break-all;
            font-size: 12px;
        }
        .tdLastContent
        {
            width: 24%;
            border: 1px solid #000000;
            border-left: none;
            text-align: left;
            border-top: none;
            overflow: visible;
            word-break: break-all;
            padding: 8px 0px 8px 5px;
            font-size: 12px;
        }
        .tdColContent
        {
            border: 1px solid #000000;
            border-left: none;
            text-align: left;
            border-top: none;
            overflow: visible;
            word-break: break-all;
            padding: 8px 0px 8px 5px;
            font-size: 12px;
        }
        .tdDetail
        {
            border: 1px solid #000000;
            text-align: left;
            width: 100%;
            border-bottom: none;
            overflow: visible;
            word-break: break-all;
            padding: 5px 0px 5px 5px;
            font-size: 12px;
        }
        .tdPageLast td
        {
            border: 1px solid #000000;
            text-align: left;
            width: 100%;
            overflow: visible;
            word-break: break-all;
            padding: 5px 0px 5px 5px;
            font-size: 12px;
        }
        .trDetailFirst
        {
            border: 1px solid #000000;
            text-align: center;
            padding: 8px 8px 5px 0px;
            font-size: 12px;
            border-top: none;
        }
        .trDetail
        {
            border: 1px solid #000000;
            text-align: center;
            padding: 8px 8px 5px 0px;
            font-size: 12px;
            border-left: none;
            border-top: none;
        }
    </style>

    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>

    <title>期末盘点单</title>

    <script type="text/javascript">


        //此段js兼容ff的outerHTML，去掉后outerHTML在ff下不可用
        if (typeof (HTMLElement) != "undefined" && !window.opera) {
            HTMLElement.prototype.__defineGetter__("outerHTML", function() {
                var a = this.attributes, str = "<" + this.tagName, i = 0; for (; i < a.length; i++)
                    if (a[i].specified)
                    str += " " + a[i].name + '="' + a[i].value + '"';
                if (!this.canHaveChildren)
                    return str + " />";
                return str + ">" + this.innerHTML + "</" + this.tagName + ">";
            });
            HTMLElement.prototype.__defineSetter__("outerHTML", function(s) {
                var r = this.ownerDocument.createRange();
                r.setStartBefore(this);
                var df = r.createContextualFragment(s);
                this.parentNode.replaceChild(df, this);
                return s;
            });
            HTMLElement.prototype.__defineGetter__("canHaveChildren", function() {
                return !/^(area|base|basefont|col|frame|hr|img|br|input|isindex|link|meta|param)$/.test(this.tagName.toLowerCase());
            });
        }


        //打印的方法
        function pageSetup() {
            try {
                window.print();
            }
            catch (e) {
                alert("您的浏览器不支持此功能,请选择：文件→打印(P)…")
            }
        }

        //获取导出至excel的html的方法
        function fnGetTable() {
            var o_hid = document.getElementById("hiddExcel");
            o_hid.value = "";
            o_hid.value = o_hid.value + document.getElementById("cssID").outerHTML + document.getElementById("divMain").innerHTML;

            return true;
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <object classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0" id="WB" width="0">
        </object>
        <span class="noprint2" style="text-align: center; margin-top: 4px; width: 640px;">
            <input type="button" id="print" value=" 打 印 " onclick="pageSetup();" class="busBtn" />
            <asp:Button ID="btnImport" runat="server" Text=" 导 出 " CssClass="busBtn" OnClientClick="return fnGetTable();"
                OnClick="btnImport_Click" />
            <input type="button" id="btnSet" value=" 打印模板设置 " onclick="ShowPrintSetting();" class="busBtn" />
        </span>
        <div id="divMain" align="center">
            <table width="640px" border="0" style="font-size: 12px;">
                <tbody id="tableBase" runat="server">
                </tbody>
            </table>
            <table width="640px" border="0" cellpadding="0" cellspacing="1">
                <tbody id="tableDetail" runat="server">
                </tbody>
            </table>
        </div>
        <input type="hidden" id="hiddExcel" runat="server" />
    </div>
    <!-- Start 参数设置 -->
    <div align="center" id="div_InInfo" style="width: 70%; z-index: 100; position: absolute;
        display: none">
        <table border="0" cellspacing="1" bgcolor="#999999" style="width: 70%">
            <tr>
                <td bgcolor="#EEEEEE" align="center">
                    <table width="100%">
                        <tr>
                            <td align="left" onmousedown="MoveDiv('div_InInfo',event)" title="点击此处可以拖动窗口" onmousemove="this.style.cursor='move';"
                                style="font-size: 12px; font-weight: bold;">
                                &nbsp;&nbsp;打印模板设置
                            </td>
                            <td width="50" align="right" >
                                <img src="../../../images/default/0420close.gif" onclick='ClosePrintSetting();' style="cursor: hand;" />
                            </td>
                        </tr>
                    </table>
                    <table width="99%" border="0" cellspacing="1" bgcolor="#CCCCCC">
                        <tr>
                            <td bgcolor="#FFFFFF" align="center" valign="top" style="width: 90%">
                                <div id="divSet" style="display: none; width: 796px; overflow-x: auto; overflow-y: auto;
                                    height: 400px; scrollbar-face-color: #E7E7E7; scrollbar-highlight-color: #ffffff;
                                    scrollbar-shadow-color: COLOR:#000000; scrollbar-3dlight-color: #ffffff; scrollbar-darkshadow-color: #ffffff;">
                                    <!-- Start 打印模板设置 -->
                                    <table border="0" cellspacing="1" bgcolor="#CCCCCC" style="font-size: 12px;">
                                        <tr>
                                            <td bgcolor="#FFFFFF" align="left">
                                                <table width="100%" border="0" align="center" cellspacing="0">
                                                    <tr>
                                                        <td height="20" colspan="3" bgcolor="#E1F0FF" style="font-weight: bold; color: #5D5D5D;">
                                                            基本信息
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                            <input type="checkbox" name="ckOutNo" id="ckOutNo" value="OutNo" />
                                                            <input type="text" id="txtMRPNo" readonly value="盘点单编号："  size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckTitle" id="ckTitle" value="Title" />
                                                            <input type="text" id="txtTitle" value="盘点单主题：" readonly size="10" />
                                                        </td>
                                                         <td>
                                                        <input type="checkbox" name="ckUserSender" id="ckUserSender" value="UserSender" />
                                                            <input type="text" id="txtUserSender" value="经办人：" readonly size="10" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckSellDept" id="ckSellDept" value="SellDept" />
                                                         <input type="text" id="txtSellDept" value="盘点部门：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckFromBillID" id="ckFromBillID" value="FromBillID" />
                                                            <input type="text" id="txtFromBillID" value="盘点仓库：" readonly size="10" />
                                                        </td>
                                                        <td >
                                                        <input type="checkbox" name="ckCustName" id="ckCustName" value="CustName" />
                                                            <input type="text" id="txtCustName" value="盘点类型：" readonly size="10" />
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckSeller" id="ckSeller" value="Seller" />
                                                            <input type="text" id="txtSeller" value="盘点开始日期：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckSendAddress" id="ckSendAddress" value="SendAddress" />
                                                            <input type="text" id="txtSendAddress" value="盘点结束日期：" readonly size="10" />
                                                        </td>
                                                        <td >
                                                        <input type="checkbox" name="ckArrAddress" id="ckArrAddress" value="ArrAddress" />
                                                         <input type="text" id="txtArrAddress" value="库存调整人：" readonly size="10" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckOutDate" id="ckOutDate" value="OutDate" />
                                                            <input type="text" id="txtOutDate" value="库存调整日期：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckSummary" id="ckSummary" value="Summary" />
                                                            <input type="text" id="txtSummary" value="摘要：" readonly size="10" />
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                    <tbody id="extTable">
                                                        <tr class='ext'>
                                                            <td width="20%" align="left">
                                                            <input type="checkbox" name="ckExtField1" id="ckExtField1" value="ExtField1" style="display: none" />
                                                                <input type="text" id="txtExtField1" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                            <td width="20%" align="left">
                                                            <input type="checkbox" name="ckExtField2" id="ckExtField2" value="ExtField2" style="display: none" />
                                                                <input type="text" id="txtExtField2" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                            <td>
                                                            <input type="checkbox" name="ckExtField3" id="ckExtField3" value="ExtField3" style="display: none" />
                                                                <input type="text" id="txtExtField3" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                        </tr>
                                                        <tr class='ext'>
                                                            <td width="20%" align="left">
                                                            <input type="checkbox" name="ckExtField4" id="ckExtField4" value="ExtField4" style="display: none" />
                                                                <input type="text" id="txtExtField4" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                            <td width="20%" align="left">
                                                            <input type="checkbox" name="ckExtField5" id="ckExtField5" value="ExtField5" style="display: none" />
                                                                <input type="text" id="txtExtField5" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                            <td>
                                                            <input type="checkbox" name="ckExtField6" id="ckExtField6" value="ExtField6" style="display: none" />
                                                                <input type="text" id="txtExtField6" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                        </tr>
                                                        <tr class='ext'>
                                                            <td width="20%" align="left">
                                                            <input type="checkbox" name="ckExtField7" id="ckExtField7" value="ExtField7" style="display: none" />
                                                                <input type="text" id="txtExtField7" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                            <td width="20%" align="left">
                                                            <input type="checkbox" name="ckExtField8" id="ckExtField8" value="ExtField8" style="display: none" />
                                                                <input type="text" id="txtExtField8" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                            <td>
                                                            <input type="checkbox" name="ckExtField9" id="ckExtField9" value="ExtField9" style="display: none" />
                                                                <input type="text" id="txtExtField9" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                        </tr>
                                                        <tr class='ext'>
                                                            <td width="20%" align="left">
                                                            <input type="checkbox" name="ckExtField10" id="ckExtField10" value="ExtField10" style="display: none" />
                                                                <input type="text" id="txtExtField10" value="" readonly size="10" style="display: none" />
                                                            </td>
                                                            <td width="20%" align="left">
                                                            </td>
                                                            <td>
                                                            </td>
                                                           
                                                        </tr>
                                                    </tbody>
                                                    <tr>
                                                        <td height="20" colspan="3" bgcolor="#E1F0FF" style="font-weight: bold; color: #5D5D5D;">
                                                            合计信息
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckTotalCount" id="ckTotalCount" value="TotalCount" />
                                                            <input type="text" id="txtTotalCount" value="现有存量合计：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckTotalPrice" id="ckTotalPrice" value="TotalPrice" />
                                                            <input type="text" id="txtTotalPrice" value="实盘量合计：" readonly size="10" />
                                                        </td>
                                                        <td>
                                                            <input type="checkbox" name="ckDiffCount" id="ckDiffCount" value="DiffCount" />
                                                            <input type="text" id="Text1" value="差异量合计：" readonly size="10" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckNowMoney" id="ckNowMoney" value="NowMoney" />
                                                            <input type="text" id="Text2" value="现存金额：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckCheckMoney" id="ckCheckMoney" value="CheckMoney" />
                                                            <input type="text" id="Text3" value="实盘金额：" readonly size="10" />
                                                        </td>
                                                        <td>
                                                            <input type="checkbox" name="ckDiffMoney" id="ckDiffMoney" value="DiffMoney" />
                                                            <input type="text" id="Text4" value="差异金额：" readonly size="10" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="20" colspan="3" bgcolor="#E1F0FF" style="font-weight: bold; color: #5D5D5D;">
                                                            备注信息
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckStrBillStatusText" id="ckStrBillStatusText" value="strBillStatusText" />
                                                            <input type="text" id="txtStrBillStatusText" value="单据状态：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckCreatorReal" id="ckCreatorReal" value="CreatorReal" />
                                                            <input type="text" id="txtCreatorReal" value="制单人：" readonly size="10" />
                                                        </td>
                                                        <td>
                                                        <input type="checkbox" name="ckCreateDate" id="ckCreateDate" value="CreateDate" />
                                                            <input type="text" id="txtCreateDate" value="制单日期：" readonly size="10" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckConfirmorReal" id="ckConfirmorReal" value="ConfirmorReal" />
                                                            <input type="text" id="txtConfirmorReal" value="确认人：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckConfirmDate" id="ckConfirmDate" value="ConfirmDate" />
                                                            <input type="text" id="txtConfirmDate" value="确认日期：" readonly size="10" />
                                                        </td>
                                                        <td>
                                                        <input type="checkbox" name="ckCloserReal" id="ckCloserReal" value="CloserReal" />
                                                            <input type="text" id="txtCloserReal" value="结单人：" readonly size="10" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckCloseDate" id="ckCloseDate" value="CloseDate" />
                                                            <input type="text" id="txtCloseDate" value="结单日期：" readonly size="10" />
                                                        </td>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckModifiedUserID" id="ckModifiedUserID" value="ModifiedUserID" />
                                                            <input type="text" id="txtModifiedUserID" value="最后更新人：" readonly size="10" />
                                                        </td>
                                                        <td>
                                                        <input type="checkbox" name="ckModifiedDate" id="ckModifiedDate" value="ModifiedDate" />
                                                            <input type="text" id="txtModifiedDate" value="最后更新日期：" readonly size="10" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%" align="left">
                                                        <input type="checkbox" name="ckRemark" id="ckRemark" value="Remark" />
                                                            <input type="text" id="txtRemark" value="备注：" readonly size="10" />
                                                        </td>
                                                        <td  width="20%">
                                                        </td>
                                                        <td>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td height="20" colspan="3" bgcolor="#E1F0FF" style="font-weight: bold; color: #5D5D5D;">
                                                            明细信息
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <table width="100%" border="0" cellspacing="1" bgcolor="#000000" id="pageDataList1">
                                                                <tr>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdSortNo" id="ckdSortNo" value="SortNo" /><input type="text"
                                                                            id="txtDSortNo" value="序号" size="5" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdProdNo" id="ckdProdNo" value="ProdNo" /><input type="text"
                                                                            id="txtDProductNo" value="物品编号" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdProductName" id="ckdProductName" value="ProductName" /><input
                                                                            type="text" id="txtDProductName" value="物品名称" readonly size="10" />
                                                                    </td>
                                                                     <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdBatchNo" id="ckdBatchNo" value="BatchNo" /><input
                                                                            type="text" id="txtBatchNo" value="批次" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdType" id="ckdType" value="Type" /><input
                                                                            type="text" id="txtDType" value="规格" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF" id="td_BaseUnit">
                                                                        <input type="checkbox" name="ckdBaseUnit" id="ckdBaseUnit" value="BaseUnit" /><input
                                                                            type="text" id="txtBaseUnit" value="基本单位" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF" id="td_BaseCount">
                                                                        <input type="checkbox" name="ckdBaseCount" id="ckdBaseCount" value="BaseCount" /><input
                                                                            type="text" id="txtBaseCount" value="基本数量" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdUnitName" id="ckdUnitName" value="UnitName" /><input
                                                                            type="text" id="txtDUnitName" value="单位" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdOutPrice" id="ckdOutPrice" value="OutPrice" /><input
                                                                            type="text" id="txtDOutPrice" value="成本单价" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdNoteCount" id="ckdNoteCount" value="NoteCount" /><input
                                                                            type="text" id="txtDNoteCount" value="现存数量" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdNotOutCount" id="ckdNotOutCount" value="NotOutCount" /><input
                                                                            type="text" id="txtDNotOutCount" value="实盘数量" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdOutCount" id="ckdOutCount" value="OutCount" /><input
                                                                            type="text" id="txtDOutCount" value="盈亏类型" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdOutMoney" id="ckdOutMoney" value="OutMoney" /><input
                                                                            type="text" id="txtDOutMoney" value="差异量" readonly size="10" />
                                                                    </td>
                                                                    <td bgcolor="#FFFFFF">
                                                                        <input type="checkbox" name="ckdRemark" id="ckdRemark" value="Remark" /><input type="text"
                                                                            id="txtDRemark" value="备注" readonly size="10" />
                                                                    </td>                                                                    
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <input type="hidden" id="hidBillTypeFlag" name="hidBillTypeFlag" runat="server" />
                                    <input type="hidden" id="hidPrintTypeFlag" name="hidPrintTypeFlag" runat="server" />
                                    <input type="hidden" id="isSeted" value="0" runat="server" />
                                     <input type="hidden" id="hidno" runat="server" />
                                     <input type="hidden" id="HiddenMoreUnit" runat="server" /><!--是否显示多计量单位-->
                                    <!-- End 打印模板设置 -->
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td align="center">
                                <input type="button" id="btnPrintSave" name="btnPrintSave" value=" 保 存 " class="busBtn"
                                    onclick="SavePrintSetting();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="divPageMask" style="display: none">
        <iframe id="PageMaskIframe" frameborder="0" width="100%"></iframe>
    </div>
    <!-- End 参数设置-->
    </form>
    <p>
</body>
</html>


<script src="../../../js/common/PrintParameterSetting.js" type="text/javascript"></script>

<script language="javascript">
    var intMrpID = <%=intMrpID %>;
    var StrNo_ = $("#hidno").val();
    //弹出单据显示信息
    function ShowPrintSetting() {
        isDisplayMoreUnit();
        document.getElementById('div_InInfo').style.display = 'block';
        CenterToDocument("div_InInfo", true);
        openRotoscopingDiv(false, "divPageMask", "PageMaskIframe");
        document.getElementById('divSet').style.display='block';
        LoadPrintSettingInfo();
        //LoadBillData();
        LoadExtTableName('officedba.StorageCheck');

    }
//是否显示多单位
function isDisplayMoreUnit()
{
    var HiddenUnit=$("#HiddenMoreUnit").val();
    if(HiddenUnit=="True")
    {}
    else
    {
        $("#td_BaseUnit").hide();
        $("#td_BaseCount").hide();
    }
}   
function ClosePrintSetting() {
        document.getElementById('div_InInfo').style.display = 'none';
        closeRotoscopingDiv(false, 'divPageMask');
    } 
    /*加载打印模板设置信息*/
    function LoadPrintSettingInfo() {
        var HiddenUnit=$("#HiddenMoreUnit").val();
        var hidBillTypeFlag = document.getElementById('hidBillTypeFlag').value;
        var hidPrintTypeFlag = document.getElementById('hidPrintTypeFlag').value;
        var hidIsSeted = document.getElementById('isSeted').value;



        /*主表：复选框及其对应的字段*/
        var dbBase = new Array(
                                ['ckExtField1', 'ExtField1'],
                                ['ckExtField2', 'ExtField2'],
                                ['ckExtField3', 'ExtField3'],
                                ['ckExtField4', 'ExtField4'],
                                ['ckExtField5', 'ExtField5'],
                                ['ckExtField6', 'ExtField6'],
                                ['ckExtField7', 'ExtField7'],
                                ['ckExtField8', 'ExtField8'],
                                ['ckExtField9', 'ExtField9'],
                                ['ckExtField10', 'ExtField10'],
                                ['ckOutNo', 'CheckNo'],//盘点单编号
                                ['ckTitle', 'Title'],//盘点单主题
                                ['ckFromBillID', 'StorageName'],//盘点仓库---
                                ['ckCustName', 'CheckTypeName'],//盘点类型----
                                ['ckSellDept', 'DeptName'],//盘点部门
                                ['ckSeller', 'CheckStartDate'],//盘点开始日期
                                ['ckSendAddress', 'CheckEndDate'],//盘点结束日期
                                ['ckArrAddress', 'CheckUserName'],//库存调整人
                                ['ckUserSender', 'TransactorName'],//经办人                                
                                ['ckOutDate', 'CheckDate'],//库存调整日期                                
                                ['ckTotalCount', 'NowCount'],//现有存量合计                                
                                ['ckTotalPrice', 'CheckCount'],//实盘量合计
                                ['ckDiffCount', 'DiffCount'],//差异量合计
                                ['ckNowMoney', 'NowMoney'],//现存金额
                                ['ckCheckMoney', 'CheckMoney'],//实盘金额
                                ['ckDiffMoney', 'DiffMoney'],//差异金额
                                ['ckCreatorReal', 'CreatorName'],//制单人                                
                                ['ckCreateDate', 'CreateDate'],//制单日期-----                                
                                ['ckConfirmorReal', 'ConfirmorName'],//确认人
                                ['ckConfirmDate', 'ConfirmDate'],//确认日期
                                ['ckCloserReal', 'CloserName'],//结单人
                                ['ckCloseDate', 'CloseDate'],//结单日期
                                ['ckModifiedUserID', 'ModifiedUserID'],//最后更新人
                                ['ckModifiedDate', 'ModifiedDate'],//最后更新日期                                
                                ['ckStrBillStatusText', 'BillStatusName'],//单据状态-----                                
                                ['ckRemark', 'Remark'],//备注
                                ['ckSummary', 'Summary']);//摘要
        /*明细表：复选框及其对应的字段*/
        var dbDetail=new Array();
        if(HiddenUnit=="True")
        {
              dbDetail = new Array(['ckdSortNo', 'SortNo'],//序号
                                 ['ckdProdNo', 'ProdNo'],//物品编号
                                 ['ckdProductName', 'ProductName'],//物品名称
                                 ['ckdBatchNo', 'BatchNo'],//批次
                                 ['ckdType', 'Specification'],//规格
                                 ['ckdBaseUnit', 'UnitName'],//基本单位
                                 ['ckdBaseCount', 'CheckCount'],//基本数量
                                 ['ckdUnitName', 'UsedUnitName'],//单位
                                 ['ckdOutPrice', 'UsedPrice'],//成本单价
                                 ['ckdNoteCount', 'NowCount'],//现存数量
                                 ['ckdNotOutCount', 'UsedUnitCount'],//实盘数量
                                 ['ckdOutCount', 'DiffTypeName'],//盈亏类型-----
                                 ['ckdOutMoney', 'DiffCount'],//差异量
                                 ['ckdRemark', 'Remark']);//备注
        }
        else
        {
                dbDetail = new Array(['ckdSortNo', 'SortNo'],//序号
                                 ['ckdProdNo', 'ProdNo'],//物品编号
                                 ['ckdProductName', 'ProductName'],//物品名称
                                 ['ckdBatchNo', 'BatchNo'],//批次
                                 ['ckdType', 'Specification'],//规格
                                 ['ckdUnitName', 'UnitName'],//单位
                                 ['ckdOutPrice', 'StandardCost'],//成本单价
                                 ['ckdNoteCount', 'NowCount'],//现存数量
                                 ['ckdNotOutCount', 'CheckCount'],//实盘数量
                                 ['ckdOutCount', 'DiffTypeName'],//盈亏类型-----
                                 ['ckdOutMoney', 'DiffCount'],//差异量
                                 ['ckdRemark', 'Remark']);//备注
         }

        /*加载打印参数设置*/
        LoadCommonPrintParameterSet(hidBillTypeFlag, hidPrintTypeFlag,hidIsSeted, dbBase, dbDetail,null);
    }

    /*保存打印模板设置*/
    function SavePrintSetting() {
        var HiddenUnit=$("#HiddenMoreUnit").val();
        var strBaseFields = "";
        var strDetailFields = "";
        var toLocation='StorageCheckPrint.aspx?ID=' + intMrpID+'&No='+StrNo_;
        var hidBillTypeFlag = document.getElementById('hidBillTypeFlag').value;
        var hidPrintTypeFlag = document.getElementById('hidPrintTypeFlag').value;

        if (document.getElementById('ckOutNo').checked) strBaseFields = strBaseFields + "CheckNo|";
        if (document.getElementById('ckTitle').checked) strBaseFields = strBaseFields + "Title|";
        if (document.getElementById('ckFromBillID').checked) strBaseFields = strBaseFields + "StorageName|";
        if (document.getElementById('ckCustName').checked) strBaseFields = strBaseFields + "CheckTypeName|";
        if (document.getElementById('ckSellDept').checked) strBaseFields = strBaseFields + "DeptName|";
        if (document.getElementById('ckSeller').checked) strBaseFields = strBaseFields + "CheckStartDate|";
        if (document.getElementById('ckSendAddress').checked) strBaseFields = strBaseFields + "CheckEndDate|";
        if (document.getElementById('ckArrAddress').checked) strBaseFields = strBaseFields + "CheckUserName|";
        if (document.getElementById('ckUserSender').checked) strBaseFields = strBaseFields + "TransactorName|";
        if (document.getElementById('ckOutDate').checked) strBaseFields = strBaseFields + "CheckDate|";
        if (document.getElementById('ckTotalCount').checked) strBaseFields = strBaseFields + "NowCount|";
        if (document.getElementById('ckTotalPrice').checked) strBaseFields = strBaseFields + "CheckCount|";
        
        if (document.getElementById('ckDiffCount').checked) strBaseFields = strBaseFields + "DiffCount|";
        if (document.getElementById('ckNowMoney').checked) strBaseFields = strBaseFields + "NowMoney|";
        if (document.getElementById('ckCheckMoney').checked) strBaseFields = strBaseFields + "CheckMoney|";
        if (document.getElementById('ckDiffMoney').checked) strBaseFields = strBaseFields + "DiffMoney|";
        
        if (document.getElementById('ckCreatorReal').checked) strBaseFields = strBaseFields + "CreatorName|";
        if (document.getElementById('ckCreateDate').checked) strBaseFields = strBaseFields + "CreateDate|";
        if (document.getElementById('ckConfirmorReal').checked) strBaseFields = strBaseFields + "ConfirmorName|";
        if (document.getElementById('ckConfirmDate').checked) strBaseFields = strBaseFields + "ConfirmDate|";
        if (document.getElementById('ckCloserReal').checked) strBaseFields = strBaseFields + "CloserName|";
        if (document.getElementById('ckCloseDate').checked) strBaseFields = strBaseFields + "CloseDate|";
        if (document.getElementById('ckModifiedUserID').checked) strBaseFields = strBaseFields + "ModifiedUserID|";
        if (document.getElementById('ckModifiedDate').checked) strBaseFields = strBaseFields + "ModifiedDate|";
        if (document.getElementById('ckStrBillStatusText').checked) strBaseFields = strBaseFields + "BillStatusName|";
        if (document.getElementById('ckRemark').checked) strBaseFields = strBaseFields + "Remark|";
        if (document.getElementById('ckSummary').checked) strBaseFields = strBaseFields + "Summary|";
                               
        for(var i=0;i<10;i++)
        {
            if(document.getElementById('ckExtField'+(i+1)).style.display=='block'||document.getElementById('ckExtField'+(i+1)).style.display=='')
            {
                if (document.getElementById('ckExtField'+(i+1)).checked) strBaseFields = strBaseFields + "ExtField"+(i+1)+"|";
            }
        }



        if (document.getElementById('ckdBatchNo').checked) strDetailFields = strDetailFields + "BatchNo|";

        if(HiddenUnit=="True")
        {
            if (document.getElementById('ckdBaseUnit').checked) strDetailFields = strDetailFields + "UnitName|";
            if (document.getElementById('ckdBaseCount').checked) strDetailFields = strDetailFields + "CheckCount|";
            if (document.getElementById('ckdUnitName').checked) strDetailFields = strDetailFields + "UsedUnitName|";
            if (document.getElementById('ckdNotOutCount').checked) strDetailFields = strDetailFields + "UsedUnitCount|";
            if (document.getElementById('ckdOutPrice').checked) strDetailFields = strDetailFields + "UsedPrice|";
        }
        else
        {
           // if (document.getElementById('ckdBaseUnit').checked) strDetailFields = strDetailFields + "BaseUnit|";
           // if (document.getElementById('ckdBaseCount').checked) strDetailFields = strDetailFields + "BaseCount|";
            if (document.getElementById('ckdUnitName').checked) strDetailFields = strDetailFields + "UnitName|";
            if (document.getElementById('ckdNotOutCount').checked) strDetailFields = strDetailFields + "CheckCount|";
            if (document.getElementById('ckdOutPrice').checked) strDetailFields = strDetailFields + "StandardCost|";
        }


        if (document.getElementById('ckdSortNo').checked) strDetailFields = strDetailFields + "SortNo|";
        if (document.getElementById('ckdProdNo').checked) strDetailFields = strDetailFields + "ProdNo|";
        if (document.getElementById('ckdProductName').checked) strDetailFields = strDetailFields + "ProductName|";
        if (document.getElementById('ckdType').checked) strDetailFields = strDetailFields + "Specification|";
       // if (document.getElementById('ckdUnitName').checked) strDetailFields = strDetailFields + "UnitName|";
        //if (document.getElementById('ckdOutPrice').checked) strDetailFields = strDetailFields + "StandardCost|";
        if (document.getElementById('ckdNoteCount').checked) strDetailFields = strDetailFields + "NowCount|";
        //if (document.getElementById('ckdNotOutCount').checked) strDetailFields = strDetailFields + "CheckCount|";
        if (document.getElementById('ckdOutCount').checked) strDetailFields = strDetailFields + "DiffTypeName|";
        if (document.getElementById('ckdOutMoney').checked) strDetailFields = strDetailFields + "DiffCount|";
        if (document.getElementById('ckdRemark').checked) strDetailFields = strDetailFields + "Remark|";
        /*保存打印参数设置*/
        SaveCommonPrintParameterSet(strBaseFields,strDetailFields,null,hidBillTypeFlag,hidPrintTypeFlag,toLocation);
    }
</script>

