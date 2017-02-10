Public Class insert
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim id As Integer
        Dim name As String
        id = 0
        name = txtname.Text
        DepartmentDataProvider.P_Department_IU(New MSPL.DepartmentInfo(id, name))
        Server.Transfer("department.aspx", True)
    End Sub
End Class