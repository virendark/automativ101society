<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="View-Students.aspx.cs" Inherits="TestTutorial101.Admin.View_Students" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        table {
            border: 1px solid #ccc;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }

        .Pager span {
            color: #333;
            background-color: #F7F7F7;
            font-weight: bold;
            text-align: center;
            display: inline-block;
            width: 20px;
            margin-right: 3px;
            line-height: 150%;
            border: 1px solid #ccc;
        }

        .Pager a {
            text-align: center;
            display: inline-block;
            width: 20px;
            border: 1px solid #ccc;
            color: #fff;
            color: #333;
            margin-right: 3px;
            line-height: 150%;
            text-decoration: none;
        }

        .highlight {
            background-color: #FFFFAF;
        }
    </style>
    <script src="1.8.3.jquery.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="contact">
        <div class="container">


            <div class="col-lg-10" style="margin-top: 15px; margin-left: 20px;">
                <div class="alert alert-info">
                    Show 
                    <asp:DropDownList ID="ddlShorting" Width="60px" Height="35px" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlShorting_SelectedIndexChanged">
                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="5" Text="5"></asp:ListItem>
                        <asp:ListItem Value="10" Text="10"></asp:ListItem>

                    </asp:DropDownList>entries.
           
                                      <div class="pull-right">
                                          Search:
                                          <asp:TextBox ID="txtSearch" runat="server" />
                                      </div>
                    <hr />
                    <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="false" OnRowCommand="gvStudents_RowCommand" OnRowEditing="gvStudents_RowEditing" OnRowDeleting="gvStudents_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr No" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-Width="150px" DataField="Name" HeaderText="Name" ItemStyle-CssClass="ContactName" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="FatherName" HeaderText="F Name" />
                            <asp:BoundField HeaderStyle-Width="250px" DataField="DOB" HeaderText="DOB" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="Mobile" HeaderText="Mobile" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="Email" HeaderText="Email" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="HighestEducation" HeaderText="Education" />
                            <%-- <asp:BoundField HeaderStyle-Width="250px" DataField="Id" HeaderText="Action" />--%>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>

                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Detail</asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to blok this record ?');"  CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Block</asp:LinkButton>
                  <%--<asp:LinkButton ID="lnkunblock" runat="server" CausesValidation="false" CommandName="unblock" OnClientClick="return confirm('Are you sure you want to unblok this record ?');"  CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Unblock</asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>


                        </Columns>
                    </asp:GridView>
                    <br />
                    <div class="Pager">
                    </div>

                    <br />
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

