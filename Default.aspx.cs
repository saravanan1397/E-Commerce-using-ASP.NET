using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Online_Shop1.BusinessLayer;
using System.Web.Configuration; 
using System.IO ; 

namespace Online_Shop1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblCategoryName.Text = "Shopping Products at e-Shop";
                GetCategory();
                GetProducts(0);
            }
            lblAvailableStockAlert.Text = string.Empty; 
        }
        private void GetCategory()
        {
            ShoppingCart k = new ShoppingCart();
            dlCategories.DataSource = null;
            dlCategories.DataSource = k.GetCategories();
            dlCategories.DataBind();  
        }
        private void GetProducts(int CategoryID)
        {
            ShoppingCart k = new ShoppingCart()
            {
                CategoryID = CategoryID 
            };
            dlProducts.DataSource = null;
            dlProducts.DataSource = k.GetAllProducts(); 
            dlProducts.DataBind();  
        }
       

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            string ProductId = Convert.ToInt16((((Button)sender).CommandArgument )).ToString() ;
            string ProductQuanity = "1";

            DataListItem currentItem = (sender as Button ).NamingContainer as DataListItem ;
            Label lblAvailablleStock = currentItem.FindControl("lblAvailableStock") as Label;
            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                var checkProduct = dt.AsEnumerable().Where(r => r.Field<string>("ProductID") == ProductId);
                if (checkProduct.Count() == 0)
                {
                    string query = "select * from product where ProductID = " + ProductId +"";
                    DataTable dtProducts = GetData(query);
                    DataRow dr = dt.NewRow();
                    dr["ProductID"] = ProductId;
                    dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                    dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                    dr["Image"] = Convert.ToString(dtProducts.Rows[0]["Image"]);
                    dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);                  
                    dr["ProductQuantity"] = ProductQuanity;
                    dr["AvailableStock"] = lblAvailablleStock.Text;
                    dt.Rows.Add(dr);
                    Session["MyCart"] = dt;
                    btnOnline.Text = dt.Rows.Count.ToString();
                }                           
            }
            else
            {

                string query = "select * from product where ProductID = " + ProductId + "";
                DataTable dtProducts = GetData(query);
                DataTable dt = new DataTable();

                dt.Columns.Add("ProductID",typeof(string) );
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("Image", typeof(string));
                dt.Columns.Add("Description", typeof(string));             
                dt.Columns.Add("ProductQuantity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));  

                DataRow dr = dt.NewRow();
                dr["ProductID"] = ProductId;
                dr["Name"] = Convert.ToString(dtProducts.Rows[0]["Name"]);
                dr["Price"] = Convert.ToString(dtProducts.Rows[0]["Price"]);
                dr["Image"] = Convert.ToString(dtProducts.Rows[0]["Image"]);
                dr["Description"] = Convert.ToString(dtProducts.Rows[0]["Description"]);                            
                dr["ProductQuantity"] = ProductQuanity;
                dr["AvailableStock"] = lblAvailablleStock.Text;
                dt.Rows.Add(dr);
                Session["MyCart"] = dt;
                btnOnline.Text = dt.Rows.Count.ToString();
            }
           // HighlightCartProducts();
        }
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string productids = string.Empty;
            DataTable dt;
            if (Session["MyCart"] != null)
            {
                dt = (DataTable)Session["MyCart"];
                ShoppingCart k = new ShoppingCart()
                {
                    CustomerName = txtCustomerName.Text,
                    CustomerEmailID = txtCustomerEmailID.Text,
                    CustomerAddress = txtCustomerAddress.Text,
                    CustomerPhoneNo = txtCustomerPhoneNo.Text,
                    TotalProducts = Convert.ToInt32(txtTotalProducts.Text),
                    TotalPrice = Convert.ToInt32(txtTotalPrice.Text),
                    ProductList = productids ,
                    PaymentMethod = rblPaymentMethod.SelectedItem.Text                  
                };
                DataTable dtResult = k.SaveCustomerDetails();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ShoppingCart SaveProducts = new ShoppingCart()
                    {
                        CustomerID = Convert.ToInt32(dtResult.Rows[0][0]),
                        ProductID = Convert.ToInt32(dt.Rows[i]["ProductID"]),  
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"])  
                    };
                    SaveProducts.SaveCustomerProducts(); 
                }
                Session.Clear();
                GetMyCart();

              // lblTransactionNo.Text = "Your Transaction No : " + dtResult.Rows[0][0];
                
                pnlOrderPlacedSuccessfully.Visible = true;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false ;
               pnlEmptyCart.Visible = false;
               pnlEmptyCart.Visible = false;
             

               // SendOrderPlacedAlert(txtCustomerName.Text ,txtCustomerEmailID.Text,Convert.ToString(dtResult.Rows[0][0]));

                txtCustomerAddress.Text = string.Empty;
                txtCustomerEmailID.Text = string.Empty;
                txtCustomerName.Text = string.Empty;
                txtCustomerPhoneNo.Text = string.Empty;
                txtTotalPrice.Text = "0";
                txtTotalProducts.Text = "0";
            }
        }

        protected void btnRemoveFromCart_Click(object sender , EventArgs e)
        {
            string ProductID = Convert.ToInt32((((Button)sender).CommandArgument)).ToString() ;
            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];
                DataRow drr = dt.Select("ProductID=" + ProductID + " ").FirstOrDefault() ;

                if (drr != null)
                    dt.Rows.Remove(drr);

                Session["MyCart"] = dt; 
            }
            GetMyCart(); 
        }
        protected void txtProductQuantity_TextChanged(object sender, EventArgs e)
        {
            TextBox txtQuantity = (sender as TextBox);
            DataListItem currentItem = (sender as TextBox).NamingContainer as DataListItem;
            HiddenField ProductID = currentItem.FindControl("lblProductID") as HiddenField;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if (txtQuantity.Text == string.Empty || txtQuantity.Text == "0" || txtQuantity.Text == "1")
            {
                txtQuantity.Text = "1";
            }
            else
            {
                if (Session["MyCart"] != null)
                {
                    if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblAvailableStock.Text))
                    {
                        DataTable dt = (DataTable)Session["MyCart"];
                        DataRow[] row = dt.Select("ProductID = '" + ProductID.Value + "'");

                        int index = dt.Rows.IndexOf(row[0]);
                        dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;
                        Session["MyCart"] = dt;

                    }
                    else
                    {
                        lblAvailableStockAlert.Text = "Alert : Product buyout should not be more than AvailableStock !!";
                        txtQuantity.Text = "1"; 
                    }
                }
            }
            UpdateTotalBill(); 
            
        }
        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
           pnlMyCart.Visible = false;
            pnlProducts.Visible = true ; 
            int CategoryID = Convert.ToInt16((((LinkButton)sender).CommandArgument))  ;
            GetProducts(CategoryID); 
           // HighlightCartProducts();
        }

       protected void btnOnline_Click(object sender, EventArgs e)
       {
            GetMyCart();
            lblCategoryName.Text = "Products is your shopping cart";
            lblProducts.Text = "Check Out Forms";
         //   pnlMyCart.Visible = true;
           // pnlCheckOut.Visible = true;
            //pnlCategories.Visible = false;
            //pnlProducts.Visible = false; 
        }
       public DataTable GetData(string query)
      {
          DataTable dt = new DataTable();
          string conn = ConfigurationManager.ConnectionStrings["Myshop"].ConnectionString;
          SqlConnection con = new SqlConnection(conn);
          con.Open();  
          SqlDataAdapter da = new SqlDataAdapter(query, con);
          da.Fill(dt);
          con.Close(); 
          return dt;
      }
        private void GetMyCart()
        {
            DataTable dtProducts;
            if (Session["MyCart"] != null)
            {
                dtProducts = (DataTable)Session["MyCart"];

            }

            else
            {
                dtProducts = new DataTable(); 
            }
            if (dtProducts.Rows.Count > 0)
            {
                txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
                btnOnline.Text = dtProducts.Rows.Count.ToString();
                dlCartProducts.DataSource = dtProducts;
                dlCartProducts.DataBind();
                UpdateTotalBill();

                pnlCategories.Visible = false ;
                pnlProducts.Visible = false ;
                pnlMyCart.Visible = true ;
                pnlCheckOut.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false  ;

               
            }
            else
            {
                txtTotalProducts.Text = "0";
                btnOnline.Text = "0";
                txtTotalPrice.Text = "0";    


               pnlEmptyCart.Visible = true;
                pnlCategories.Visible = false ;
                pnlProducts.Visible = false ;
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false;
               
               
                pnlOrderPlacedSuccessfully.Visible = false; 

         
                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();

            }
        }
        private void UpdateTotalBill()
        {
            long TotalPrice = 0;
            long TotalProducts = 0;

            foreach (DataListItem item in dlCartProducts.Items)
            {
                Label PriceLabel = item.FindControl("lblPrice") as Label;
                TextBox ProductQuantity = item.FindControl("txtProductQuantity") as TextBox;
                long ProductPrice = Convert.ToInt64(PriceLabel.Text) * Convert.ToInt64(ProductQuantity.Text);
                TotalPrice = TotalPrice + ProductPrice;
                TotalProducts = TotalProducts + Convert.ToInt32(ProductQuantity.Text);  
            }
            txtTotalPrice.Text = Convert.ToString(TotalPrice );
            txtTotalProducts.Text = Convert.ToString(TotalProducts);
    
        }

        protected void dlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

     /*   protected void lblLogo_Click(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Products is your shopping cart";
            lblProducts.Text = "Products";

            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false ;
            pnlCheckOut.Visible = false ;

           pnlEmptyCart.Visible = false;
            pnlOrderPlacedSuccessfully.Visible = false;

            GetProducts(0);
           // HighlightCartProducts();
            

        } */
     /*   private string PopulateOrderEmailBody(string customerName,string transactionNo)
        {
            string body= string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OrderTemplate.htm")))
            {
                body = reader.ReadToEnd(); 
            }
            body = body.Replace("(CustomerName)", customerName);
            body = body.Replace("(OrderNo)",transactionNo);
            body = body.Replace("(TransactionURL)", "http://www.google.com" + transactionNo); 
            return body ;
        }
        private void SendOrderPlacedAlert(string CustomerName,string CustomerEmailID,string Transactions)
        {
            string body = this.PopulateOrderEmailBody(CustomerName,Transactions );
            EmailEngine.SendEmail(CustomerEmailID, "e-Shop....Your OrderDetails", body); 
        }*/

        protected void lblLogo_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Login.aspx");
        }
        /*private void HighlightCartProducts()
        {
            if (Session["MyCart"] != null)
            {
                DataTable dtProductsAddedToCart = (DataTable)Session["MyCart"];
                if (dtProductsAddedToCart.Rows.Count > 0)
                {
                    foreach(DataListItem item in dlProducts.Items  )
                    {
                        HiddenField hfProductID = item.FindControl("hfProductID") as HiddenField;
                        if (dtProductsAddedToCart.AsEnumerable().Any(row => hfProductID.Value == row.Field<String>("ProductID")))
                        {
                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button;
                            btnAddToCart.BackColor = System.Drawing.Color.Green;
                            btnAddToCart.Text = "Added To Cart"; 
                            
                        }
                    }
                }
            }
        }*/

        protected void lblLogo_Click2(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
           // HighlightCartProducts();
        } 
    }
}