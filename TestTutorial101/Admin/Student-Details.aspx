<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Student-Details.aspx.cs" Inherits="TestTutorial101.Admin.Student_Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script src="assets/plugins/jquery-1.10.2.js"></script>
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
       
    <div class="contact">
        <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSubmit" />
                </Triggers>
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-12">
                        
                            <div class="col-lg-10">
                                <asp:Label ID="lblApplyJob" runat="server" Text="" Font-Size="X-Large" ForeColor="Green"></asp:Label>
                                <!-- Form Elements -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h2> Personal Details </h2>
                                    </div>
                                   
                                    <div class="panel-body">
                                        
                                            <div class="col-lg-12">

                                                <div class="col-lg-12">
                                               <div class="col-lg-4">
                                                        Student ID
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtStudentId" runat="server" class="form-control" placeholder="StudentID" ReadOnly="true" ></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                       
                                                        <asp:HiddenField ID="HddnStudentID" runat="server" />
                                                    </div>

                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="col-lg-4">
                                                        Name
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        F/H Name
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtFatherName" runat="server" class="form-control" placeholder="Father's Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Nationality
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtNationality" runat="server" class="form-control" placeholder="Nationality" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Date Of Birth
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtDateofBirth" runat="server" TextMode="Date" class="form-control" placeholder="Date Of Birth" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Gender
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                                 <asp:DropDownList ID="DDLGender" runat="server" CssClass="form-control" BackColor="LightYellow">
                                                 <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                 <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                                
                                             </asp:DropDownList>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Aadhar Number
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtAadhar" runat="server" class="form-control" placeholder="Aadhar Number" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>



                                                    <div class="col-lg-4">
                                                        Email
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email ID" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Phone/ Mobile
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Mobile" TabIndex="0" BackColor="LightYellow" MaxLength="10"></asp:TextBox>
                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtMobile" FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Apply as
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:DropDownList ID="ddlDesign" runat="server" CssClass="form-control" BackColor="LightYellow">
                                                 <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                 <asp:ListItem Value="Assessor" Text="Assesor"></asp:ListItem>
                                                 <asp:ListItem Value="Student" Text="Student"></asp:ListItem>
                                                 <asp:ListItem Value="Other" Text="Other"></asp:ListItem>

                                             </asp:DropDownList>
                                         </div>
                                                    </div>

                                                </div>



                                                <div class="col-lg-12">

                                                    <div class="col-lg-4">
                                                        Highest Qualification
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:DropDownList ID="DDLqualification" runat="server" CssClass="form-control" BackColor="LightYellow">
                                                 <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                 <asp:ListItem Value="Assessor" Text="Post Graduation"></asp:ListItem>
                                                 <asp:ListItem Value="Student" Text="Graduate"></asp:ListItem>
                                                 <asp:ListItem Value="Other" Text="Diploma"></asp:ListItem>
                                                 <asp:ListItem Value="Other" Text="12th"></asp:ListItem>
                                                 <asp:ListItem Value="Other" Text="10th"></asp:ListItem>
                                                 <asp:ListItem Value="Other" Text="8th"></asp:ListItem>

                                             </asp:DropDownList>
                                         </div>
                                                    </div>
                                                      <div class="col-lg-4">
                                                        Passing Year
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                              <asp:DropDownList ID="DDLPasssing" runat="server" CssClass="form-control" BackColor="LightYellow">
                                                 <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                                

                                             </asp:DropDownList>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Other Qualification
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtOtherQualification" runat="server" class="form-control" placeholder="Other Qualification" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                  

                                                    <div class="col-lg-4">
                                                        Total Exeperience
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtTotalExperiance" runat="server" class="form-control" placeholder="In Years" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-8">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-12">
                                                <div class="col-lg-12">
                                                    <div class="col-lg-12">
                                                        <h4>Address: </h4>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="col-lg-12">

                                                        <div class="form-group input-group ">
                                                            <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                                                            <asp:TextBox ID="txtFlatBlok" runat="server" class="form-control" placeholder="Flat/Door/BlockNo" TabIndex="0" TextMode="MultiLine" BackColor="LightYellow"></asp:TextBox>
                                                        </div>
                                                    </div>




                                                    <div class="col-lg-4">
                                                        State.
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-arrow-down"></i></span>
                                             <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="true" TabIndex="3" BackColor="LightYellow" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                             </asp:DropDownList>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        District.
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa  fa-pencil"></i></span>
                                             <asp:DropDownList ID="ddlCity" runat="server" BackColor="LightYellow" TabIndex="4" CssClass="form-control">
                                             </asp:DropDownList>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        Pin Code.
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtZip" runat="server" class="form-control" placeholder="Pin Code" TabIndex="0" BackColor="LightYellow" MaxLength="6"></asp:TextBox>
                                             <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtZip" FilterType="Custom, Numbers"></cc1:FilteredTextBoxExtender>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-6">

                                                        <asp:Label ID="lblUploadedFile" runat="server" Text=""></asp:Label>
                                                        <asp:HiddenField ID="HddnFileUrl" runat="server" />
                                                        <div class="form-group">
                                                        </div>

                                                    </div>
                                                    <div class="col-lg-6">


                                                        <div class="form-group">
                                                            <%--Documents Upload
                                                   <br />
                                                            <table>
                                                                <tr>

                                                                    <td>
                                                                        <asp:FileUpload ID="FileUpload2" runat="server" onchange="loadFile(event)" />
                                                                        <p style="white-space: nowrap;">Upload Document (size max. 150 Kb and .pdf file only) </p>
                                                                    </td>
                                                                </tr>
                                                            </table>--%>

                                                            
                                                            Resume Upload
                                                   <br />
                                                            <table>
                                                                <tr>

                                                                    <td>
                                                                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="loadFile(event)" />
                                                                        <p style="white-space: nowrap;">Upload resume (size max. 2 MB and .Doc file only) </p>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6" style="display: none;">
                                                <div class="form-group has-feedback">
                                                    <asp:Label ID="lblLoginMg" runat="server" Style="color: red;"></asp:Label>
                                                </div>
                                                <div class="form-group has-feedback">
                                                    <asp:Button ID="BtnEdit" runat="server" class="btn btn-primary btn-block btn-flat" Text="Edit" Visible="false" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group has-feedback">
                                                    <asp:Label ID="Label1" runat="server" Style="color: red;"></asp:Label>
                                                </div>
                                                </div>
                                                 <div class="col-md-4">
                                                <div class="form-group has-feedback">

                                                    <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary btn-block btn-flat" Text="Save" OnClick="btnSubmit_Click" OnClientClick="return validate()" />
                                                    
                                                </div>
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
                            </div>
                            <div class="col-lg-1"></div>

                        </div>
                        <!-- End Form Elements -->
                    </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
