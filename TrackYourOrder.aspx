<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrackYourOrder.aspx.cs" Inherits="Online_Shop1.TrackYourOrder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type ="text/css"  >
    .styleOrderDetails
    {
        width : 600px;
        border:1px ridge red; 
    }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >
    <div align="center">
        <asp:Label ID="lblTransactions" style = "font-weight : 700 " runat="server" Text="Transaction No :"></asp:Label>
        <asp:TextBox ID="txtTransactionNo"  runat="server" Width="50px"></asp:TextBox>
        <asp:Button ID="btnGo" style= "font-weight:700 " runat="server" Text="Go" 
            Width="30px" onclick="btnGo_Click" />
   &nbsp; </div>

   <table align="center" cellspacing="1" 
            style = "border: thin solid #9900CC; width :100%; background-color: #FFFFFF;" >
   <tr>
  <td align="center">
  <hr />
      <asp:RadioButtonList ID="rblOrderDetails" runat="server" 
          RepeatDirection="Horizontal" AutoPostBack="True" 
          onselectedindexchanged="rblOrderDetails_SelectedIndexChanged">
      <asp:ListItem Value="1" Selected="True">CustomerDetails</asp:ListItem>
      <asp:ListItem Value="2">ProductDetails</asp:ListItem>
      <asp:ListItem Value="3">DeliveryStatus</asp:ListItem>
      </asp:RadioButtonList>
      <hr />
  </td>
   </tr>
   <tr>
   <td align="center"  >
       <asp:Panel ID="Panel1" runat="server">
       <hr />

       <table class="styleOrderDetails" style="border: thin solid #9900CC">
   <tr>
   <td align="center" colspan="2">
       <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/User.png" />
       <hr />
   </td>
   </tr>

   <tr>
   <td align="right" style = "width:50% ; padding-right :30px;" >
   Name:
   </td>
   <td align="left" style = "width:50%;"  >
       <asp:Label ID="lblCustomerName" runat="server" ></asp:Label>
   </td>
   </tr>
   <tr>
   <td align="right" style = "width:50% ; padding-right :30px;" >
   EmailID:
   </td>
   <td align="left" style = "width:50%;"  >
       <asp:Label ID="lblCustomerEmailId" runat="server" ></asp:Label>
   </td>
   </tr>
   <tr>
   <td align="right" style = "width:50% ; padding-right :30px;" >
   PhoneNo:
   </td>
   <td align="left" style = "width:50%;"  >
       <asp:Label ID="lblCustomerPhoneNo" runat="server" ></asp:Label>
   </td>
   </tr>
   <tr>
   <td align="right" style = "width:50% ; padding-right :30px;" >
   TotalProducts:
   </td>
   <td align="left" style = "width:50%;"  >
       <asp:Label ID="lblTotalProducts" runat="server" ></asp:Label>
   </td>
   </tr>
   <tr>
   <td align="right" style = "width:50% ; padding-right :30px;" >
   TotalPrice:
   </td>
   <td align="left" style = "width:50%;"  >
       <asp:Label ID="lblTotalPrice" runat="server" ></asp:Label>
   </td>
   </tr>
   <tr>
   <td align="right" style = "width:50% ; padding-right :30px;" valign="top" >
   Address:
   </td>
   <td align="left" style = "width:50%;"  >
       <asp:TextBox ID="txtCustomerAddress" runat="server" TextMode="MultiLine" 
           Width="260px" Height="73px" ReadOnly="True"></asp:TextBox>
   </td>
   </tr>
   <tr>
   <td align="right" style = "width:50% ; padding-right :30px;" >
   PaymentMethod:
   </td>
   <td align="left" style = "width:50%;" valign="top"  >
       <asp:Label ID="lblPaymentMethod" runat="server" ></asp:Label>
   </td>
   </tr>

   <tr>
   <td align="center" width="50%">
   &nbsp;
   </td>
    <td align="left" width="50%" >
   &nbsp;
   </td>
   </tr>

   
   <tr>
   <td align="center" width="50%">
   &nbsp;
   </td>
    <td align="left" width="50%" >
   &nbsp;
   </td>
   </tr>
   
   <tr>
   <td align="center" width="50%">
   &nbsp;
   </td>
    <td align="left" width="50%" >
   &nbsp;
   </td>
   </tr>
  
       </asp:Panel>
         
       <asp:Panel ID="Panel2" runat="server">
       <table class="styleOrderDetails" style="border: thin solid #9900CC" >
       <tr>
       <td align="center">
           <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/OrderDetails.png" />
           <hr />
       </td>
       </tr>
       <tr>
       <td align="center">
       
          
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
                                     Style="font-weight:700 " BorderColor="#9900CC" BorderStyle="Ridge" ></asp:Label>            
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
                             
                               </td>
                         </tr>
                        <tr>
                             <td>
                               &nbsp;
                              
                               Quantity:<asp:Label ID="lblProductQuantity" runat="server" Text='<%# Eval("ProductQuantity") %>'></asp:Label> 
                               &nbsp;&nbsp;
                             
                               </td>
                         </tr>
                     </table>
                 </ItemTemplate>
           
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
              <itemStyle width="32%"/>
            </asp:DataList>
       </td>
       </tr>
       </table>
       </asp:Panel>
   
       <asp:Panel ID="Panel3" runat="server">
       <table class="styleOrderDetails">     
       <tr>
       <td align="center">
           <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/ShippingCAR.png" />
           <hr />
       </td>
       </tr>

       <tr>
       <td align="center">
           <asp:GridView ID="gvOrderStatus" runat="server" CellSpacing="4" ForeColor="Black" GridLines="Horizontal" Width="100%" BackColor="White"
           BorderStyle="None" BorderColor="#CCCCCC" BorderWidth="1px">
           <FooterStyle ForeColor="Black" BackColor="#CCCC99" />
           <HeaderStyle BackColor="#333333" ForeColor="Black" />
           <PagerStyle BackColor="#C0C0C0" ForeColor ="Black" HorizontalAlign="Right" />
        <RowStyle BackColor = "#33CCFF" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle  BackColor ="Yellow"  Font-Bold="True"  ForeColor="White"  HorizontalAlign="Center" />
        <SortedAscendingCellStyle  BackColor ="#f1f1f1" />
        <SortedAscendingCellStyle  BackColor ="#9999FF" />
        <SortedAscendingCellStyle  BackColor ="#6699FF" />
        <SortedAscendingCellStyle  BackColor ="#9999FF" />
           </asp:GridView>
       </td>
       </tr>

       <tr>
       <td align="center">
           <asp:TextBox ID="txtStatus" runat="server" Width="300px"></asp:TextBox>
           &nbsp;<asp:Button ID="btnAdd" runat="server" style="font-weight:700 " 
               Text = "Add" Width="36px" onclick="btnAdd_Click" />
       </td>
       </tr>
       </table> 
       </asp:Panel>
       <asp:Panel ID="Panel4" runat="server">
       <table class="styleOrderDetails">
       <tr>
       <td align="center">
           <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/no_result.png" />
       </td>
       </tr>
       </table>
       </asp:Panel>
        </table>
   </td>
   </tr>
   </table>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form> 
</body>
</html>
