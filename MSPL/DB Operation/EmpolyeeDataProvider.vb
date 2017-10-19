Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common


Public Class EmpolyeeDataProvider
    Sub New()
    End Sub
    'Queries For Gridview
    'Insertion for Gridview 
    Public Shared Function P_Emp_GetALL(ID As Integer) As DataTable
        Dim database As Database = DatabaseFactory.CreateDatabase()
        Return CType(database.ExecuteDataSet("P_Emp_GetALL", ID), DataSet).Tables(0)
    End Function
    Public Shared Sub P_Emp_IU(Emp_ID As Integer, Emp_Name As String, Emp_Address As String, Hire_Date As Date, Emp_Shift As String, Salary As Decimal, DEPT_ID As Integer)
        Dim database As Database = DatabaseFactory.CreateDatabase()
        database.ExecuteNonQuery("P_Emp_IU", Emp_ID, Emp_Name, Emp_Address, Hire_Date, Emp_Shift, Salary, DEPT_ID)
    End Sub
    Public Shared Sub P_Empolyee_Del(Emp_ID As Integer)
        Dim database As Database
        database = DatabaseFactory.CreateDatabase()
        database.ExecuteNonQuery("P_Empolyee_Del", Emp_ID)
    End Sub
    Public Shared Function ExecuteSelectSingleRow(ByVal Query As String) As System.Data.DataRow
        Dim objDatabase As Database
        Dim DT As DataTable
        objDatabase = DatabaseFactory.CreateDatabase()
        DT = CType(objDatabase.ExecuteDataSet(System.Data.CommandType.Text, Query), System.Data.DataSet).Tables(0)
        If DT.Rows.Count = 0 Then
            Return Nothing
        Else
            Return DT.Rows(0)
        End If
    End Function
    Public Shared Function ExecuteSelect(ByVal Query As String) As System.Data.DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Dim dcCommand As System.Data.Common.DbCommand
        dcCommand = objDatabase.GetSqlStringCommand(Query)
        dcCommand.CommandTimeout = 2000
        Return CType(objDatabase.ExecuteDataSet(dcCommand), System.Data.DataSet).Tables(0)
    End Function

    'Insertion for apis
    Public Shared Function P_Empolyee_IU(obj As EmpolyeeInfo) As Integer
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Empolyee_IU", obj.Emp_ID, obj.Emp_Name, obj.Emp_Address, obj.DEPT_ID, obj.Hire_Date, obj.Emp_Shift, obj.Salary), DataSet).Tables(0).Rows(0).Item(0)
    End Function

    Public Shared Function P_Empolyee_GetAll() As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Empolyee_GetAll"), DataSet).Tables(0)
    End Function

    Public Shared Sub P_Empolyee_Delete(Emp_ID As Integer)
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        objDatabase.ExecuteNonQuery("P_Empolyee_Delete", Emp_ID)
    End Sub

    Public Shared Function P_Empolyee_GetBy_Id(Emp_ID As Integer) As DataRow
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Empolyee_GetBy_Id", Emp_ID), DataSet).Tables(0).Rows(0)

    End Function

    Public Shared Function P_Emp_GetBy_Dept(DEPT_ID As Integer) As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Emp_GetBy_Dept", DEPT_ID), DataSet).Tables(0)
    End Function

End Class


