<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="TestTutorial101.CustomerDetails" %>
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
        .alert-info {
                 color: #333;
                 background-color: rgb(242 242 240 / 1);
                 border-color: hsl(50deg 81% 94% / 96%);
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
                    <asp:DropDownList ID="ddlShorting" Width="60px" Height="35px" runat="server" AutoPostBack="false">
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
                    <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr No" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-Width="150px" DataField="ownName" HeaderText="Name" ItemStyle-CssClass="ContactName" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="vehicleNo" HeaderText="Vehicle No" />
                            <asp:BoundField HeaderStyle-Width="250px" DataField="registrationYear" HeaderText="Registration Year" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="phoneNo" HeaderText="Mobile No" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="email" HeaderText="Email" />
                            

                           <%-- <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>

                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Detail</asp:LinkButton>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to blok this record ?');"  CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Block</asp:LinkButton>
             
                                </ItemTemplate>
                            </asp:TemplateField>--%>


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
