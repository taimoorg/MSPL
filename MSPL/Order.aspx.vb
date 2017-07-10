Imports System.Globalization

Public Class Order
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FillGrid()
    End Sub

    Private Sub lbAddNew_Click(sender As Object, e As EventArgs) Handles lbAddNew.Click
        txtOrderNo.Text = ""
        txtName.Text = ""
        txtPrice.Text = ""
        txtDate.Text = ""
        Order_ID.Value = 0
        pnlData.Visible = False
        pnlEdit.Visible = True

    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If User Is Nothing Then
            litError.Text = "Order."
            litError.Visible = True
            Return
        End If
        DataProvider.P_Order_IU(Order_ID.Value, txtOrderNo.Text, txtName.Text, txtPrice.Text.Trim, txtDate.Text)
        FillGrid()
        pnlData.Visible = True
        pnlEdit.Visible = False
    End Sub

    Private Sub FillGrid()
        Dim dt As DataTable
        'Convert String into datetime
        Dim FDate As DateTime
        Dim TDate As DateTime
        If (FromDate.Text <> "") Then
            FDate = FromDate.Text
        Else
            FDate = "1972-07-01 "

        End If
        If (ToDate.Text <> "") Then
            TDate = ToDate.Text
        Else
            TDate = "2030-07-01"
        End If
        'Convert String into integer
        Dim OrderNo As Integer
        'Int32.TryParse(Order.Text, OrderNo)
        Integer.TryParse(Order.Text, OrderNo)

        dt = DataProvider.P_Order_GetAll(filterName.Text.Trim, OrderNo, FDate, TDate)
        If dt.Rows.Count = 0 Then
            gvOrder.Visible = False
        Else
            gvOrder.Visible = True
            gvOrder.DataSource = dt
            gvOrder.DataBind()
        End If
    End Sub

    'Private Sub FillGrid()
    '    Dim dt As DataTable
    '    dt = DataProvider.P_Order_GetAll()
    '    If dt.Rows.Count = 0 Then
    '        gvOrder.Visible = False
    '    Else
    '        gvOrder.Visible = True
    '        gvOrder.DataSource = dt
    '        gvOrder.DataBind()
    '    End If
    'End Sub
    Protected Sub btnfilter_Click(sender As Object, e As EventArgs)
        FillGrid()
    End Sub
End Class