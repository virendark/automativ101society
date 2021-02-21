<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="TestTutorial101.Registration" %>

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

            if (document.getElementById("<%=txtName.ClientID %>").value == "") {
                alert("User name can't be blank");
                document.getElementById("<%=txtName.ClientID %>").focus();
                  return false;
              }
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

             if (document.getElementById("<%=txtmobile.ClientID %>").value == "") {
                alert("Mobile No. can't be blank");
                document.getElementById("<%=txtmobile.ClientID %>").focus();
                  return false;
              }
              else if (document.getElementById("<%=txtmobile.ClientID %>").value.length != 10) {
                 alert("Please enter correct Mobile Number.");
                 document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
        var digits = "0123456789";
        var temp;
        for (var i = 0; i < document.getElementById("<%=txtmobile.ClientID %>").value.length; i++) {
            temp = document.getElementById("<%=txtmobile.ClientID%>").value.substring(i, i + 1);
            if (digits.indexOf(temp) == -1) {
                alert("Please enter correct Phone/Mobile");
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                      return false;
                  }
              }

              if (document.getElementById("<%=txtRegisPassword.ClientID %>").value == "") {
                alert("Password can't be blank");
                document.getElementById("<%=txtRegisPassword.ClientID %>").focus();
                  return false;
              }
              else if (document.getElementById("<%=txtRegisPassword.ClientID %>").value.length != 6) {
                alert("Please enter must be 6 - 10 characters.");
                document.getElementById("<%=txtRegisPassword.ClientID%>").focus();
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
                        <div class="media-body ">
                            <h3 class="media-heading">Registration...</h3>
                            <section>
                                <div>
                                    <label>&nbsp;&nbsp;&nbsp;  Already Registered  Cadidates  <a href="Login.aspx">Login here..</a> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </label>
                                    <br />
                                </div>
                                <div class=" col-sm-6 col-md-10 modal-body">

                                    <div>
                                        <label>User Name :</label>
                                        <input type="text" id="txtName" class="form-control" runat="server" />

                                    </div>
                                    <div>
                                        <label>Email :</label>
                                        <input type="text" id="txtEmail" class="form-control" runat="server" />

                                    </div>
                                    <div>
                                        <label>Mobile :</label>
                                        <input type="text" id="txtmobile" class="form-control" onkeypress="javascript:return isNumber(event)" maxlength="10" runat="server" />
                                    </div>
                                    <div>
                                        <label>Password:</label>
                                        <input id="txtRegisPassword" type="password" class="form-control" maxlength="10" runat="server" />

                                    </div>
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-lg" Text="Submit" OnClientClick=" return validateReg()" OnClick="btnSubmit_Click" />
                                        <div>
                                            <i>
                                                <asp:Label ID="lblRegisMsg" runat="server" Text=""></asp:Label></i>

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
