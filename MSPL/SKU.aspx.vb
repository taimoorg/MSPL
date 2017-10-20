Public Class SKU
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            litCap.Text = "SKU"
            FillGrid()
        End If

    End Sub
    Private Sub FillGrid()
        Dim DT As DataTable
        DT = SkuDataProvider.P_Sku_GetAll()
        If DT.Rows.Count() = 0 Then
            gvData.Visible = False
        Else
            gvData.DataSource() = DT
            gvData.DataBind()
            gvData.Visible = True
        End If
    End Sub
    Protected Sub lbAddNew_Click(sender As Object, e As EventArgs) Handles lbAddNew.Click
        litCap.Text = "Add New SKU"
        Sku_ID.Value = 0
        txtSku.Text = ""
        txtDescrp.Text = ""
        txtWeight.Text = ""
        txtHeight.Text = ""
        txtWidth.Text = ""
        txtDepth.Text = ""

        pnlData.Visible = False
        pnlEdit.Visible = True

    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If User Is Nothing Then
            litError.Text = "Not Sku"
            litError.Visible = True
        End If
        SkuDataProvider.P_Sku_IU(Sku_ID.Value, txtSku.Text, txtDescrp.Text, txtWeight.Text, txtHeight.Text, txtWidth.Text, txtDepth.Text)
        pnlData.Visible = True
        pnlEdit.Visible = False
        FillGrid()

    End Sub
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        litCap.Text = "Add New SKU"
        pnlData.Visible = True
        pnlEdit.Visible = False
    End Sub



    Private Sub EditRecord()
        Dim Dr As DataRow
        Dr = SkuDataProvider.ExecuteSelectSingleRow(String.Format("select * from T_Sku where Sku_ID ='{0}'", Sku_ID.Value))
        txtSku.Text = Dr.Item("SKU")
        txtDescrp.Text = Dr.Item("Description")
        txtWeight.Text = Dr.Item("SumUPWeight")
        txtHeight.Text = Dr.Item("SumUPHeight")
        txtWidth.Text = Dr.Item("SumUPWidth")
        txtDepth.Text = Dr.Item("SumUPDepth")

        litCap.Text = "Edit Sku"
        pnlData.Visible = False
        pnlEdit.Visible = True

    End Sub
    Private Sub DeleteRecord()
        SkuDataProvider.P_Sku_Delete(Sku_ID.Value)
        FillGrid()
    End Sub

    Private Sub gvData_RomCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvData.RowCommand
        If e.CommandName = "CmdEdit" Then
            Sku_ID.Value = gvData.DataKeys(e.CommandArgument).Values(0)
            EditRecord()
        ElseIf e.CommandName = "CmdDelete" Then
            Sku_ID.Value = gvData.DataKeys(e.CommandArgument).Values(0)
            DeleteRecord()
        End If
    End Sub
    Private Sub gvData_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvData.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim DelLink As LinkButton = e.Row.Cells(7).Controls(0)
            DelLink.OnClientClick = "return confirm('Are you sure you want to delete this record?');"
        End If
    End Sub
End Class