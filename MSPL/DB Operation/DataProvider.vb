Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common
Public Class DataProvider
    Sub New()
    End Sub

    Public Shared Function P_Department_GetAll() As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Department_GetAll"), DataSet).Tables(0)
    End Function
    Public Shared Function P_Department_GetBy_Id(DEPT_ID As Integer) As DataRow
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Department_GetBy_Id", DEPT_ID), DataSet).Tables(0).Rows(0)
    End Function
    Public Shared Function P_Department_IU(Obj As DepartmentInfo) As Integer
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Department_IU", Obj.DEPT_ID, Obj.Name), DataSet).Tables(0).Rows(0).Item(0)
    End Function

    Public Shared Sub P_Department_Delete(DEPT_ID As Integer)
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        objDatabase.ExecuteNonQuery("P_Department_Delete", DEPT_ID)
    End Sub

    Public Shared Function P_Department_GetBy_Name(Name As String) As DataTable

    End Function

End Class
