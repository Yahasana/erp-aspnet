﻿<%@ WebHandler Language="C#" Class="StorageProductAdd" %>

using System;
using System.Web;
using XBase.Common;
using XBase.Model.Office.StorageManager;
using XBase.Business.Office.StorageManager;

public class StorageProductAdd : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{



    public void ProcessRequest(HttpContext context)
    {
        string companyCD = ((UserInfoUtil)SessionUtil.Session["UserInfo"]).CompanyCD;//[待修改]
        //private string companyCD = "AAAAAA";
        string ID = context.Request.QueryString["ID"].ToString();
        JsonClass jc;
        if (int.Parse(ID) > 0)
        {
            #region 修改物品
            StorageProductModel Model = new StorageProductModel();
            Model.CompanyCD = companyCD;
            Model.ID = ID;
            Model.ProductID = context.Request.QueryString["txtProductID"].ToString();
            Model.StorageID = context.Request.QueryString["txtStorageID"].ToString();
            //Model.CostPrice = decimal.Parse(context.Request.QueryString["txtCostPrice"].ToString());
            Model.ProductCount = context.Request.QueryString["ProductCount"].ToString();
            //Model.LockCount = decimal.Parse(context.Request.QueryString["txtLockCount"].ToString());
            Model.Remark = context.Request.QueryString["Remark"].ToString();
            if (StorageProductBus.UpdateStorageProduct(Model))
            {
                jc = new JsonClass("修改成功", "", 1);
            }
            else
            {
                jc = new JsonClass("修改失败", "", 0);
            }
            #endregion
        }
        else
        {
            #region 添加物品
            StorageProductModel Model = new StorageProductModel();
            Model.CompanyCD = companyCD;
            Model.ID = ID;
            Model.ProductID = context.Request.QueryString["ProductID"].ToString();
            Model.StorageID = context.Request.QueryString["StorageID"].ToString();
            //Model.CostPrice = context.Request.QueryString["CostPrice"].ToString();
            Model.ProductCount = context.Request.QueryString["ProductCount"].ToString();
            //Model.LockCount = context.Request.QueryString["LockCount"].ToString();
            Model.Remark = context.Request.QueryString["Remark"].ToString();

            if (StorageProductBus.InsertStorageProduct(Model))
            {
                jc = new JsonClass("添加成功", "", int.Parse(Model.ID));
            }
            else
            {
                jc = new JsonClass("添加失败", "", 0);
            }
            #endregion
        }
        context.Response.Write(jc);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}