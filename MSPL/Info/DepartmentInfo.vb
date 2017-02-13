Public Class DepartmentInfo
    Public Property DEPT_ID As Integer
    Public Property Name As String

    Sub New()

    End Sub

    Sub New(DepId As Integer, DepName As String)
        DEPT_ID = DepId
        Name = DepName
    End Sub


End Class
