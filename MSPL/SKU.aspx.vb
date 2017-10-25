Public Class SKU
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            litCap.Text = "SKU"
            FillGrid()
            MainClinetDropDown()
            ClinetDropDown()
        End If

    End Sub
    Private Sub FillGrid(Optional ByVal Client_ID As Integer = 0)
        Dim DT As DataTable
            Client_ID = ddlClientList.SelectedItem.Value
            DT = SkuDataProvider.P_Sku_GetAll(Client_ID)
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

        For i = 0 To ddlClient.Items.Count - 1
            If ddlClient.Items(i).Value = hdnClientList.Value Then
                ddlClient.SelectedIndex = i
            End If
        Next

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
        litCap.Text = "SKU"
        FillGrid()

    End Sub
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        litCap.Text = "SKU"
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
            Dim DelLink As LinkButton = e.Row.Cells(9).Controls(0)
            DelLink.OnClientClick = "return confirm('Are you sure you want to delete this record?');"
        End If
    End Sub
    Private Sub MainClinetDropDown()
        Dim DT As DataTable
        Dim LI As ListItem
        DT = SkuDataProvider.ExecuteSelect(String.Format("select * from T_Client"))
        'ddlClientList.Items.Clear()
        'LI = New ListItem
        'LI.Text = "Select"
        'LI.Value = 0
        'ddlClientList.Items.Add(LI)
        'ddlClient.Items.Add(LI)
        For i = 0 To DT.Rows.Count - 1
            LI = New ListItem
            LI.Text = DT.Rows(i).Item("Name")
            LI.Value = DT.Rows(i).Item("Client_ID")
            ddlClientList.Items.Add(LI)
            'ddlClient.Items.Add(LI)
        Next
    End Sub
    Private Sub ClinetDropDown()
        Dim DT As DataTable
        Dim LI As ListItem
        DT = SkuDataProvider.ExecuteSelect(String.Format("select * from T_Client"))
        For i = 0 To DT.Rows.Count - 1
            LI = New ListItem
            LI.Text = DT.Rows(i).Item("Name")
            LI.Value = DT.Rows(i).Item("Client_ID")
            ddlClient.Items.Add(LI)
        Next
    End Sub
    Protected Sub ddlClientList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlClientList.SelectedIndexChanged
        FillGrid(ddlClientList.SelectedItem.Value)
        hdnClientList.Value = ddlClientList.SelectedItem.Value
    End Sub
    Protected Sub gvData_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvData.PageIndexChanging
        gvData.PageIndex = e.NewPageIndex
        FillGrid()
    End Sub
End Class