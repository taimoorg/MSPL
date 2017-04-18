Public Class department
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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

        'Dim A As New DepartmentInfo
        'A.DEPT_ID = 0
        'A.Name = "fdfd"
        'DepartmentDataProvider.P_Department_IU(A)
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

    Protected Sub GridView1_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        Me.FillGrid()
    End Sub
End Class