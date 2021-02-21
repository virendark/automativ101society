<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="TestTutorial101.Admin.Events" %>
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

      <div class="contact">
        <div class="container">

            <div class="row">
                        <div class="col-lg-12">
                          
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
                                                  <div class="col-md-3">
                                                <div class="form-group has-feedback">

                                                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block btn-flat" Text="Save" TabIndex="4"  OnClick="btnSubmit_Click" OnClientClick="return validateReg()" />
                                                   
                                                </div>
                                                      
                                                </div>
                                             <div class="col-md-3">
                                                <div class="form-group has-feedback">

                                                     <asp:Button ID="btnCancel" runat="server" class="btn btn-primary btn-block btn-flat" Text="Cancel" TabIndex="5"  OnClick="btnCancel_Click"  />
                                                    
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
                                    
                                   
                                </div>
                            </div>
                            <div class="col-lg-1"></div>
            </div>
          </div>
</asp:Content>
