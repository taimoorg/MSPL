Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common
Public Class ContractorData

    Public Shared Function P_Driver_GetAll() As DataTable
        Dim database As Database
        database = DatabaseFactory.CreateDatabase()
        Return CType(database.ExecuteDataSet("P_Driver_GetAll"), DataSet).Tables(0)
    End Function
End Class
