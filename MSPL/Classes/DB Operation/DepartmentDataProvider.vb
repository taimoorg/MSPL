Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common

Public Class DepartmentDataProvider
    Sub New()
    End Sub

    Public Shared Function P_Department_GetAll() As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Department_GetAll"), DataSet).Tables(0)
    End Function
    Public Shared Function P_Department_IU(Obj As DepartmentInfo) As Integer
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Department_IU", Obj.DEPT_ID, Obj.Name), DataSet).Tables(0).Rows(0).Item(0)
    End Function
End Class
