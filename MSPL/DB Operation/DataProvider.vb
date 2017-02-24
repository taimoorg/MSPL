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

    Public Shared Function P_Department_IU(obj As DepartmentInfo) As Integer
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Return CType(objDatabase.ExecuteDataSet("P_Department_IU", obj.DEPT_ID, obj.Dept_Name), DataSet).Tables(0).Rows(0).Item(0)
    End Function

    Public Shared Sub P_Department_Delete(DEPT_ID As Integer)
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        objDatabase.ExecuteNonQuery("P_Department_Delete", DEPT_ID)
    End Sub

    Public Shared Function P_Department_GetBy_Name(Dept_Name As String, sOptions As Integer) As DataTable
        Dim objDatabase As Database
        objDatabase = DatabaseFactory.CreateDatabase()
        Select Case sOptions
            Case 1
                Dept_Name = String.Format("{0}%", Dept_Name)
            Case 2
                Dept_Name = String.Format("%{0}%", Dept_Name)
            Case 3
                Dept_Name = String.Format("%{0}", Dept_Name)

        End Select

        Return CType(objDatabase.ExecuteDataSet("P_Department_GetBy_Name", Dept_Name), DataSet).Tables(0)
    End Function

End Class
