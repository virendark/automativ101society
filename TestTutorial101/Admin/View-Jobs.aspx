<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="View-Jobs.aspx.cs" Inherits="TestTutorial101.Admin.View_Jobs" %>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="contact">
        <div class="container">

            <div class="col-lg-10" style="margin-top: 15px; margin-left: 20px;">
                
            <h2>All Jobs</h2>
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
                                          <asp:Button ID="Button1" runat="server" Text="Search" />
                                      </div>
                    <hr />
                    <asp:GridView ID="gvJobs" runat="server" AutoGenerateColumns="false" OnRowCommand="gvJobs_RowCommand" OnRowDeleting="gvJobs_RowDeleting" >
                        <Columns>
                            <asp:TemplateField HeaderText="Sr No" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-Width="150px" DataField="jobTitle" HeaderText="Title" ItemStyle-CssClass="ContactName" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="CompnayName" HeaderText="Company Name" />
                          <asp:BoundField HeaderStyle-Width="250px" DataField="HRName" HeaderText="HR Name" />
                             <asp:BoundField HeaderStyle-Width="150px" DataField="HRContactNo" HeaderText="HR Contact No." />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="InterViewFromDate"   HeaderText="From Date" />
                           <%--  <asp:BoundField HeaderStyle-Width="150px" DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="HighestEducation" HeaderText="Education" />--%>
                            <%-- <asp:BoundField HeaderStyle-Width="250px" DataField="Id" HeaderText="Action" />--%>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>

                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "AutoID") %>'>Edit</asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this record ?');"  CommandArgument='<%# DataBinder.Eval(Container.DataItem, "AutoID") %>'>Delete</asp:LinkButton>

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
