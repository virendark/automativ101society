<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPasswaord.aspx.cs" Inherits="TestTutorial101.ForgotPasswaord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script language="javascript" type="text/javascript">
         function validateReg() {

            if (document.getElementById("<%=txtEmail.ClientID %>").value == "") {
                alert("Email id can't be blank");
                document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }
            var emailPat = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            //var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
            var emailid = document.getElementById("<%=txtEmail.ClientID %>").value;
              var matchArray = emailid.match(emailPat);
              if (matchArray == null) {
                  alert("Your email address seems incorrect. Please try again.");
                  document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }
        return true;
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                        <div class="media-body ">
                            <h3 class="media-heading">Forgot Password...</h3>
                            <section>
                                <div>
                                    <label>&nbsp;&nbsp;&nbsp;  Already Registered  Cadidates  <a href="Login.aspx">Login here..</a> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </label>
                                    <br />
                                </div>
                                <div class=" col-sm-6 col-md-10 modal-body">
                                     <div class="box-authentication">
                     
                        <asp:Label ID="lblRegisMsg" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label><br />
                        <label for="emmail_register">Email</label>
                         <asp:RequiredFieldValidator ID="Req_Email" runat="server" ControlToValidate="txtEmail"  ForeColor="Red" Font-Size="X-Large" ErrorMessage="*" ValidationGroup="Email_forgot_Val" Display="Dynamic"  ></asp:RequiredFieldValidator>
                         <div>
                           <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ValidationGroup="Email_forgot_Val" ValidationExpression="^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ErrorMessage="Please enter valid Email ID"></asp:RegularExpressionValidator>
                             
                              </div>
                       
                        <br />

                                            <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block btn-flat" Text="Forget Password" TabIndex="4" OnClientClick=" return validateReg()"  OnClick="btnForget_Click"  />
<%--<asp:LinkButton ID="btnForget" runat="server" CssClass="button" OnClick="btnForget_Click" ValidationGroup="Email_forgot_Val"><i class="fa fa-user"></i> </asp:LinkButton>--%>
                    </div>
        

                                    <br />
                              
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








     <div>
         
    </div>
</asp:Content>
