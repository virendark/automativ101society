<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="TestTutorial101.Jobs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="assets/plugins/jquery-1.10.2.js"></script>
 <%--   <script language="javascript" type="text/javascript">
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
    </script>--%>
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
         <div class="w3layouts-banner-1">       
    </div>
    <div class="contact">
        <div class="container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSubmit" />
                </Triggers>
                <ContentTemplate>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-1"></div>
                            <div class="col-lg-10">
                                <!-- Form Elements -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                    <h2> Job Details </h2>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">


                                            <div class="col-lg-12">

                                                <div class="col-lg-12">
                                                 <%--   Personal Details--%>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="col-lg-6">
                                                        Job Title
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtJobTitle" runat="server" class="form-control" placeholder="Job Title" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                       Company Name
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtCompantName" runat="server" class="form-control" placeholder="Company Name" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        Job Description
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtJobDesc" runat="server" class="form-control" TextMode="MultiLine"  placeholder="Description" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    
                                                    <div class="col-lg-12">
                                                        Company Description
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtcompnyDesc" runat="server"  class="form-control" TextMode="MultiLine" placeholder=" Company Description" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                       InterView Date From
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtDateFrom" runat="server" class="form-control" TextMode="Date" placeholder="Date" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        InterView Date To
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                              <asp:TextBox ID="txtInterviewDateTo" runat="server"  TextMode="Date" class="form-control" placeholder=" Date" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>

                                                              <div class="col-lg-4">
                                                        Number of Vacancy
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtNoVacancy" runat="server" class="form-control" placeholder="Only Digits" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        HR Name
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtHrName" runat="server" class="form-control" placeholder="HR Name" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>



                                                    
                                                    <div class="col-lg-4">
                                                     HR   Phone/ Mobile
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Mobile" TabIndex="0" BackColor="LightYellow" MaxLength="10"></asp:TextBox>
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



                                                <div class="col-lg-12">

                                                    <div class="col-lg-12">
                                                         Qualification
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             
                                             <asp:TextBox ID="txtQualification" runat="server" class="form-control" TextMode="MultiLine" placeholder="Qualification" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                      <div class="col-lg-6">
                                                       Special Course
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                               <asp:TextBox ID="txtSpecialCourse" runat="server" class="form-control" placeholder="Special Cource" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        Other Qualification
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtOtherQualification" runat="server" class="form-control" placeholder="Other Qualification" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                  

                                                    
                                                    <div class="col-lg-6">
                                                        Other Condition1
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtOtherCondition1" runat="server" TextMode="MultiLine" class="form-control" placeholder="Condition" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        Condition2
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtOtherCondition2" runat="server" TextMode="MultiLine" class="form-control" placeholder="Condition" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
                                         </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        Remark 
                                         <div class="form-group input-group ">
                                             <span class="input-group-addon"><i class="fa fa-map-marker"></i></span>
                                             <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" class="form-control" placeholder="Remarks" TabIndex="0" BackColor="LightYellow"></asp:TextBox>
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
                                                        <h4> Company Address: </h4>
                                                    </div>
                                                </div>

                                                <div class="col-lg-12">
                                                    <div class="col-lg-12">

                                                        <div class="form-group input-group ">
                                                            <span class="input-group-addon"><i class="fa fa-building-o"></i></span>
                                                            <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Flat/Door/BlockNo" TabIndex="0" TextMode="MultiLine" BackColor="LightYellow"></asp:TextBox>
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

                                                            
                                                            File Upload
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

                                   <%-- <script>
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
                           
                                    </script>--%>
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
