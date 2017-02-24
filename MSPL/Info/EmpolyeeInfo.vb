
Public Class EmpolyeeInfo
    Public Property Emp_ID As Integer
    Public Property Emp_Name As String
    Public Property Emp_Address As String
    Public Property DEPT_ID As Integer

    Sub New()

    End Sub

    Sub New(EmpId As Integer, EmpName As String, EmpAddress As String, DeptId As Integer)
        Emp_ID = EmpId
        Emp_Name = EmpName
        Emp_Address = EmpAddress
        DEPT_ID = DeptId

    End Sub

End Class
