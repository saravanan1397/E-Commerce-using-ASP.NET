using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Online_Shop1.BusinessLayer; 

namespace Online_Shop1
{
    public partial class wCustomerOrder : System.Web.UI.Page
    {
        public bool CanIUpdateStatus;

        public string TransactionNoText
       {
          get{return txtTransactionNo.Text;}
          set{txtTransactionNo.Text = value; } 
           
       }

        public bool IsAuthorisedToAddStatus
        {
            set { CanIUpdateStatus = value; } 
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (txtTransactionNo.Text != string.Empty)
                {
                    ShowOrderDetails(rblOrderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text));
                }
                else
                {
                    rblOrderDetails.Visible = false;
                    Panel1.Visible = false;
                    Panel2.Visible = false;
                    Panel3.Visible = false;
                    Panel4.Visible = false;
                }
            }
        }
        private void ShowOrderDetails(string PanelID , int OrderNo)
        {
            rblOrderDetails.Visible = false;
            Panel1.Visible = false;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;

            if (IsOrdernovalid(OrderNo))
            {
                rblOrderDetails.Visible = true;
                if (PanelID == "1")
                {
                    ShoppingCart k = new ShoppingCart()
                    {
                        Flag = OrderNo
                    };
                    DataTable dtCustomerDetails = k.GetOrderList();
                    if (dtCustomerDetails.Rows.Count > 0)
                    {
                        Panel1.Visible = true;
                        lblCustomerName.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerName"]);
                        lblCustomerPhoneNo.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerPhoneNo"]);
                        lblCustomerEmailId.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerEmilId"]);
                        lblTotalPrice.Text = Convert.ToString(dtCustomerDetails.Rows[0]["TotalPrice"]);
                        lblTotalProducts.Text = Convert.ToString(dtCustomerDetails.Rows[0]["TotalProducts"]);
                        txtCustomerAddress.Text = Convert.ToString(dtCustomerDetails.Rows[0]["CustomerAddress"]);
                        lblPaymentMethod.Text = Convert.ToString(dtCustomerDetails.Rows[0]["PaymentMethod"]);
                    }
                }
                if (PanelID == "2")
                {
                    Panel2.Visible = true;
                    ShoppingCart k = new ShoppingCart()
                    {
                        Flag = OrderNo
                    };
                    dlProducts.DataSource = k.GetTransactionDetails();
                    dlProducts.DataBind();
                }
                if (PanelID == "3")
                {
                    Panel3.Visible = true;
                    txtStatus.Visible = CanIUpdateStatus;
                    btnAdd.Visible = CanIUpdateStatus;
                   GetSetOrderStatus(0);
                }
            }
            else
            {
                Panel4.Visible = true; 
            }
            
        }

        private bool IsOrdernovalid(int OrderNo)
        {
            ShoppingCart k = new ShoppingCart()
            {
                Flag = OrderNo
            };
            DataTable dtCustomerDetails = k.GetOrderList();

            if (dtCustomerDetails.Rows.Count > 0)
                return true;
            else
                return false;
        }

        protected void btnGo_Click(object sender, EventArgs e)
        {
            if (txtTransactionNo.Text != string.Empty)
            {
                rblOrderDetails.Visible = true;
                ShowOrderDetails(rblOrderDetails.SelectedValue, Convert.ToInt32(txtTransactionNo.Text)); 
            }
            else
            {
                rblOrderDetails.Visible = false; 
                Panel1.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = false; 
 
            }
        }

        protected void rblOrderDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (txtTransactionNo.Text != string.Empty)
            {
               ShowOrderDetails(rblOrderDetails.SelectedValue,Convert.ToInt32 (txtTransactionNo.Text.Trim()));   
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            GetSetOrderStatus(1); 
        }
        private void GetSetOrderStatus(int flag)
        {
            ShoppingCart k = new ShoppingCart()
            {
                OrderStatus = txtStatus.Text ,
                OrderNo = txtTransactionNo.Text , 
                Flag = flag 
            };
            DataTable dt = k.GetSetOrderStatus();
            gvOrderStatus.DataSource = dt;
            gvOrderStatus.DataBind();
            txtStatus.Text = string.Empty;  
            
        }
    }
}