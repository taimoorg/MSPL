Imports System.IO
Imports System.Drawing

Public Class department
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            DropDownList1.Items.Insert(0, "Select")
        End If
        FillGrid()
        'FillDropDownList()
    End Sub
    'Private Sub FillDropDownList()
    '    Dim dt As DataTable
    '    dt = DataProvider.P_Department_GetAll
    '    ddlDepartments.DataSource = dt
    '    ddlDepartments.DataTextField = "Dept_Name"
    '    ddlDepartments.DataValueField = "Dept_Name"
    '    ddlDepartments.DataBind()

    'End Sub

    Private Sub FillGrid()
        Dim DT As DataTable
        DT = DataProvider.P_Department_GetAll
        GridView1.DataSource = DT
        GridView1.DataBind()
    End Sub
    'GRID DATA FILTER BY AUTOCOMPLETE
    Private Sub FillGrid_ById()
        Dim DT As DataTable
        DT = DataProvider.P_Departments_GetBy_Id(Dept_Val.Value)
        GridView1.DataSource = DT
        GridView1.DataBind()
        If Dept_Val.Value <> "" Then
            txtSearch.Text = DT.Rows.Item(0).Item("Dept_Name")
        End If
    End Sub
    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If (e.Row.RowType = DataControlRowType.DataRow) Then
            Dim rowView As DataRowView = CType(e.Row.DataItem, DataRowView)

            Dim L_DEPT_ID As Integer = rowView("DEPT_ID")
            Dim Lb As LinkButton
            Dim LbDel As LinkButton

            Lb = e.Row.Cells(0).FindControl("lnkEdit")
            Lb.OnClientClick = String.Format("OpenDialog({0});return false;", L_DEPT_ID)

            LbDel = e.Row.Cells(0).FindControl("lnkDel")
            LbDel.OnClientClick = String.Format("Del_Record({0});return false;", L_DEPT_ID)

            'AddHandler Lb.Click, AddressOf EditRecord
            Lb.Visible = True
            LbDel.Visible = True
        End If
    End Sub
    'PAGE NUMBER
    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        FillGrid()
    End Sub
    'PAGE SIZE [NO.OF ROWS SHOW ON PER PAGE]
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim size As Integer = 0
        If DropDownList1.SelectedItem.Text <> "--Select--" Then
            size = Integer.Parse(DropDownList1.SelectedItem.Value.ToString())
            GridView1.PageSize = size
            FillGrid()
        End If
    End Sub
    'ExportToExcel
    Protected Sub ExportToExcel(sender As Object, e As EventArgs)
        Response.Clear()
        Response.Buffer = True
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"
        Using sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            'To Export all pages
            GridView1.AllowPaging = True
            Me.FillGrid()
            GridView1.HeaderRow.BackColor = Color.White
            For Each cell As TableCell In GridView1.HeaderRow.Cells
                cell.BackColor = GridView1.HeaderStyle.BackColor
            Next
            For Each row As GridViewRow In GridView1.Rows
                row.BackColor = Color.White
                For Each cell As TableCell In row.Cells
                    If row.RowIndex Mod 2 = 0 Then
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor
                    Else
                        cell.BackColor = GridView1.RowStyle.BackColor
                    End If
                    cell.CssClass = "textmode"
                Next
            Next
            GridView1.RenderControl(hw)
            'style to format numbers to string
            Dim style As String = "<style> .textmode { } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.[End]()
        End Using
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(control As Control)
        'Verifies that the control is rendered
    End Sub
    Protected Sub btnGo_Click(sender As Object, e As EventArgs) Handles btnGo.Click
        FillGrid_ById()
    End Sub
End Class