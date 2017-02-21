Imports System.Web.Services
Public Class apisEmployee
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function P_Empolyee_IU(Emp_ID As Integer, Emp_Name As String, Emp_Address As String) As Integer
        Return EmpolyeeDataProvider.P_Empolyee_IU(New EmpolyeeInfo(Emp_ID, Emp_Name, Emp_Address))
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

    Private Shared Function GethtmlTable(dt As DataTable) As String
        Dim htmlTable As New StringBuilder()
        htmlTable.Append("<table border='1' cellpadding=5 cellspacing=0 width=60% >")
        htmlTable.Append("<tr>")
        htmlTable.Append("<th align='left'>Employee Name </th>")
        htmlTable.Append("<th align='left'>Address </th>")

        htmlTable.Append("<th align='left'> Edit </th>")
        htmlTable.Append("<th align='left'>Delete </th>")
        htmlTable.Append("</tr>")

        For i As Integer = 0 To dt.Rows.Count - 1

            htmlTable.Append("<tr>")
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Emp_Name")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Emp_Address")))

            htmlTable.Append(String.Format("<td><a href='javascript:OpenDialog({0});'style ='color:	#008000	'</a> Edit</td>", dt.Rows(i)("Emp_ID")))
            htmlTable.Append(String.Format("<td><a href='javascript:Del_Record({0});'style ='color:#CC0000'>Delete</a></td>", dt.Rows(i)("Emp_ID")))

            htmlTable.Append("</tr>")
        Next
        htmlTable.Append("</table>")
        Return htmlTable.ToString()

    End Function


End Class