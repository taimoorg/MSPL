Imports System.Web.Services
Public Class apis
    Inherits System.Web.UI.Page

    <WebMethod()> _
    Public Shared Function P_Department_Delete(DEPT_ID As Integer) As Integer
        DepartmentDataProvider.P_Department_Delete(DEPT_ID)

        Return 1
    End Function

    <WebMethod()> _
    Public Shared Function P_Department_IU(DEPT_ID As Integer, Name As String) As Integer
        Return DepartmentDataProvider.P_Department_IU(New DepartmentInfo(DEPT_ID, Name))

    End Function

    <WebMethod()> _
    Public Shared Function P_Department_GetBy_Id(DEPT_ID As Integer) As DepartmentInfo
        Dim Ret As New DepartmentInfo
        Dim DR As DataRow
        DR = DepartmentDataProvider.P_Department_GetBy_Id(DEPT_ID)
        With Ret
            .DEPT_ID = DR.Item("DEPT_ID") 
            .Name = DR.Item("Name")
        End With
        Return Ret

    End Function
End Class