
Public Class EmpolyeeInfo
    Public Property Emp_ID As Integer
    Public Property Emp_Name As String
    Public Property Emp_Address As String
    Public Property DEPT_ID As Integer
    Public Property Hire_Date As String
    Public Property Emp_Shift As String
    Public Property Salary As String

    Sub New()

    End Sub

    Sub New(EmpId As Integer, EmpName As String, EmpAddress As String, DeptId As Integer, Hiredate As String, shift As String, EmpSalary As String)

        Emp_ID = EmpId
        Emp_Name = EmpName
        Emp_Address = EmpAddress
        DEPT_ID = DeptId
        Hire_Date = Hiredate
        Emp_Shift = shift
        Salary = EmpSalary
    End Sub

End Class
