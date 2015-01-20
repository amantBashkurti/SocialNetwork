Imports System.Data.SqlClient
Imports System.Data
Imports System.Net.Mail
Imports System.Net

Partial Class UserValidation
    Inherits System.Web.UI.Page
    Private a As New AllFunctions()
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        For Each v As GridViewRow In GridView1.Rows
            Dim ch As CheckBox = CType(v.FindControl("CheckBox1"), CheckBox)
            If ch.Checked = True Then
                Dim uid As Label = CType(v.FindControl("Label1"), Label)
                Dim email As Label = CType(v.FindControl("Label2"), Label)
                a.registration(4, uid.Text, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, True)
                Dim mailMsg As New MailMessage()
                mailMsg.From = New MailAddress("testvnr@gmail.com")
                mailMsg.To.Add(email.Text)
                mailMsg.Subject = "Your account is created"
                mailMsg.Body = "You can now login to the website"
                mailMsg.Priority = MailPriority.High
                Dim c As New SmtpClient("smtp.gmail.com", 587)
                Dim cred As New NetworkCredential("testvnr@gmail.com", "testaccount123")
                c.Credentials = cred
                c.EnableSsl = True
                Try
                    c.Send(mailMsg)
                Catch ex As Exception
                    Response.Write(ex.Message)
                End Try

                GridView1.DataBind()

            End If
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("flag") <> "" Then
            If Request.QueryString("flag") = "1" Then
                MultiView1.ActiveViewIndex = 0
            End If
        End If
    End Sub
End Class
