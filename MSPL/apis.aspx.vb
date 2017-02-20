Imports System.Web.Services
Public Class apis
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function P_Department_IU(DEPT_ID As Integer, Name As String, Last_Name As String) As Integer
        Return DataProvider.P_Department_IU(New DepartmentInfo(DEPT_ID, Name, Last_Name))
    End Function
    <WebMethod()> _
    Public Shared Function P_Department_Delete(DEPT_ID As Integer) As Integer
        DataProvider.P_Department_Delete(DEPT_ID)
        Return 1
    End Function
    <WebMethod()> _
    Public Shared Function P_Department_GetBy_Name(Name As String, sOptions As Integer, Last_Name As String, nOption As Integer) As String
        Dim dt As DataTable
        dt = DataProvider.P_Department_GetBy_Name(Name, sOptions, Last_Name, nOption)
        Return GethtmlTable(dt)

    End Function


    '<WebMethod()> _
    'Public Shared Function P_Department_GetBy_Id(DEPT_ID As Integer) As DepartmentInfo
    '    Dim Ret As New DepartmentInfo
    '    Dim DR As DataRow
    '    DR = DataProvider.P_Department_GetBy_Id(DEPT_ID)
    '    With Ret
    '        .DEPT_ID = DR.Item("DEPT_ID")
    '        .Name = DR.Item("Name")
    '        .Last_Name = DR.Item("Last_Name")
    '    End With
    '    Return Ret

    'End Function

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
        htmlTable.Append("<th align='left'>Name </th>")
        htmlTable.Append("<th align='left'>Last Nmae </th>")

        htmlTable.Append("<th align='left'> Edit </th>")
        htmlTable.Append("<th align='left'>Delete </th>")
        htmlTable.Append("</tr>")

        For i As Integer = 0 To dt.Rows.Count - 1

            htmlTable.Append("<tr>")
            'htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("DEPT_ID")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Name")))
            htmlTable.Append(String.Format("<td>{0}</td>", dt.Rows(i)("Last_Name")))


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
            .Name = DR.Item("Name")
            .Last_Name = DR.Item("Last_Name")
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
                          .Name = dt.Rows(i)("Name").ToString() _
                      })
            Next

        End If
        Return objDept

    End Function
End Class


