<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reg_with_Image.aspx.cs" Inherits="TestTutorial101.Reg_with_Image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script language="javascript" type="text/javascript">
         function validate() {

             if (document.getElementById("<%=txtZip.ClientID%>").value == "") {
                 alert("Zip Code can't be blank");
                 document.getElementById("<%=txtZip.ClientID%>").focus();
                 return false;
             }
             var digits = "0123456789";
             var temp;
             for (var i = 0; i < document.getElementById("<%=txtZip.ClientID %>").value.length; i++) {
                 temp = document.getElementById("<%=txtZip.ClientID%>").value.substring(i, i + 1);
                 if (digits.indexOf(temp) == -1) {
                     alert("Please enter correct zip code");
                     document.getElementById("<%=txtZip.ClientID%>").focus();
                    return false;
                }
            }
            if (document.getElementById("<%=txtEmail.ClientID %>").value == "") {
                 alert("Email id can't be blank");
                 document.getElementById("<%=txtEmail.ClientID %>").focus();
                 return false;
             }
             var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
             var emailid = document.getElementById("<%=txtEmail.ClientID %>").value;
             var matchArray = emailid.match(emailPat);
             if (matchArray == null) {
                 alert("Your email address seems incorrect. Please try again.");
                 document.getElementById("<%=txtEmail.ClientID %>").focus();
                return false;
            }
            if (document.getElementById("<%=txtMobile.ClientID%>").value == "") {
                 alert("Phone/Mobile can't be blank");
                 document.getElementById("<%=txtMobile.ClientID%>").focus();
                 return false;
             }
             var digits = "0123456789";
             var temp;
             for (var i = 0; i < document.getElementById("<%=txtMobile.ClientID %>").value.length; i++) {
                 temp = document.getElementById("<%=txtMobile.ClientID%>").value.substring(i, i + 1);
                 if (digits.indexOf(temp) == -1) {
                     alert("Please enter correct Phone/Mobile");
                     document.getElementById("<%=txtMobile.ClientID%>").focus();
                    return false;
                }
            }

            return true;
        }
    </script>
     <script>
         var loadFile = function (event) {
             var output = document.getElementById('ImgShow');

             ImgShow.src = URL.createObjectURL(event.target.files[0]);

         };
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
        <ContentTemplate>
  
          
                       <table>
                           <tr>
                               <td>
                                    Name
                               </td>
                           </tr>
                       </table>
                           
                                   
                                    &nbsp; &nbsp; 
                                        <asp:TextBox ID="txtFistNm" runat="server"  placeholder="First Name" BackColor="LightYellow"></asp:TextBox>
                                           <asp:TextBox ID="txtMdlnm" runat="server"  placeholder="Middle Name" BackColor="LightYellow"></asp:TextBox>
                                         <asp:TextBox ID="txtLstNm" runat="server"  placeholder="Last Name" BackColor="LightYellow"></asp:TextBox>
                                        
            <br />
                                &nbsp; &nbsp;   Father's Name
                                          <asp:TextBox ID="txtFatherFN" runat="server" class="form-control" placeholder="First Name" BackColor="LightYellow"></asp:TextBox>
                                            <asp:TextBox ID="txtFatherMN" runat="server" class="form-control" placeholder="Middle Name" BackColor="LightYellow"></asp:TextBox>
                                            <asp:TextBox ID="txtFatherLM" runat="server" class="form-control" placeholder="Last Name" BackColor="LightYellow"></asp:TextBox>
                                       <br />
                                         Date Of Birth
                                        
                                           
                                           <asp:TextBox ID="txtDateofBirth" runat="server" TextMode="Date"   placeholder="Date Of Birth" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                          
                                           <br />

                                        Gender
                                        
                                         
                                             <asp:RadioButtonList ID="RBLGender" runat="server" RepeatDirection="Horizontal" CssClass="form-control" BackColor="LightYellow">
                                                 <asp:ListItem Value="0" >Male	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;</asp:ListItem>
                                                   <asp:ListItem Value="1" >Female &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;&nbsp;	&nbsp;	&nbsp;</asp:ListItem>
                                             </asp:RadioButtonList>
                                           <br />
                                       
                                      
                                         Aadhar Number
                                         <div class="form-group input-group ">
                                            <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                           <asp:TextBox ID="txtpan" runat="server" class="form-control"  placeholder="Pan Number" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                          <br />
                                       Designation
                                        
                                             <asp:DropDownList ID="ddlDesign" runat="server" CssClass="form-control" BackColor="LightYellow">
                                                 <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                 <asp:ListItem Value="Director" Text="Director"></asp:ListItem>
                                                 <asp:ListItem Value="Partner" Text="Partner"></asp:ListItem>
                                                 <asp:ListItem Value="Proprietor" Text="Proprietor"></asp:ListItem>
                                                 <asp:ListItem Value="authorised signatory" Text="authorised signatory"></asp:ListItem>
                                                 <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                             </asp:DropDownList>
                                           <br />
                                        Email
                                         
                                           <asp:TextBox ID="txtEmail" runat="server" class="form-control"  placeholder="Email ID" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         <br />
                                       Other
                                       
                                               <asp:TextBox ID="txtOtherDesign" runat="server" class="form-control"  placeholder="Other" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                           <br />
                                        Phone/ Mobile
                                       
                                           <asp:TextBox ID="txtMobile" runat="server" class="form-control"  placeholder="Mobile" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                          







         <br />
                                <h4>Address: </h4>
                                      <br />
                                      Flat/Door/BlockNo.
                                        
                                           <asp:TextBox ID="txtFlatBlok" runat="server" class="form-control"  placeholder="Flat/Door/BlockNo" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                          <br />
                                Name of premises/Building/ Village.
                                         
                                           <asp:TextBox ID="txtBuildingVill" runat="server" class="form-control"  placeholder="Premises/Building/ Village Name" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         <br />
                                      Road/Street/Lane.
                                          <br />
                                           <asp:TextBox ID="txtRoad" runat="server" class="form-control"  placeholder="Road/Street/Lane Name" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                           <br />
                                         Area/Locality.
                                         <br />
                                           <asp:TextBox ID="txtArea" runat="server" class="form-control"  placeholder="Area/Locality Name" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                           <br />
                                        Town/ City.
                                         <br />
                                           <asp:TextBox ID="txtDistrict" runat="server" class="form-control"  placeholder="Town/City Name" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                           <br />
                                        State.
                                        
                                           <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="true" TabIndex="3" BackColor="LightYellow"  OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select State</asp:ListItem>
                                        </asp:DropDownList>
                                         <br />
                                         District.
                                         <div class="form-group input-group ">
                                            <span class="input-group-addon"><i class="fa  fa-pencil"></i></span>
                                          <asp:DropDownList ID="ddlCity" runat="server" BackColor="LightYellow" TabIndex="4" CssClass="form-control">
                                            <asp:ListItem>Select District </asp:ListItem>
                                              </asp:DropDownList>
                                           <br />
                                         Pin Code.
                                         
                                           <asp:TextBox ID="txtZip" runat="server" class="form-control"  placeholder="Pin Code" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                          <br />
                                <asp:Label ID="lblLoginMg" runat="server" Style="color: red;"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                             <br />
                                
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block btn-flat" Text="Submit" OnClick="btnSubmit_Click"  OnClientClick="return validate()" />
                          <br />
               <br />
                                     <label> Signature Image</label>
                                                   <br />
                                                   <table>
                                                       <tr>
                                                           <td> <img id="ImgShow" src="images/No%20Image.jpg" style="height: 100px; width: 100px;" /></td>
                                                           <td> <asp:FileUpload ID="FileUpload1" runat="server" onchange="loadFile(event)" />
                                        <p style="white-space: nowrap;">Upload Signature (size max. 150 Kb and .png file only) </p></td>
                                                       </tr>
                                                   </table>
                                        

                              

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

                                 document.getElementById("<%=txtDateofBirth.ClientID%>").setAttribute("max", today);
                           
    </script>
                           
                        </div>
                    </div>
                     <!-- End Form Elements -->
                </div>
           
            </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
