Imports System.Web.Services
Public Class apis
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function P_Department_IU(DEPT_ID As Integer, Dept_Name As String) As Integer
        Return DataProvider.P_Department_IU(New DepartmentInfo(DEPT_ID, Dept_Name))
    End Function

    <WebMethod()> _
    Public Shared Function P_Department_Delete(DEPT_ID As Integer) As Integer
        DataProvider.P_Department_Delete(DEPT_ID)
        Return 1
    End Function

    <WebMethod()> _
    Public Shared Function P_Department_GetBy_Name(Dept_Name As String, sOptions As Integer) As String
        Dim dt As DataTable
        dt = DataProvider.P_Department_GetBy_Name(Dept_Name, sOptions)
        Return GethtmlTable(dt)

    End Function

    <WebMethod()> _
    Public Shared Function GetDeptTable() As String
        Dim dt As DataTable
        dt = DataProvider.P_Department_GetAll()
        Return GethtmlTable(dt)

    End Function
    Private Shared Function GethtmlTable(dt As DataTable) As String
        Dim htmlTable As New StringBuilder()
        'htmlTable.Append("<table border='1' cellpadding=5 cellspacing=0 width=40% align='center'>")
        htmlTable.Append("<table border='1' cellpadding=5 cellspacing=0 width=60% >")
        htmlTable.Append("<tr>")
        'htmlTable.Append("<th width=20% align='left'> Department ID </th>")
        htmlTable.Append("<th align='left'>Department Name </th>")

        htmlTable.Append("<th align='left'> Edit </th>")
        htmlTable.Append("<th align='left'>Delete </th>")
        htmlTable.Append("</tr>")

        For i As Integer = 0 To dt.Rows.Count - 1

            htmlTable.Append("<tr>")
            'htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("DEPT_ID")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Dept_Name")))

            htmlTable.Append(String.Format("<td><a href='javascript:OpenDialog({0});'style ='color:	#008000	'</a> Edit</td>", dt.Rows(i)("DEPT_ID")))
            htmlTable.Append(String.Format("<td><a href='javascript:Del_Record({0});'style ='color:#CC0000'>Delete</a></td>", dt.Rows(i)("DEPT_ID")))

            htmlTable.Append("</tr>")
        Next
        htmlTable.Append("</table>")
        Return htmlTable.ToString()

    End Function

    <WebMethod()> _
    Public Shared Function P_Department_GetBy_Id(DEPT_ID As Integer) As DepartmentInfo
        Dim Ret As New DepartmentInfo
        Dim DR As DataRow
        DR = DataProvider.P_Department_GetBy_Id(DEPT_ID)
        With Ret
            .DEPT_ID = DR.Item("DEPT_ID")
            .Dept_Name = DR.Item("Dept_Name")

        End With
        Return Ret

    End Function

    <WebMethod()> _
    Public Shared Function PopulateDropDownList() As List(Of DepartmentInfo)
        Dim dt As DataTable
        Dim objDept As New List(Of DepartmentInfo)()
        dt = DataProvider.P_Department_GetAll()
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                objDept.Add(New DepartmentInfo() With { _
                          .DEPT_ID = Convert.ToInt32(dt.Rows(i)("DEPT_ID")), _
                          .Dept_Name = dt.Rows(i)("Dept_Name").ToString() _
                      })
            Next

        End If
        Return objDept

    End Function

    <WebMethod()> _
    Public Shared Function EmpDropDownList(DEPT_ID As Integer) As List(Of EmpolyeeInfo)
        Dim dt As DataTable
        Dim objEmp As New List(Of EmpolyeeInfo)()
        dt = EmpolyeeDataProvider.P_Emp_GetBy_Dept(DEPT_ID)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                objEmp.Add(New EmpolyeeInfo() With { _
                             .Emp_ID = Convert.ToInt32(dt.Rows(i)("Emp_ID")), _
                             .Emp_Name = dt.Rows(i)("Emp_Name").ToString() _
                         })
            Next
        End If
        Return objEmp
    End Function

End Class


