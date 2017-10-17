Public Class SKU
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub lbAddNew_Click(sender As Object, e As EventArgs) Handles lbAddNew.Click
        litCap.Text = "SKU"
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

End Class