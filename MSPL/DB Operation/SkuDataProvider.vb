Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common
Public Class SkuDataProvider
    Sub New()

    End Sub

    Public Shared Sub P_Sku_IU(Sku_ID As Integer, SKU As String, Description As String, SumUPWeight As Integer, SumUPHeight As Integer, SumUPWidth As Integer, SumUPDepth As Integer)
        Dim objdatabase As Database
        objdatabase = DatabaseFactory.CreateDatabase()
        objdatabase.ExecuteNonQuery("P_Sku_IU", Sku_ID, SKU, Description, SumUPWeight, SumUPHeight, SumUPWidth, SumUPDepth)
    End Sub

    Public Shared Function P_Sku_GetAll() As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Sku_GetAll"), DataSet).Tables(0)
    End Function

End Class
