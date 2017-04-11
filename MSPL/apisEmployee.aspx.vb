Imports System.Web.Services
Imports System.Data.SqlClient

Public Class apisEmployee
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function P_Empolyee_IU(Emp_ID As Integer, Emp_Name As String, Emp_Address As String, DEPT_ID As Integer, Hire_Date As String, Emp_Shift As String, Salary As String) As Integer
        Return EmpolyeeDataProvider.P_Empolyee_IU(New EmpolyeeInfo(Emp_ID, Emp_Name, Emp_Address, DEPT_ID, Hire_Date, Emp_Shift, Salary))
    End Function

    <WebMethod()> _
    Public Shared Function P_Empolyee_Delete(Emp_ID As Integer) As Integer
        EmpolyeeDataProvider.P_Empolyee_Delete(Emp_ID)
        Return 1
    End Function

    <WebMethod()> _
    Public Shared Function GetEmpTable() As String
        Dim dt As DataTable
        dt = EmpolyeeDataProvider.P_Empolyee_GetAll()
        Return GethtmlTable(dt)

    End Function


    <WebMethod()> _
    Public Shared Function P_Empolyee_GetBy_Id(Emp_ID As Integer) As EmpolyeeInfo
        Dim Ret As New EmpolyeeInfo
        Dim Dr As DataRow
        Dr = EmpolyeeDataProvider.P_Empolyee_GetBy_Id(Emp_ID)
        With Ret
            .Emp_ID = Dr.Item("Emp_ID")
            .Emp_Name = Dr.Item("Emp_Name")
            .Emp_Address = Dr.Item("Emp_Address")
            .DEPT_ID = Dr.Item("DEPT_ID")
            .Emp_Shift = Dr.Item("Emp_Shift")
            .Hire_Date = Dr.Item("Hire_Date")

        End With
        Return Ret
    End Function

    'AUTO COMPLETE

    <WebMethod()> _
    Public Shared Function AutoComplete(SearchText As String) As String()
        'Dim DeptList As New List(Of String)()
        'Using con As New SqlConnection()
        '    con.ConnectionString = ConfigurationManager.ConnectionStrings("SQLStr").ConnectionString
        '    Using cmd As New SqlCommand("P_Department_AutoComplete", con)
        '        cmd.CommandType = CommandType.StoredProcedure
        '        cmd.Parameters.AddWithValue("@SearchText", SearchText)
        '        cmd.Connection = con
        '        con.Open()
        '        Using dr As SqlDataReader = cmd.ExecuteReader()
        '            While dr.Read()
        '                DeptList.Add(dr("Dept_Name").ToString())
        '            End While
        '        End Using
        '        con.Close()
        '    End Using
        '    Return DeptList.ToArray()
        'End Using

        Dim DT As DataTable
        Dim DeptList As New List(Of String)()
        DT = DataProvider.P_Department_AutoComplete(SearchText)
        For i = 0 To DT.Rows.Count - 1
            DeptList.Add(DT.Rows(i).Item("Dept_Name").ToString())
        Next
        Return DeptList.ToArray()
    End Function

    <WebMethod()> _
    Public Shared Function P_Emp_GetBy_Dept(DEPT_ID As Integer) As String
        Dim dt As DataTable
        dt = EmpolyeeDataProvider.P_Emp_GetBy_Dept(DEPT_ID)
        Return GethtmlTable(dt)

    End Function

    <WebMethod()> _
    Public Shared Function P_Department_AutoSearch(Dept_Name As String) As String
        Dim dt As DataTable
        dt = DataProvider.P_Department_GetBy_Name(Dept_Name)
        Return GethtmlTable(dt)

    End Function
    Private Shared Function GethtmlTable(dt As DataTable) As String
        Dim htmlTable As New StringBuilder()
        htmlTable.Append("<table align='center' border='1' cellpadding=5 cellspacing=0 width=60% >")
        htmlTable.Append("<tr  bgcolor='#D3D3D3'>")

        htmlTable.Append("<th align='left'>Employee Name </th>")
        htmlTable.Append("<th align='left'>Address  </th>")
        htmlTable.Append("<th align='left'>Department Name </th>")
        htmlTable.Append("<th align='left'> Hire Date </th>")
        htmlTable.Append("<th align='left'> Shift Time  </th>")
        htmlTable.Append("<th align='left'> Salary  </th>")

        htmlTable.Append("<th align='left'> Edit </th>")
        htmlTable.Append("<th align='left'>Delete </th>")
        htmlTable.Append("</tr>")

        For i As Integer = 0 To dt.Rows.Count - 1

            htmlTable.Append("<tr>")

            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Emp_Name")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Emp_Address")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Dept_Name")))

            If IsDBNull(dt.Rows(i)("Hire_Date")) Then
                htmlTable.Append(String.Format("<td>{0}</td>", "--"))
            Else
                htmlTable.Append(String.Format("<td>{0}</td>", Format(dt.Rows(i)("Hire_Date"), "dd-MM-yy")))
            End If

            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Emp_Shift")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Salary")))

            htmlTable.Append(String.Format("<td><a href='javascript:OpenDialog({0});'style ='color:#008000'</a> Edit</td>", dt.Rows(i)("Emp_ID")))
            htmlTable.Append(String.Format("<td><a href='javascript:Del_Record({0});'style ='color:#CC0000'>Delete</a></td>", dt.Rows(i)("Emp_ID")))

            htmlTable.Append("</tr>")
        Next
        htmlTable.Append("</table>")
        Return htmlTable.ToString()

    End Function

End Class