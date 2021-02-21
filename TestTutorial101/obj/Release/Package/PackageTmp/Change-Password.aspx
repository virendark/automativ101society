<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Change-Password.aspx.cs" Inherits="TestTutorial101.Change_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script>
       // WRITE THE VALIDATION SCRIPT IN THE HEAD TAG.
       function isNumber(evt) {
           var iKeyCode = (evt.which) ? evt.which : evt.keyCode
           if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
               return false;

           return true;
       }
    </script>
    <script language="javascript" type="text/javascript">
        function validateReg() {

            if (document.getElementById("<%=txtOldPassword.ClientID %>").value == "") {
                alert("Please Enter Old Password !");
                document.getElementById("<%=txtOldPassword.ClientID %>").focus();
                return false;
            }
           
            if (document.getElementById("<%=txtpass.ClientID %>").value == "") {
                alert("Please Enter New Password !");
                document.getElementById("<%=txtpass.ClientID %>").focus();
                return false;
            }
            else if(document.getElementById("<%=txtpass.ClientID %>").value.length <= 5) {
                alert("Please enter must be 6 - 10 characters.");
                document.getElementById("<%=txtpass.ClientID%>").focus();
                  return false;
              }
            else if (document.getElementById("<%=txtConfirmPass.ClientID %>").value.length == "") {
                alert("Please Enter Confirm Password !");
                 document.getElementById("<%=txtConfirmPass.ClientID%>").focus();
                 return false;
            }
           
         
            

      
          




        return true;
    }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- <div class="w3layouts-banner-1">
    </div>--%>
    <section id="services" class="service-item">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2></h2>
            </div>

            <div class="row">

                <div class="col-sm-8 col-md-8">
                    <div class="media services-wrap wow fadeInDown">
                        <div class=" pull-left">
                            <img class="img-responsive" src="images/services/services1.png">
                        </div>
                        <div class="media-body" style="width:400px">
                            <h3 class="media-heading">Change Password...</h3>
                            <section>
                               
                                <div class=" col-sm-6 col-md-10 modal-body">

                                    <div>
                                        <label>Old Password :</label>
                                        <input type="password" id="txtOldPassword" class="form-control" runat="server" />

                                    </div>
                                    <div>
                                        <label>New Password :</label>
                                        <input type="password" id="txtpass" class="form-control" runat="server" maxlength="10"/>

                                    </div>
                                    <div>
                                        <label>Confirm Password :</label>
                                        <input type="password" id="txtConfirmPass" class="form-control"  maxlength="10" runat="server" />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtConfirmPass" ControlToCompare="txtpass" 
                                            ErrorMessage="Don't Match Password!" ForeColor="Red" Display="Dynamic" ValidationGroup="chng"></asp:CompareValidator>
                                          </div>
                                   
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-lg" Text="Submit" OnClientClick=" return validateReg()" OnClick="btnSubmit_Click" ValidationGroup="chng" />
                                        <div>
                                            <i>
                                                <asp:Label ID="lblChangePass" runat="server" Text=""></asp:Label></i>
                                        </div>
                                    </div>
                                </div>



                            </section>
                        </div>
                    </div>
                </div>
   <div class="col-sm-5 col-md-4">
                    <div class="media services-wrap wow fadeInDown">
                        <%--<div class="pull-left">
                            <img class="img-responsive" src="images/services/services1.png">
                        </div>--%>
                        <div style="height: 400px">
                            <h3 class="media-heading">Events And News ...</h3>

                            <div class="col-lg-12">
                                <marquee direction="up" behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();" height="300px">        
                               
                                   <div class="bs-docs-example">
                                       <ul style="list-style:none; margin-left:-25px;">
                                      <asp:Repeater ID="rptNews" runat="server"  >
                                    <HeaderTemplate></HeaderTemplate>
                                          <ItemTemplate>
                                              <li>
                                                    <%# DataBinder.Eval(Container.DataItem, "Title")%>
                                              </li>
                                          </ItemTemplate>
                               <%-- <table class="table table-striped table-bordered table-hover" id="dataTables-example"><thead>
                                    
                                    </thead><tbody></HeaderTemplate>
                                    <ItemTemplate>
                            <tr>
                            <td colspan="4">
                               <p class="navbar-left">
                                
                               </p> 
                            </td>
                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate> </tbody></table>

                                    </FooterTemplate>--%>
                                </asp:Repeater></ul>
			</div>
                                  
                                             </marquee>

                                <!-- Form Elements -->

                            </div>
                        </div>
                    </div>
                </div>




            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
    <br />
    <br />

</asp:Content>
