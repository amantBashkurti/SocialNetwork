Imports System.Data.SqlClient
Imports System.Data

Partial Class Register
    Inherits System.Web.UI.Page
    Public a As New AllFunctions()
    Public dr As SqlDataReader
    Protected Sub btnCheck_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheck.Click
        dr = a.registration(0, userid.Text, "", "", "", "", "", "", "", "", "", "", "", "", "", 0, False)
        If (dr.Read()) Then
            lblmessage.Visible = True
            lblmessage.Text = "This user id is not available"
        Else
            lblmessage.Visible = True
            lblmessage.Text = "This user id is available"
            userid.ReadOnly = True
            btnregister.Visible = True
        End If
    End Sub

    Protected Sub btnattach_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnattach.Click
        fuphoto.SaveAs(Server.MapPath(Request.ApplicationPath) + "//Photos//" + fuphoto.FileName)
        photo.ImageUrl = "~/Photos//" + fuphoto.FileName
    End Sub

    Protected Sub btnregister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnregister.Click
        Dim encoded As String
        Dim sq As String
        Dim sdata As String = pwd.Text
        If secquestion.SelectedItem.Text = "other" Then

            sq = txtothers.Text
        Else
            sq = secquestion.SelectedValue
            Try
                Dim encData_byte As Byte() = New Byte(sdata.Length) {}
                encData_byte = System.Text.Encoding.UTF8.GetBytes(sdata)
                Dim encodedData As String = Convert.ToBase64String(encData_byte)
                encoded = encodedData.ToString()
            Catch ex As Exception
                Throw New Exception("Error in base64Encode" + ex.Message)

            End Try
            a.registration(1, userid.Text, first.Text, last.Text, email.Text, address.Text, city.Text, country.Text, phone.Text, _
                            gender.Text, dob.Text, photo.ImageUrl, sq, answer.Text, encoded, 1, False)

            Response.Write("<script>alert('Registered successfully')</script>")
        End If

    End Sub

    Protected Sub secquestion_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles secquestion.SelectedIndexChanged
        If secquestion.SelectedItem.Text = "other" Then
            txtothers.Visible = True
        End If

    End Sub


End Class
