<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="TestTutorial101.ContactUs" %>
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

             if (document.getElementById("<%=txtMobile.ClientID %>").value == "") {
                  alert("Mobile No. can't be blank");
                  document.getElementById("<%=txtMobile.ClientID %>").focus();
                return false;
            }
            else if (document.getElementById("<%=txtMobile.ClientID %>").value.length != 10) {
                alert("Please enter correct Mobile Number.");
                document.getElementById("<%=txtMobile.ClientID%>").focus();
                return false;
            }
       
            if (document.getElementById("<%=txtMessage.ClientID %>").value == "") {
                  alert("Message can't be blank");
                  document.getElementById("<%=txtMessage.ClientID %>").focus();
                  return false;
              }
             



          return true;
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
   <%--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3500.295396144258!2d77.4177665329999!3d28.68080898239885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cf053c75d557f%3A0x392c04da45a4dda6!2sS+P.+Nayyar+-+Automotive+101+Society!5e0!3m2!1sen!2sin!4v1517650155917" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>--%>
    
 <style>
     p{font-size:medium;}
 </style>
    
     <div class="w3layouts-banner-1">       
    </div>
     <section id="contact-page">
        <div class="container">
            <div class="center">   
                <br />
                <br />     
                <h2>Contact Us</h2>
                <p class="lead">CSR ACT FOR SOCIETY, BUILT FUTURE FOR SOCIETY.</p>
                <p class="lead">SCRAPING OF VEHICLE.</p>
            </div> 
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
              
                        
                        
                       
                   
                        
                    <div class="col-sm-6 col-sm-offset-1">
                        <div class="form-group">
                            <label>Name *</label>
                             <input type="text" name="Name" placeholder="Name" id="txtName" class="form-control" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Email *</label>
                           <input type="text" class="form-control" name="Email" placeholder="Email" id="txtEmail"  runat="server" required=""/>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                           <input type="text" name="Phone no" placeholder="Phone" id="txtMobile" onkeypress="javascript:return isNumber(event)" maxlength="10" class="form-control" runat="server" required=""/>
                        </div>
                       
                        <div class="form-group">
                            <label>Message *</label>
                            <textarea name="message" id="txtMessage" runat="server" required="required" class="form-control" placeholder="Write Message ..." rows="8"></textarea>
                        </div>
                         <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>                        
                        <div class="form-group">
                            <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg" OnClientClick=" return validateReg()" OnClick="Submit_Click" />
                        </div>                     
                    </div>
                    <div class="col-sm-5">
                           <div class="address">
                        <h2>Address:</h2>
                        <p><i class="glyphicon glyphicon-home"></i>     Registered Office: 29, Indira Market, Mayur Vihar Phase-I, <br />New Delhi-110092 </p>
                        <p><i class="glyphicon glyphicon-home"></i>     Scrap Center: PLOT NO 790/8178B, 816C VILLAGE BISRAKH, GREATER NOIDA, UP </p>
                    </div>
                    <div class="address address-mdl">
                        <h2>Phones:</h2>
                        <p><i class="glyphicon glyphicon-earphone"></i>+91-9891220966</p>
                        <p><i class="glyphicon glyphicon-phone"></i>+91 7042482220</p>
                    </div>
                    <div class="address">
                        <h2>Email:</h2>
                        <p><i class="glyphicon glyphicon-envelope"></i><a href="mailto:support@automotive101society.com">     support@automotive101society.com</a></p>
                    </div>
                    </div>
               
            </div><!--/.row-->
        </div><!--/.container-->
    </section><!--/#contact-page-->
    <div class="container">
    <div class="map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3500.295396144258!2d77.4177665329999!3d28.68080898239885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cf053c75d557f%3A0x392c04da45a4dda6!2sS+P.+Nayyar+-+Automotive+101+Society!5e0!3m2!1sen!2sin!4v1517650155917" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
	</div></div>

   

    <!-- contact -->
   
</asp:Content>
