
Public Class EmpolyeeInfo
    Public Property Emp_ID As Integer
    Public Property Emp_Name As String
    Public Property Emp_Address As String

    Sub New(EmpId As Integer, EmpName As String, EmpAddress As String)
        Emp_ID = EmpId
        Emp_Name = EmpName
        Emp_Address = EmpAddress


    End Sub

End Class
