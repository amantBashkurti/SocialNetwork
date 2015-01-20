<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="UserValidation.aspx.vb" Inherits="UserValidation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="userid,userid1" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="firstname" HeaderText="firstname" 
                    SortExpression="firstname" />
                <asp:BoundField DataField="lastname" HeaderText="lastname" 
                    SortExpression="lastname" />
                <asp:TemplateField HeaderText="email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="address" HeaderText="address" 
                    SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="country" HeaderText="country" 
                    SortExpression="country" />
                <asp:BoundField DataField="phonenumber" HeaderText="phonenumber" 
                    SortExpression="phonenumber" />
                <asp:BoundField DataField="gender" HeaderText="gender" 
                    SortExpression="gender" />
                <asp:BoundField DataField="dateofbirth" HeaderText="dateofbirth" 
                    SortExpression="dateofbirth" />
                <asp:TemplateField HeaderText="photo" SortExpression="photo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("photo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="0px" Width="50px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="userid" SortExpression="userid">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("userid") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("userid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Accept ?">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:RegistrationConnection %>" 
            
            SelectCommand="SELECT registration.firstname, registration.lastname, registration.email, registration.address, registration.city, registration.country, registration.phonenumber, registration.gender, registration.dateofbirth, registration.photo, login.status, registration.userid, login.userid  FROM registration INNER JOIN login ON registration.userid = login.userid WHERE (login.status = 0)"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Validate User" />
    </asp:View>
</asp:MultiView>
</asp:Content>

