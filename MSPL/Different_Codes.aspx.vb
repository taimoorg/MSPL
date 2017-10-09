Public Class Different_Codes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub




    'Private Sub EditRecord()
    '    Dim DR As DataRow
    '    DR = PinnaclePlus.SQLData.GeneralOperations.ExecuteSelectSingleRow(String.Format("select * from T_Tariff where Tariff_ID='{0}'", hdnTarrif_ID.Value))
    '    hdnTarrif_ID.Value = DR.Item("Tariff_ID")
    '    txtMinPrice.Text = DR.Item("Min_Price")
    '    txtName.Text = DR.Item("Name")
    '    For i = 0 To ddlTarrifType.Items.Count - 1
    '        If ddlTarrifType.Items(i).Value = DR.Item("TT_ID") Then
    '            ddlTarrifType.SelectedIndex = i
    '            Exit For
    '        End If
    '    Next
    '    If (IsDBNull(DR.Item("Client_ID"))) Then
    '        FillGrid()
    '    Else
    '        For i = 0 To ddlClient.Items.Count - 1
    '            If ddlClient.Items(i).Value = DR.Item("CLient_ID") Then
    '                ddlClient.SelectedIndex = i
    '                Exit For
    '            End If
    '        Next
    '    End If
    '    litCap.Text = "Edit Tariff"
    '    pnlData.Visible = False
    '    pnlEdit.Visible = True

    'End Sub



End Class