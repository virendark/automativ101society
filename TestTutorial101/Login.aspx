<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TestTutorial101.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        function validateReg() {

            if (document.getElementById("<%=txtUserName.ClientID %>").value == "") {
                  alert("User name can't be blank");
                  document.getElementById("<%=txtUserName.ClientID %>").focus();
                  return false;
              }
            if (document.getElementById("<%=txtPassword.ClientID %>").value == "") {
                  alert("Password can't be blank");
                  document.getElementById("<%=txtPassword.ClientID %>").focus();
                  return false;
              }
             <%-- else if (document.getElementById("<%=txtPassword.ClientID %>").value.length != 6) {
                  alert("Please enter must be 6 - 10 characters.");
                  document.getElementById("<%=txtPassword.ClientID%>").focus();
                  return false;
              }--%>




          return true;
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%--  <div class="w3layouts-banner-1">        
    </div>--%>

    <section id="services" class="service-item">
	   <div class="container">
            <div class="center wow fadeInDown">
                <h2></h2>
           
           
                 </div>

            <div class="row">

                <div class="col-sm-8 col-md-8" >
                    <div class="media services-wrap wow fadeInDown" style="height: 400px">
                        <div class="pull-left">
                          
                            <img class="img-responsive" src="images/services/services1.png">
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Login...</h3>
                            		<section>
					<div class="modal-body">
                 
						<div>
                            <label>User Name :</label>
                            <input type="text" id="txtUserName" class="form-control" runat="server" />
                            <br />
						</div>
                        <div>
                            <label>Password:</label>
                            <input type="password" id="txtPassword"  maxlength="14" style=" font-size:x-large;" class="form-control" runat="server" />
                           <br />
						</div>
                        <div class="col-lg-12">
                        <asp:Button ID="BtnSubmit" runat="server" Text="Sign In" CssClass="btn btn-primary btn-lg pull-left" OnClick="BtnSubmit_Click" OnClientClick=" return validateReg()" />

                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pull-right" OnClick="LinkButton1_Click">Forgot Password</asp:LinkButton>
                            <div class="col-lg-12">
							<i> <asp:Label ID="lblLoginMg" runat="server" Text=""></asp:Label></i>
                                <br />
                      
                            </div>
					</div>
                            </div>
                        <div>
                              <label>&nbsp;&nbsp;&nbsp; Don't have an account?  <a href="Registration.aspx">Register now</a></label><br />
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


                                                          
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#services-->

  <br />
    <br />
    <br />
</asp:Content>
