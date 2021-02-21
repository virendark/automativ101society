<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="TestTutorial101.Events" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        function validateReg() {

            if (document.getElementById("<%=txtName.ClientID %>").value == "") {
                  alert("Title can't be blank");
                  document.getElementById("<%=txtName.ClientID %>").focus();
                  return false;
              }
             
                if (document.getElementById("<%=txtFromDate.ClientID %>").value == "") {
                      alert("From Date can't be blank");
                      document.getElementById("<%=txtFromDate.ClientID %>").focus();
                    return false;
                }
            if (document.getElementById("<%=txtToDate.ClientID %>").value == "") {
                alert("To Date can't be blank");
                document.getElementById("<%=txtToDate.ClientID %>").focus();
                  return false;
              }
          return true;
      }
    </script>

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
         <div class="w3layouts-banner-1">       
    </div>
    <div class="contact">
        <div class="container">
           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSubmit" />
                </Triggers>
                <ContentTemplate>--%>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                                <!-- Form Elements -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h2> Event Details </h2>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                 <div class="col-lg-6">
                                                        Event Title
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Title" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">                                                                                                    
                                                                                               
                                                    <div class="col-lg-3">
                                                       From Date
                                         <div class="form-group input-group ">

                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <input type="date" id="txtFromDate" runat="server" class="form-control"  tabindex="1"/>
                                             <%--<asp:TextBox ID="txtDatefrom" runat="server" TextMode="Date" class="form-control" placeholder="Date Of Birth" TabIndex="2" BackColor="LightYellow"></asp:TextBox>--%>
                                         </div>
                                                    </div>

                                                    <div class="col-lg-3">
                                                       To Date
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                        <input type="date" id="txtToDate" runat="server" class="form-control"  tabindex="2"/>
                                             <%--<asp:TextBox ID="txtDateTo" runat="server" TextMode="Date" class="form-control" placeholder="Date Of Birth" TabIndex="1" BackColor="LightYellow"></asp:TextBox>--%>
                                         </div>
                                                    </div> 
                                                     <div class="col-lg-6">
                                                         <asp:HiddenField ID="HddnEventID" runat="server" />
                                                     </div>
                                                    </div>
                                                      <div class="col-lg-12">
                                                    <div class="col-lg-6">
                                                      Remarks
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtRemarks" runat="server" class="form-control" placeholder="Remarks" TabIndex="3" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div><div class="col-lg-6"></div>                                    
                                                          </div>                                                  
                                                 <div class="col-md-12">
                                                <div class="form-group has-feedback">
                                                    <asp:Label ID="Label1" runat="server" Style="color: red;"></asp:Label>
                                                </div>
                                                </div>
                                                  <div class="col-md-4">
                                                <div class="form-group has-feedback">

                                                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block btn-flat" Text="Save" TabIndex="4"  OnClick="btnSubmit_Click" OnClientClick="return validateReg()" />
                                                    
                                                </div>
                                            </div>
                                                </div>


                                            </div>
                                        </div>
                                        <div class="row">

                                          

                                         
                                           
                                           
                                        </div>
                                    </div>
                                    <div class="row">
                                    </div>

                                    <script>
                                        var today = new Date();
                                        var dd = today.getDate();
                                        var mm = today.getMonth() + 1; //January is 0!
                                        var yyyy = today.getFullYear();
                                        if (dd < 10) {
                                            dd = '0' + dd
                                        }
                                        if (mm < 10) {
                                            mm = '0' + mm
                                        }

                                        today = yyyy + '-' + mm + '-' + dd;

                                        document.getElementById("<%=txtFromDate.ClientID%>").setAttribute("max", today);
                                        document.getElementById("<%=txtToDate.ClientID%>").setAttribute("min", today);
                                    </script>
                                    <br />
                                    <hr style="height: 2px; background-color: #428bca;" />
                                    <div class="table-responsive container ">
                                        <asp:Repeater ID="rptrCustomer" runat="server">
                                            <HeaderTemplate>
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                       <%-- <tr>
                                                           <td >Show</td><td>
                                                               <asp:DropDownList ID="ddlShow" runat="server">

                                                                   <asp:ListItem>10</asp:ListItem>
                                                                    <asp:ListItem>20</asp:ListItem>
                                                                    <asp:ListItem>50</asp:ListItem>
                                                               </asp:DropDownList></td> 
                                                            <td></td>
                                                            <td  class="pull-right"   >
                                                                <span>   Search <input type ="text" runat="server" id="txtsearch" /><asp:Button ID="Button1" runat="server" Text="Search" /></span> 
                                                            </td>                                             
                                                        </tr>--%>
                                                        <tr>
                                                            <th style="text-align: center; width: 5%;">S.No</th>
                                                            <th style="text-align: center; width: 60%;">Title</th>
                                                            <th style="text-align: center; width: 10%;">To Date</th>
                                                            <th style="text-align: center; width: 25%;">Remarks</th>    
                                                            <th style="text-align: center; width: 25%;" colspan="2">Action</th>                                                         
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
                    </div>
                <%--</ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
    </div>
     
    <%--<div class="contact">
        <div class="container">


            <div class="col-lg-12" style="margin-top: 15px; margin-left: 20px;">
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
                    <asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="false" OnRowCommand="gvEvents_RowCommand"  >
                        <Columns>
                            <asp:TemplateField HeaderText="Sr No" HeaderStyle-Width="5%" HeaderStyle-HorizontalAlign="Left">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderStyle-Width="450px" DataField="Title" HeaderText="Title" ItemStyle-CssClass="ContactName" />
                            <asp:BoundField HeaderStyle-Width="150px" DataField="ToDate" HeaderText="To Date" />
                            <asp:BoundField HeaderStyle-Width="250px" DataField="Remarks" HeaderText="Remarks" />
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="false" CommandName="edit" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="false" CommandName="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "Id") %>'>Delete</asp:LinkButton>

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
    </div>--%>
</asp:Content>
