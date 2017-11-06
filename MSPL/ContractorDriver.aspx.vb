Public Class ContractorDriver
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            FillGrid()
        End If
    End Sub

    Private Sub FillGrid()
        Dim DT As DataTable
        DT = ContractorData.P_Driver_GetAll()
        If DT.Rows.Count() = 0 Then
            gvData.Visible = False
        Else
            gvData.DataSource() = DT
            gvData.DataBind()
            gvData.Visible = True

        End If
    End Sub

End Class