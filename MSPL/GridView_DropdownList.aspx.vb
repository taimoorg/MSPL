Public Class GridView_DropdownList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            litCap.Text = "Empolyee"
            FillDepartment()
            FillDepartmentList()
            FillGrid()
        End If
    End Sub

    Private Sub FillGrid(Optional ByVal DEPT_ID As Integer = 0)
        Dim DT As DataTable
        DT = EmpolyeeDataProvider.P_Emp_GetALL(DEPT_ID)
        If DT.Rows.Count() = 0 Then
            gvEmp.Visible = False
        Else
            gvEmp.Visible = True
            gvEmp.DataSource = DT
            gvEmp.DataBind()
        End If
    End Sub

    Protected Sub lbAddNew_Click(sender As Object, e As EventArgs) Handles lbAddNew.Click
        litCap.Text = "Add New Employee"
        Emp_ID.Value = 0
        txtName.Text = ""
        TxtAddress.Text = ""
        txtHair.Text = ""
        txtShift.Text = ""
        txtSalary.Text = ""

        For i = 0 To ddlDepartment.Items.Count - 1
            If ddlDepartment.Items(i).Value = deptList.Value Then
                ddlDepartment.SelectedIndex = i
                Exit For
            End If
        Next

        pnlData.Visible = False
        pnlEdit.Visible = True

    End Sub

    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        pnlData.Visible = True
        pnlEdit.Visible = False
        litCap.Text = "Employee"
    End Sub

    Private Sub FillDepartment()
        Dim DT As DataTable
        Dim LI As ListItem
        DT = EmpolyeeDataProvider.ExecuteSelect(String.Format("select distinct * from T_Department"))
        For i = 0 To DT.Rows.Count - 1
            LI = New ListItem
            LI.Text = DT.Rows(i).Item("Dept_Name")
            LI.Value = DT.Rows(i).Item("DEPT_ID")
            ddlDepartment.Items.Add(LI)

        Next
    End Sub
    Private Sub FillDepartmentList()
        Dim DT As DataTable
        Dim LI As ListItem
        DT = EmpolyeeDataProvider.ExecuteSelect(String.Format("select distinct * from T_Department"))
        For i = 0 To DT.Rows.Count - 1
            LI = New ListItem
            LI.Text = DT.Rows(i).Item("Dept_Name")
            LI.Value = DT.Rows(i).Item("DEPT_ID")
            ddlDeptList.Items.Add(LI)
        Next
    End Sub
    Protected Sub ddlDeptList_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDeptList.SelectedIndexChanged
        FillGrid(ddlDeptList.SelectedItem.Value)
        deptList.Value = ddlDeptList.SelectedItem.Value
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If User Is Nothing Then
            litError.Text = "Hub not found ."
            litError.Visible = True
            Return
        End If
        EmpolyeeDataProvider.P_Emp_IU(Emp_ID.Value, txtName.Text, txtAddress.Text, txtHair.Text, txtShift.Text, txtSalary.Text, ddlDepartment.SelectedValue)
        FillGrid()
        pnlData.Visible = True
        pnlEdit.Visible = False

    End Sub
    Private Sub gvEmp_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvEmp.RowCommand
        If e.CommandName = "CmdEdit" Then
            Emp_ID.Value = gvEmp.DataKeys(e.CommandArgument).Values(0)
            EditRecord()
        ElseIf e.CommandName = "CmdDelete" Then
            Emp_ID.Value = gvEmp.DataKeys(e.CommandArgument).Values(0)
            ' DeleteRecord()
        End If
    End Sub
    Private Sub EditRecord()
        Dim DR As DataRow
        DR = EmpolyeeDataProvider.ExecuteSelectSingleRow(String.Format("Select [Emp_Name],[Emp_Address],[Hire_Date],[Emp_Shift],[Salary],[DEPT_ID] from T_Empolyee where Emp_ID='{0}'", Emp_ID.Value))
        txtName.Text = DR.Item("Emp_Name")
        txtAddress.Text = DR.Item("Emp_Address")
        txtHair.Text = DR.Item("Hire_Date")
        txtShift.Text = DR.Item("Emp_Shift")
        txtSalary.Text = DR.Item("Salary")
        ddlDepartment.SelectedValue = DR.Item("DEPT_ID")

        'For i = 0 To ddlDepartment.Items.Count - 1
        '    If ddlDepartment.Items(i).Value = DR.Item("DEPT_ID") Then
        '        ddlDepartment.SelectedIndex = i
        '        Exit For
        '    End If
        'Next

        litCap.Text = "Edit Label"
        pnlData.Visible = False
        pnlEdit.Visible = True
    End Sub
End Class