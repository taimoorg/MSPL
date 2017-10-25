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
    Public Shared Function P_Sku_GetAll(ID As Integer) As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Sku_GetAll", ID), DataSet).Tables(0)
    End Function
    Public Shared Sub P_Sku_Delete(Sku_ID As Integer)
        Dim database As Database
        database = DatabaseFactory.CreateDatabase()
        database.ExecuteNonQuery("P_Sku_Delete", Sku_ID)
    End Sub
    Public Shared Function ExecuteSelectSingleRow(ByVal Query As String) As System.Data.DataRow
        Dim objdatabase As Database
        Dim DT As DataTable
        objdatabase = DatabaseFactory.CreateDatabase()
        DT = CType(objdatabase.ExecuteDataSet(System.Data.CommandType.Text, Query), System.Data.DataSet).Tables(0)
        If DT.Rows.Count = 0 Then
            Return Nothing
        Else
            Return DT.Rows(0)
        End If
    End Function
    Public Shared Function ExecuteSelect(ByVal Query As String) As System.Data.DataTable
        Dim database As Database
        database = DatabaseFactory.CreateDatabase()
        Dim dcCommand As System.Data.Common.DbCommand
        dcCommand = database.GetSqlStringCommand(Query)
        dcCommand.CommandTimeout = 2000
        Return CType(database.ExecuteDataSet(dcCommand), System.Data.DataSet).Tables(0)
    End Function
End Class
