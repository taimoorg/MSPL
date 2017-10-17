Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common
Public Class SkuDataProvider

    Public Shared Sub P_Sku_IU(Sku_ID As Integer, Sku As String, Description As String)
        Dim database As Database = DatabaseFactory.CreateDatabase()
        database.ExecuteNonQuery("P_Sku_IU", Sku_ID, Sku, Description)
    End Sub
End Class
