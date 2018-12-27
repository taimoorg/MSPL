Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common
Public Class LoginPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LoginID_Click(sender As Object, e As EventArgs) Handles LoginID.Click
        Dim Check As Boolean
        Session.Timeout = 1
        Check = DataProvider.P_UserLogin(txtName.Text, txtPassword.Text)
        If Check Then
            Session.Add("UserId", txtName.Text)
            Response.Redirect("SKU.aspx")
        Else
            litError.Text = "Enter Name and Password"
        End If
    End Sub
End Class