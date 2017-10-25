<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GridView_DropdownList.aspx.vb" Inherits="MSPL.GridView_DropdownList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDM7-igdY9_vzj7-1ASLXQmLHPxNDB3OHE&libraries=drawing"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
</head>
<body>
    <script>

        $(document).ready(function () {

            $("[id$=txtHair]").datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                beforeShowDay: function (date) {
                    var day = date.getDay();
                    return [day != 0, ''];
                }
            });
        });
    </script>
    <style>
        .top_cap {
            background-color: #4789c4;
            font-size: 16pt;
            font-weight: bold;
            text-align: center;
            color: #fff;
            padding: 5px;
            width: auto;
        }

        .error {
            font-size: 12pt;
            font-weight: bold;
            text-align: center;
            color: #ff0000;
        }
    </style>

    <form id="form1" runat="server">
        <div class="top_cap">
            <asp:Literal ID="litCap" runat="server"></asp:Literal>
        </div>
        <div class="error">
            <asp:Literal ID="litError" runat="server" Visible="false"></asp:Literal>
        </div>
        <br />

        <asp:Panel ID="pnlData" runat="server" Visible="true">
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <asp:LinkButton ID="lbAddNew" runat="server">Add New Label </asp:LinkButton>
                <br />
                <br />

            </div>
            <div>
                <table style="margin-left: auto; margin-right: auto;">
                    <tr>
                        <td>Department: </td>
                        <td>
                            <asp:DropDownList ID="ddlDeptList" OnSelectedIndexChanged="ddlDeptList_SelectedIndexChanged" AutoPostBack ="true"   runat="server" Width="180px ">
                                 <asp:ListItem Text="--Select Department--" Value="0" ></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        

                    </tr>
                </table>
            </div>
            <br />




            <div style="margin-left: auto; margin-right: auto; width: 90%">
                <asp:GridView ID="gvEmp" runat="server" Width="85%" AutoGenerateColumns="false" DataKeyNames="Emp_ID" HeaderStyle-BackColor="#4789c4" HeaderStyle-Height="25px">
                     
                    <Columns>
                        <asp:BoundField DataField="DEPT_Name" HeaderText="Department">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Emp_Name" HeaderText="Name">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Emp_Address" HeaderText="Address">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Hire_Date" HeaderText="Hire Date">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Emp_Shift" HeaderText="Shift">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Salary" HeaderText="Salary">
                            <HeaderStyle HorizontalAlign="Center" Font-Size="Medium" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:ButtonField ButtonType="Link" CommandName="CmdEdit" HeaderStyle-HorizontalAlign="Center" HeaderText="Edit" ItemStyle-HorizontalAlign="Center" Text="Edit">
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>
                        <asp:ButtonField ButtonType="Link" CommandName="CmdDelete" HeaderStyle-HorizontalAlign="Center" HeaderText="Delete" ItemStyle-HorizontalAlign="Center" Text="Delete">
                            <HeaderStyle HorizontalAlign="Center" ForeColor="White"/>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:ButtonField>

                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEdit" runat="server" Visible="false">
            <div>
                <table style="margin-left: auto; margin-right: auto;">
                    <tr>
                        <td>Department: </td>
                        <td>
                            <asp:DropDownList ID="ddlDepartment" runat="server" Width="180px" /></td>
                    </tr>
                    <tr>
                        <td>Name: </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Width="180"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>Address: </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Width="180" Height="80px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Hairing Date: </td>
                        <td>
                            <asp:TextBox ID="txtHair" CssClass="weight" runat="server" Width="180"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Shift Time: </td>
                        <td>
                            <asp:TextBox ID="txtShift" CssClass="height" runat="server" Width="180"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Salary: </td>
                        <td>
                            <asp:TextBox ID="txtSalary" CssClass="width" runat="server" Width="180"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HiddenField runat="server" ID="DEPT_ID" />
                            <asp:HiddenField runat="server" ID="Emp_ID" Value="0" />
                            <asp:HiddenField runat="server" ID="deptList" />
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <div style="margin-left: auto; margin-right: auto; text-align: center;">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" />&nbsp;&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="100px" />
            </div>
        </asp:Panel>


    </form>
</body>
</html>
