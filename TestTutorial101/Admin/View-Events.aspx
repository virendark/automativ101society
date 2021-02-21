<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="View-Events.aspx.cs" Inherits="TestTutorial101.Admin.View_Events" %>
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
   
    <style>
        .form-control {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="contact">
        <div class="container">
           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSubmit" />
                </Triggers>
                <ContentTemplate>--%>
                    <div class="row">
                        <div class="col-lg-12">
                                    <br />
                                    <div class="table-responsive container ">
                                        <asp:Repeater ID="rptrCustomer" runat="server">
                                            <HeaderTemplate>
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>                                                   
                                                        <tr>
                                                            <th style="text-align: center; width: 5%;">S.No</th>
                                                            <th style="text-align: center; width: 40%;">Title</th>
                                                            <th style="text-align: center; width: 10%;">To Date</th>
                                                            <th style="text-align: center; width: 20%;">Remarks</th>    
                                                            <th style="text-align: center; width: 10%;" colspan="2">Action</th>                                                         
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>

                                                <tr>
                                                    <td style="text-align: center;">
                                                        <%#Container.ItemIndex + 1 %>
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <%# DataBinder.Eval(Container.DataItem, "ToDate")%>
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem, "Remarks")%>
                                                    </td>
                                                    <td>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="edit" OnClick="lnkEdit_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Edit</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false"  CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this record ?');"  OnClick="lnkDelete_Click" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Delete</asp:LinkButton>

                                                    </td>                                                    
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate></tbody></table></FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-1"></div>

                        </div>
                        <!-- End Form Elements -->
                    </div>
                  
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
    
</asp:Content>
