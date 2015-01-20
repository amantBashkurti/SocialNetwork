Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class ConnectionClass
    Public myConnection As SqlConnection
    Public str As String
    Public Sub sqlconnection()
        str = ConfigurationManager.ConnectionStrings("RegistrationConnection").ConnectionString
        myConnection = New SqlConnection(str)
        myConnection.Open()
    End Sub
End Class
