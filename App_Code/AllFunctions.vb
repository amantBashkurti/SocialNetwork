Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Public Class AllFunctions
    Public cmd As SqlCommand
    Public rd As SqlDataReader
    Dim con As New ConnectionClass

    Public Function registration(ByVal flag As Integer, ByVal userid As String, ByVal first As String, ByVal last As String, ByVal email As String, ByVal address As String, _
        ByVal city As String, ByVal country As String, ByVal phone As String, ByVal gender As String, ByVal dob As String, ByVal photo As String, ByVal secques As String, ByVal secans As String, _
        ByVal pwd As String, ByVal utype As Integer, ByVal status As Boolean) As SqlDataReader

        con.sqlconnection()
        cmd = New SqlCommand("sp_login", con.myConnection)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("@flag", flag)
        cmd.Parameters.AddWithValue("@uid", userid)
        cmd.Parameters.AddWithValue("@fname", first)
        cmd.Parameters.AddWithValue("@lname", last)
        cmd.Parameters.AddWithValue("@email", email)
        cmd.Parameters.AddWithValue("@address", address)
        cmd.Parameters.AddWithValue("@city", city)
        cmd.Parameters.AddWithValue("@country", country)
        cmd.Parameters.AddWithValue("@phonenumber", phone)
        cmd.Parameters.AddWithValue("@gender", gender)
        cmd.Parameters.AddWithValue("@dob", dob)
        cmd.Parameters.AddWithValue("@photo", photo)
        cmd.Parameters.AddWithValue("@secques", secques)
        cmd.Parameters.AddWithValue("@secans", secans)
        cmd.Parameters.AddWithValue("@pswd", pwd)
        cmd.Parameters.AddWithValue("@utype", utype)
        cmd.Parameters.AddWithValue("@status", status)

        If flag = 1 Then
            cmd.ExecuteNonQuery()
        Else
            rd = cmd.ExecuteReader()
        End If

        Return rd

    End Function
End Class
