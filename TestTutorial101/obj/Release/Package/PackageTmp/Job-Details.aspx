<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Job-Details.aspx.cs" Inherits="TestTutorial101.Job_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <style>
        .form-control {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <section id="services" class="service-item">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2></h2>


            </div>

            <div class="row">

                <div class="col-sm-12 col-md-12">
                    <div class="media services-wrap wow fadeInDown">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnSubmit" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="media-body">
                                    <h3 class="media-heading">Add Authorised Signatory...</h3>
                                    <section>
                                        <div class="modal-body">

                                            <div class="col-lg-12">
                                                <div class="col-lg-4">
                                                    Job Title
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="First Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    Job Desc
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="First Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    Job Desc
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="First Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="col-lg-6">
                                                    Job Title
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtFistNm" runat="server" class="form-control" placeholder="First Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    Job Desc
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtFatherFN" runat="server" class="form-control" placeholder="First Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="col-lg-6">
                                                    Company Name
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtDateofBirth" runat="server" TextMode="Date" class="form-control" placeholder="Date Of Birth" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="col-lg-6">
                                                    Remarks
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email ID" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    Phone/ Mobile
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Mobile" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>


                                            </div>
                                            <div class="col-lg-12">
                                                <div class="col-lg-6">
                                                    Aadhar Number
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtAdhar" runat="server" class="form-control" placeholder="Pan Number" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>
                                                <div class="col-lg-6">
                                                    Apply 
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:DropDownList ID="ddlDesign" runat="server" CssClass="form-control" BackColor="LightYellow">
                                                 <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                 <asp:ListItem Value="Director" Text="Director"></asp:ListItem>
                                                 <asp:ListItem Value="Partner" Text="Partner"></asp:ListItem>
                                                 <asp:ListItem Value="Proprietor" Text="Proprietor"></asp:ListItem>
                                                 <asp:ListItem Value="authorised signatory" Text="authorised signatory"></asp:ListItem>
                                                 <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                             </asp:DropDownList>
                                         </div>
                                                </div>
                                            </div>


                                            <div class="col-lg-12">
                                                <div class="col-lg-6">
                                                    Highest Qualification
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtOtherDesign" runat="server" class="form-control" placeholder="" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                </div>

                                            </div>
                                            <div class="col-lg-12">
                                            </div>
                                            <div class="row">

                                                <div class="col-lg-12">
                                                    <div class="col-lg-12">
                                                        <div class="col-lg-12">
                                                            <h4>Address: </h4>
                                                        </div>
                                                    </div>

                                                    <div class="col-lg-8">
                                                        <div class="col-lg-12">

                                                            <div class="form-group input-group ">
                                                                <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                                                                <asp:TextBox ID="txtFlatBlok" runat="server" class="form-control" placeholder="Flat/Door/BlockNo" TabIndex="0" TextMode="MultiLine" BackColor="LightYellow"></asp:TextBox>
                                                            </div>
                                                        </div>




                                                        <div class="col-lg-6">
                                                            State.
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-arrow-down"></i></span>
                                             <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="true" TabIndex="3" BackColor="LightYellow">
                                                 <asp:ListItem Value="0">Select State</asp:ListItem>
                                             </asp:DropDownList>
                                         </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            District.
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa  fa-pencil"></i></span>
                                             <asp:DropDownList ID="ddlCity" runat="server" BackColor="LightYellow" TabIndex="4" CssClass="form-control">
                                                 <asp:ListItem>Select District </asp:ListItem>
                                             </asp:DropDownList>
                                         </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            Pin Code.
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtZip" runat="server" class="form-control" placeholder="Pin Code" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                        </div>
                                                        <div class="col-lg-6">


                                                            <div class="form-group">
                                                                Resume Upload
                                                   <br />
                                                                <table>
                                                                    <tr>

                                                                        <td>
                                                                            <asp:FileUpload ID="FileUpload1" runat="server" onchange="loadFile(event)" />
                                                                            <p style="white-space: nowrap;">Upload Signature (size max. 150 Kb and .png file only) </p>
                                                                        </td>
                                                                    </tr>
                                                                </table>



                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="form-group has-feedback">
                                                        <asp:Label ID="lblLoginMg" runat="server" Style="color: red;"></asp:Label>
                                                    </div>
                                                    <div class="form-group has-feedback">

                                                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block btn-flat" Text="Submit" OnClientClick="return validate()" />
                                                    </div>
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

                                                document.getElementById("<%=txtDateofBirth.ClientID%>").setAttribute("max", today);
                           
                                            </script>
                                            <%--  <div>
                            <label>Password:</label>
                            <input type="password" id="txtPassword"  class="form-control" runat="server" />
                           <br />
						</div>--%>
                                            <br />
                                            <hr style="height: 2px; background-color: #428bca;" />
                                            <div class="table-responsive">

                                                <asp:Repeater ID="rptrCustomer" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                            <thead>
                                                                <tr>
                                                                    <th style="text-align: center; width: 50px;">S.No</th>
                                                                    <th style="text-align: center;">Name</th>
                                                                    <th style="text-align: center;">Email</th>
                                                                    <th style="text-align: center;">Phone/Mobile</th>
                                                                    <th style="text-align: center;">Designation</th>
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
                                                                <%# DataBinder.Eval(Container.DataItem, "Name")%>
                                                            </td>
                                                            <td style="text-align: center;">
                                                                <%# DataBinder.Eval(Container.DataItem, "Email")%>
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem, "Mobile")%>
                                                            </td>
                                                            <td style="text-align: center;">
                                                                <%# DataBinder.Eval(Container.DataItem, "DesgID")%>
                                                            </td>
                                                        </tr>

                                                    </ItemTemplate>
                                                    <FooterTemplate></tbody></table></FooterTemplate>
                                                </asp:Repeater>



                                            </div>
                                        </div>



                                    </section>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>


            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>

    <br />
    <br />
    <br />
</asp:Content>
