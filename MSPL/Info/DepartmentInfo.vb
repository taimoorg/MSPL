Public Class DepartmentInfo
    Public Property DEPT_ID As Integer
    Public Property Name As String
    Public Property Last_Name As String

    Sub New()

    End Sub

    Sub New(DepId As Integer, DepName As String, lastName As String)
        DEPT_ID = DepId
        Name = DepName
        Last_Name = lastName
    End Sub


End Class
