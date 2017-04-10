Imports Microsoft.Practices.EnterpriseLibrary.Data
Imports Microsoft.Practices.EnterpriseLibrary.Common

Public Class EmpolyeeDataProvider

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

