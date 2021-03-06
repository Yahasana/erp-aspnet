﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RectCheckElem_Info.aspx.cs" Inherits="Pages_Office_HumanManager_RectCheckElem_Info" %>
<%@ Register src="../../../UserControl/Message.ascx" tagname="Message" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>面试评测要素设置</title>
    <link rel="stylesheet" type="text/css" href="../../../css/default.css" />
    <link href="../../../css/pagecss.css" type="text/css" rel="Stylesheet" />
    <script src="../../../js/JQuery/jquery_last.js" type="text/javascript"></script>
    <script src="../../../js/common/PageBar-1.1.1.js" type="text/javascript"></script>
    <script src="../../../js/common/Page.js" type="text/javascript"></script>
    <script src="../../../js/office/HumanManager/RectCheckElem_Info.js" type="text/javascript"></script>
    <script src="../../../js/common/check.js" type="text/javascript"></script>
    <script src="../../../js/common/Common.js" type="text/javascript"></script>
</head>
<body>
<form id="frmMain" runat="server">
    <table width="98%"border="0" cellpadding="0" cellspacing="0" class="checktable" id="mainindex">
        <tr>
            <td valign="top">
                <img src="../../../images/Main/Line.jpg" width="122" height="7" />
            </td>
        </tr>
        <tr>
            <td  valign="top" class="Blue">
                <img src="../../../images/Main/Arrow.jpg" width="21" height="18" align="absmiddle" />检索条件
            </td>
            <td align="right" valign="top">
                <div id='divSearch'>
                    <img src="../../../images/Main/Close.jpg" style="CURSOR: pointer"  onclick="oprItem('tblSearch','divSearch')"/>
                </div>&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2"  >
                <table width="99%" border="0" align="center" cellpadding="0" id="tblSearch"  cellspacing="0" bgcolor="#CCCCCC">
                    <tr>
                        <td bgcolor="#FFFFFF">
                            <table width="100%" border="0"  cellpadding="2" cellspacing="1" bgcolor="#CCCCCC">
                                <tr>
                                    <td height="20" class="tdColTitle" width="10%">要素名称</td>
                                    <td class="tdColInput" width="23%">
                                        <input name="txtTestNo" id="txtSearchElemName" runat="server" maxlength="50" type="text" class="tdinput" width="85%"   specialworkcheck="要素名称"/>
                                    </td>
                                    <td class="tdColTitle" width="10%">启用状态</td>
                                    <td class="tdColInput" width="23%">
                                        <select id="sltSearchUsedStatus" runat="server">
                                            <option value="">--请选择--</option>
                                            <option value="0">停用</option>
                                            <option value="1">启用</option>
                                        </select>
                                    </td>
                                    <td height="20" class="tdColTitle" width="10%"></td>
                                    <td class="tdColInput" width="24%">
                                    </td>
                                </tr>     
                                <tr>
                                    <td colspan="6" align="center" bgcolor="#FFFFFF">  
                                        <input type="hidden" id="hidSearchCondition" runat="server" />
                                        <uc1:Message ID="Message1" runat="server" />
                                        <img alt="检索" src="../../../images/Button/Bottom_btn_search.jpg" id="btnSearch" visible="false" runat="server" style='cursor:pointer;' onclick='DoSearchInfo()'   />
                                        <%--<img alt="重置" src="../../../images/Button/Bottom_btn_re.jpg" id="btnReset" runat="server" visible="false" style='cursor:pointer;' onclick="ClearInput()" width="52" height="23" />--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                 </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" height="5"></td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tblDetailList" >
                    <tr>
                        <td valign="top">
                            <img src="../../../images/Main/Line.jpg" width="122" height="7" />
                        </td>
                        <td align="center" valign="top"></td>
                    </tr>
                    <tr><td colspan="2" height="2"></td></tr>
                    <tr>
                        <td height="30" colspan="2" align="center" valign="top" class="Title">面试评测要素设置</td>
                    </tr>
                    <tr>
                        <td height="35" colspan="2" valign="top">
                            <table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#999999">
                                <tr>
                                    <td height="28" bgcolor="#FFFFFF">
                                        <img src="../../../Images/Button/Bottom_btn_new.jpg" alt="新建" visible="false" id="btnNew" runat="server" style="cursor:hand"  onclick="DoNew();"/>
                                        <img src="../../../images/Button/Main_btn_delete.jpg" alt="删除" visible="false" id="btnDelete" runat="server" onclick="DoDelete()" style='cursor:pointer;'     />
                                            <asp:ImageButton ID="btnImport" ImageUrl="../../../images/Button/Main_btn_out.jpg" AlternateText="导出Excel" runat="server" onclick="btnImport_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <!-- <div style="height:252px;overflow-y:scroll;"> -->
                            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" id="tblDetailInfo" bgcolor="#999999">
                                <tbody>
                                    <tr>
                                        <th height="20" align="center" background="../../../images/Main/Table_bg.jpg" bgcolor="#FFFFFF">选择<input type="checkbox" id="chkCheckAll" name="chkCheckAll" onclick="AllSelect('chkCheckAll', 'chkSelect')"></th>
                                        <th align="center" background="../../../images/Main/Table_bg.jpg" bgcolor="#FFFFFF">
                                            <div class="orderClick" onclick="OrderBy('ElemName','oC0');return false;">
                                                要素名称<span id="oC0" class="orderTip"></span>
                                            </div>
                                        </th>
                                        <th align="center" background="../../../images/Main/Table_bg.jpg" bgcolor="#FFFFFF">
                                            <div class="orderClick" onclick="OrderBy('UsedStatusName','oC1');return false;">
                                                启用状态<span id="oC1" class="orderTip"></span>
                                            </div>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- </div> -->
                            <br/>
                            <table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" class="PageList">
                                <tr>
                                    <td height="28"  background="../../../images/Main/PageList_bg.jpg" >
                                        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="PageList">
                                            <tr>
                                                <td height="28"  background="../../../images/Main/PageList_bg.jpg" width="40%"  >
                                                    <div id="pagecount"></div>
                                                </td>
                                                <td height="28"  align="right">
                                                    <div id="divPageClickInfo" class="jPagerBar"></div>
                                                </td>
                                                <td height="28" align="right">
                                                    <div id="divPage">
                                                        每页显示<input name="txtShowPageCount" type="text" id="txtShowPageCount" size="3"   maxlength="6"/>条&nbsp;&nbsp;
                                                        转到第<input name="txtToPage" type="text" id="txtToPage" size="3"/>页&nbsp;&nbsp;
                                                        <img src="../../../images/Button/Main_btn_GO.jpg" style='cursor:pointer;' alt="go" width="36" height="28" align="absmiddle" onclick="ChangePageCountIndex($('#txtShowPageCount').val(),$('#txtToPage').val());" />
                                                    </div>
                                                 </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <br/>
                        </td>
                    </tr>
                </table>            
            </td>
        </tr>
    </table>
    
    <div id="divEditCheckItem" runat="server" style="background: #fff; padding: 10px; width: 800px; z-index:1; position: absolute;top: 20%; left: 15%;display:none;  ">    
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="maintable" id="tblDepttemInfo">
            <tr>
                <td valign="top" colspan="2">
                    <img src="../../../images/Main/Line.jpg" width="122" height="7" />
                </td>
            </tr>
            <tr>
                <td height="40" valign="top" colspan="2">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
                        <tr><td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
                            <tr>
                                <td height="30" class="tdColInput">
                                    <img src="../../../Images/Button/Bottom_btn_save.jpg" runat="server" visible="false" alt="保存" id="btnSave" style="cursor:hand"  onclick="DoSaveInfo();"/>
                                    <img src="../../../Images/Button/Bottom_btn_back.jpg" alt="返回" visible="true" id="btnBack" runat="server" style="cursor:hand"   onclick="DoBack();"/>
                                </td>
                                <td height="30" class="tdColInput" align="right">
                                <%--    <img src="../../../Images/Button/Main_btn_print.jpg" alt="打印" visible="true" id="btnPrint" style="cursor:hand" height="25" />--%>
                                </td>
                            </tr>
                        </table></td></tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <!-- <div style="height:500px;overflow-y:scroll;"> -->
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tblmain" >
                        <tr>
                            <td  colspan="2">
                                <table>
                                    <tr>
                                        <td colspan="2" height="4">
                                            <input type="hidden" id="hidEditFlag" runat="server" />
                                            <input type="hidden" id="hidElemID" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#999999" id="tblBaseInfo" style="display:block">
                                    <tr>
                                        <td height="20" align="right" class="tdColTitle" width="15%">要素名称<span class="redbold">*</span></td>
                                        <td height="20" class="tdColInput" width="35%">
                                            <input type="text" id="txtEditElemName" maxlength="50" class="tdinput" />
                                        </td>
                                        <td height="20" align="right" class="tdColTitle" width="15%">启用状态<span class="redbold">*</span></td>
                                        <td height="20" class="tdColInput" width="35%">
                                            <select id="sltEditUsedStatus" class="tdinput">
                                                <option value="0">停用</option>
                                                <option value="1">启用</option>
                                            </select>
                                            <input type="hidden" id="hidBeforeUpdateUsedStatus" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20" align="right" class="tdColTitle">评分标准<span class="redbold">*</span></td>
                                        <td height="20" class="tdColInput" colspan="3">
                                       <%--     <textarea rows="5" id="txtStandard" class="tdinput" cols="80"></textarea>--%>
                                        <input  type="text"  style ="width:95%" id="txtStandard" maxlength="50" class="tdinput" /> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="20" align="right" class="tdColTitle">备注</td>
                                        <td height="20" class="tdColInput" colspan="3">
                                            <textarea rows="5" id="txtRemark" class="tdinput"  cols="80"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr><td colspan="2" height="10"></td></tr>
                    </table>
                <!-- </div> -->
                </td>
            </tr>
        </table>    
    </div>
    
    
<div id="popupContent"></div>
<span id="Forms" class="Spantype"></span>
<uc1:Message ID="msgError" runat="server" />
</form>
</body>
</html>
