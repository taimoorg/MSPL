Public Class DepartmentInfo
    Public Property DEPT_ID As Integer
    Public Property Dept_Name As String


    Sub New()

    End Sub

    Sub New(DepId As Integer, DepName As String)
        DEPT_ID = DepId
        Dept_Name = DepName

    End Sub


End Class
