<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Default.aspx.cs" Inherits="Online_Shop1.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type = "text/css">
        .style1
        {
            width : 900px;
        }
        .style2
        {
            width:550px;
            text-align:center ;
        } 
        .style3
        {
            width : 350px;
              text-align:center ;
        }
        .style6
        {
            width: 200px;
            
        }
        .style7
        {
            width: 800px;
            text-align:center ;
        }
        .style9
        {
            width: 780px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table align ="center" style = " width : 900px;" >
      <tr>
      <td>
     
      <td>
     
      <table  align ="center" style="border: medium ridge #9933FF" width="900px" 
              bgcolor="#6699FF">
      <tr> 
      <td align ="center" >
      <asp:Image ID="Image1" runat="server" ImageUrl="~/e-shop1.png" 
              Height="67px" Width="162px" />
              &nbsp;
      </td>     
      <td style="color: #FFFFFF" align="center" class="style9">
          <asp:LinkButton ID="lblLogo" runat="server" Text = "e-shop" 
              Font-Names = "Eras Demi ITC" ForeColor="White" Font-Size="20pt" 
              onclick="lblLogo_Click2"></asp:LinkButton>
              <hr />
              Only for Shopping Lovers...!!
              </td>
            <td>
         <asp:Image ID="Image2" runat="server" Height = "67px"  
              ImageUrl="~/Images/ShoppingCart.png" Width = "87px" ImageAlign="Middle"    />
      </td>
      <td align="left">
          <asp:LinkButton ID="btnOnline" runat="server" OnClick = "btnOnline_Click">0</asp:LinkButton></td>
      </tr> 
     
      </table>
      
      <table align ="center" style="border: thin ridge #9900FF; ">
      <tr >
      <td  style="border: medium solid #9900CC; " class="style2" bgcolor="#99CCFF">
     
         <asp:Label ID="lblCategoryName" runat="server" Text="Label" Font-Size="15pt" 
              ForeColor="White"></asp:Label>
          
      </td>
      <td style="border: medium solid #9900CC;  " class="style3" bgcolor="#99CCFF"  >
     
          <asp:Label ID="lblProducts" runat="server" Text="Products" Font-Size="15pt" 
              ForeColor="White"></asp:Label>
      </td>

      </tr> 

      <tr class="style1">
      <td class="style7">
      <table align="center">

       <tr>
      <td colspan="3" style="border: medium solid #9900CC;" >
      <asp:Panel ID="pnlEmptyCart" runat="server" Visible="False" >
      <div >
      <br />
      <br />
      <br />
      <br />
      <br />
          <asp:Image ID="Image3" runat="server" 
              Width="500px" ImageUrl="~/Images/EMPTY  CART.png" />
      <br />
      <br />
      <br />
      <br />
      <br />
      </div>
          </asp:Panel>
      </td> 
      </tr>
          
      </table>
      </td> 
      </tr>

        <tr>
      <td colspan="3">
      <asp:Panel ID="pnlOrderPlacedSuccessfully" runat="server" Visible="False">
      <div style="text-align:center ;" >
      <br />
      <br />
      <br />
      <br />
      <br />
          <asp:Image ID="Image4" runat="server" ImageUrl ="~/Images/Order_Placed.png" 
              Width="500px" />
      <br />
      
      <br />
      <br />
      <br />
      <br />
      </div>
          </asp:Panel>
      </td> 
      </tr>
          
      </table>
      </td> 
      </tr>
  
  
    <table align="center" class = "style1" style="border: medium ridge #9933FF" >
    <tr>
    <td class="style2" valign="top">
        <asp:Panel ID="pnlProducts" runat="server"  Height="500px" 
            ScrollBars="Auto"  BorderColor="#9900CC" BorderStyle="Inset" >
          
            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="237px" 
                Font-Bold="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                BorderWidth="1px" CellPadding="3" ForeColor="#333333" 
                GridLines="Horizontal"  DataMember="DefaultView" 
                Height="235px" >
           
                 <ItemTemplate>
                     <table class="style6" style="border-color: #9900CC; border-style: solid;">
                         <tr>
                             <td>
                                 <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' 
                                     Style="font-weight:700 " BorderColor="#9900CC" BorderStyle="None" ></asp:Label>            
                             </td>
                         </tr>
                         <tr>
                             <td>
                             <img alt ="" src = '<%# Eval("Image") %>' runat="server" id="imgProductPhoto" style = " width :173px; height :160px;" />
                             </td>
                         </tr>
                         <tr>
                             <td>
                               &nbsp;
                              
                               Price <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'>
                               &nbsp;&nbsp;
                               </asp:Label><asp:Label ID="lblAvailableStock" runat="server" 
                                     Text='<%# Eval("AvailableStock") %>' ForeColor="Red" Font-Bold="True" 
                                     Visible="False"></asp:Label>

                               &nbsp;&nbsp;
                                 <asp:TextBox ID="txtProductQuantity" runat="server" Height="20px" Width="20px" MaxLength="1" 
                                 onTextChanged = "txtProductQuantity_TextChanged" AutoPostBack = "true" 
                                     Text='<%# Eval("ProductQuantity") %>' Visible="False"></asp:TextBox>
                                
                                 <asp:HiddenField ID="lblProductId" runat="server"  
                                     Value ='<%# Eval("ProductID")%>' Visible="False" />
                               </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" 
                                     CommandArgument='<%# Eval("ProductID")%>' Onclick = "btnAddToCart_Click" 
                                     Width="100%" BorderColor="#9900CC" BorderStyle="Inset" BorderWidth="1px" CausesValidation="False" /></td>
                         </tr>
                     </table>
                 </ItemTemplate>
           
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              <itemStyle width="32%"/>
            </asp:DataList>
      
        </asp:Panel>
        <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" 
         BorderColor="#9900CC" BorderStyle="Inset" Visible="False">
         <table align="center" cellspacing="1">
         <tr>
         <td align="center"  >
         <asp:Label ID="lblAvailableStockAlert" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>

             <asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" 
                 Font-Bold="False" Font-Overline="False" Font-Strikeout="False" 
                 Font-Underline="False" Font-Italic="False"
            Width="237px" Height="235px" >
            
                 <ItemTemplate>
                     <table class="style6" style="border: medium solid #9900CC;">
                         <tr>
                             <td>
                                 <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' 
                                     Style="font-weight:700 " BorderStyle="None" ></asp:Label>            
                             </td>
                         </tr>
                         <tr>
                             <td>
                             <img alt ="" src = '<%# Eval("Image") %>' runat="server" id="imgProductPhoto" style = " width :173px; height :160px;" />
                             </td>
                         </tr>
                         <tr>
                             <td>
                               &nbsp;
                             
                               Price <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                               &nbsp;&nbsp;
                                 <asp:TextBox ID="txtProductQuantity" runat="server" Height="10px" Width="10px" MaxLength="1" 
                                 onTextChanged = "txtProductQuantity_TextChanged" AutoPostBack = "true" Text='<%# Eval("ProductQuantity") %>'></asp:TextBox>
                                
                                 <asp:HiddenField ID="lblProductId" runat="server"  Value ='<%# Eval("ProductID")%>' />
                               </td>
                         </tr>
                         <tr>
                             <td>
                                 <asp:Button ID="btnRemoveFromCart" runat="server" Text="Remove From Cart" 
                                     CommandArgument='<%# Eval("ProductID")%>' Onclick = "btnRemoveFromCart_Click" 
                                     Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px" 
                                     CausesValidation="False" /></td>
                         </tr>
                     </table>
                 </ItemTemplate>
           
            <itemStyle width="32%"/>

             </asp:DataList>


         </td>
         </tr>
         <tr>
         <td align="center">
         &nbsp;
         </td>
         </tr>

          </tr>
         <tr>
         <td align="center">
         &nbsp;
         </td>
         </tr>
         </table>
            
        
    </td>
  </asp:Panel>
    <td>
        <asp:Panel ID="pnlCategories" runat="server"  Height="500px" 
            ScrollBars="Auto"  BorderColor="#9900CC" BorderStyle="Inset">     
            &nbsp;     
            <br />    &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" ForeColor="#6600CC" 
                Text="Categories"></asp:Label>
            <br /><hr />
             <asp:DataList ID="dlCategories" runat="server" RepeatColumns="1" Width="237px" 
                Font-Bold="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" 
                BorderWidth="1px" CellPadding="2" ForeColor="#333333" 
                GridLines="Horizontal"   DataMember="DefaultView" 
                onselectedindexchanged="dlProducts_SelectedIndexChanged" Height="235px" >
           
                 <ItemTemplate>
            
            &nbsp;&nbsp;&nbsp;<asp:LinkButton ID="lbtnCategory" runat="server" Text = '<%# Eval("CategoryName") %>' 
              Onclick = "lbtnCategory_Click" CommandArgument=  '<%# Eval("CategoryID") %>'> </asp:LinkButton><br />     
     </ItemTemplate>
     <SelectedItemStyle BackColor="#CCCCFF" Font-Bold="True" ForeColor="White" />
      </asp:DataList>
      </asp:Panel>
      </td>
      
      <td >
      
        <asp:Panel ID="pnlCheckOut" runat="server"  Height="500px" 
            ScrollBars="Auto"  BorderColor="#9900CC" BorderStyle="Inset" Visible="False">     
            &nbsp;     
            <br />  
                <table style ="width:350px " >
                <tr>
                <td align="left"  >
                Name:
                </td>
                </tr>
                <tr>
                <td>
                    <asp:TextBox ID="txtCustomerName" runat="server" Width="231px" MaxLength="10"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtCustomerName">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td align="left">
                Phone:
                </td>   
                </tr> 
                <tr >                     
                <td>
                <asp:TextBox ID="txtCustomerPhoneNo" runat="server" Width="231px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtCustomerPhoneNo">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:RequiredFieldValidator>
                </td>
                </tr>
                <tr>
                <td align="left">
                Email-ID
                </td>
                </tr>
                <tr>
                <td >
                <asp:TextBox ID="txtCustomerEmailID" runat="server" Width="231px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtCustomerEmailId">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:RequiredFieldValidator>
                </td>
                </tr>

                 <tr>
                <td align="left">
                Address
                </td>
                </tr>
                <tr>
                <td >
                <asp:TextBox ID="txtCustomerAddress" runat="server" Width="231px" TextMode="MultiLine"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtCustomerAddress">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:RequiredFieldValidator>
                </td>
                </tr>

                  <tr>
                <td align="left">
                Total Products:
                </td>
                </tr>
                <tr>
                <td >
                <asp:TextBox ID="txtTotalProducts" runat="server" Width="231px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtTotalProducts">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:RequiredFieldValidator>
                </td>
                </tr>
               
                  <tr>
                <td align="left">
                Total Price:
                </td>
                </tr>
                <tr>
                <td >
                <asp:TextBox ID="txtTotalPrice" runat="server" Width="231px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ControlToValidate="txtTotalPrice">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </asp:RequiredFieldValidator>
                </td>
                </tr>

                    <tr>
                <td align="left">
                Payment Mode:
                </td>
                </tr>
                <tr>
                <td align="center">
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server">
                    <asp:ListItem Value="1" Selected="True">1.Cash On Delivery</asp:ListItem>
                    <asp:ListItem Value="1">2.Payment Gateway</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                </tr>

              

                <tr>
                   
                <td >
                 <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick = "btnPlaceOrder_Click" style ="font-weight:700 " />
                </td>
                </tr>
                </table>
            
      </asp:Panel>
          
      </td> 
    </tr>
    <tr>
    <td  align="center" 
            style="border: medium ridge #9900FF; color: #FFFFFF;"
            bgcolor="#6699FF" colspan="3">
    &nbsp;&copy; <a href ="www.Google.com" style="color: #FFFFFF" >www.eShop.com</a> 
        <a href = "/Admin/Login.aspx" style="color: #FFFFFF">Admin Panel</a>
    </td> 
    </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
