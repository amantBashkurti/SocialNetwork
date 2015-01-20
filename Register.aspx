<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="style1">
    <tr>
        <td class="style2">
                        Userid</td>
        <td>
            <asp:TextBox ID="userid" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="userid" ErrorMessage="Userid is required!"></asp:RequiredFieldValidator>
            <asp:Button ID="btnCheck" runat="server" CausesValidation="False" 
                            Text="Check" />
            <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Photo</td>
        <td>
            <asp:FileUpload ID="fuphoto" runat="server" />
            <asp:Button ID="btnattach" runat="server" CausesValidation="False" 
                            Text="Attach" Width="56px" />
            <asp:Image ID="photo" runat="server" Height="50px" Width="50px" />
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Password</td>
        <td>
            <asp:TextBox ID="pwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="pwd" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Reenter password</td>
        <td>
            <asp:TextBox ID="repwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="pwd" ControlToValidate="repwd" 
                            ErrorMessage="Passwords should match"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        First Name</td>
        <td>
            <asp:TextBox ID="first" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Last Name</td>
        <td>
            <asp:TextBox ID="last" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Email</td>
        <td>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="email" ErrorMessage="Invalid Email" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Address</td>
        <td>
            <asp:TextBox ID="address" runat="server" TextMode="MultiLine"></asp:TextBox>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <table class="style1">
                <tr>
                    <td class="style3">
                                    Country</td>
                    <td>
                        <asp:DropDownList ID="country" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="countryname" 
                            DataValueField="countryid">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RegistrationConnection %>" 
                            SelectCommand="SELECT countryid, countryname FROM country ORDER BY countryname">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                                    City</td>
                    <td>
                        <asp:DropDownList ID="city" runat="server" DataSourceID="SqlDataSource2" 
                            DataTextField="cityname" DataValueField="cityname">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RegistrationConnection %>" 
                            SelectCommand="SELECT cityname, countryid FROM city WHERE (countryid = @countryid)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="country" Name="countryid" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Phone Number</td>
        <td>
            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="phone" ErrorMessage="Invalid phone Number" 
                            ValidationExpression="\d{5}"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Gender</td>
        <td>
            <asp:RadioButtonList ID="gender" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal">
                <asp:ListItem>Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        Date of Birth</td>
        <td>
            <asp:TextBox ID="dob" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <table class="style1">
                <tr>
                    <td class="style4">
                                    Security Question</td>
                    <td>
                        <asp:DropDownList ID="secquestion" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource3" DataTextField="securityquestion" 
                            DataValueField="securityquestion">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:RegistrationConnection %>" 
                            SelectCommand="SELECT securityquestion FROM securityquestions">
                        </asp:SqlDataSource>
                        <asp:TextBox ID="txtothers" runat="server" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                                    Security Answer</td>
                    <td>
                        <asp:TextBox ID="answer" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="style2">
                        &nbsp;</td>
        <td>
            <asp:Button ID="btnregister" runat="server" Text="Register" Visible="False" />
        </td>
    </tr>
</table>
</asp:Content>

