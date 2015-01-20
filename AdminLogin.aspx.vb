Imports System.Data.SqlClient
Imports System.Data

Partial Class AdminLogin
    Inherits System.Web.UI.Page
    Private all As New AllFunctions()
    Private cs As New ConnectionClass()
    Private dr As SqlDataReader


    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim login As String
        Dim pwd As String
        login = Login1.UserName
        pwd = Login1.Password
        cs.sqlconnection()
        dr = all.registration(2, login, "", "", "", "", "", "", "", "", "", "", "", "", pwd, 0, True)

        If dr.Read() Then
            Session("userid") = login
            If Convert.ToInt32(dr.GetValue(2).ToString()) = 0 Then
                Session("utype") = "admin"
                dr.Close()
                Response.Redirect("Admin.aspx")
            End If
        Else
            Response.Write("<script> alert('Invalid username or password');</script>")
        End If
    End Sub
End Class
