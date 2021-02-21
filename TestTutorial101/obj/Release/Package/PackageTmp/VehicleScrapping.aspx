<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="VehicleScrapping.aspx.cs" Inherits="TestTutorial101.VehicleScrapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script language="javascript" type="text/javascript">
          function validateReg() {

              if (document.getElementById("<%=txtownername.ClientID %>").value == "") {
                  alert("Owner name can't be blank");
                  document.getElementById("<%=txtownername.ClientID %>").focus();
                  return false;
              }
             

             if (document.getElementById("<%=txtmobno.ClientID %>").value == "") {
                  alert("Mobile No. can't be blank");
                  document.getElementById("<%=txtmobno.ClientID %>").focus();
                return false;
            }
            
             



          return true;
      }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <section id="middle">
            <div class="container">
                   <div class="row">
                       <div class="col-sm-6">
                           <asp:Image ID="Image1" runat="server" ImageUrl="~/images/web_101_spn.jpg" />
                       </div>
                       
                       <div class="col-sm-6">
                           <asp:Image ID="Image2" runat="server" ImageUrl="~/images/web_102_spn.jpg" />
                       </div>
                   </div>
                <div class="row">

                    <div class="col-sm-12 wow fadeInDown">
                        <div class="accordion">

                            <div class="panel-group" id="accordion1">
                                <div class="panel panel-default" style="background-color:white;padding:16px">
                                    <div class="row">
                                        <h4>We offer best price of SCRAP vehicle after inspection and evaluation.
Scraping will be done in accordance to Delhi Govt. policy
                                        </h4>
                                    </div>
                                    <div class="row">
                                        <a style="color:black">
                                            <h2>PROMPT PAYMENT/ON SPOT</h2>
                                        </a>
                                    </div>
                                    <div class="row">
                                        <h4>ALL documentation will be handled at our end  ,you do not have to worry for these.</h4>
                                    </div>
                                    <div class="row">
                                        <h4>Will certify that your vehicle has been scrapped by us & issue letter to this effect.
                                        Will organize collection/ lifting of vehicle from your location , if asked for.
                                        </h4>
                                    </div>
                                    <div class="row">
                                        <h4>Chassis number of vehicle received will be cut and retained for records of registration office.</h4>
                                    </div>
                                    <div class="row">
                                        <h4>Vehicle scraping video will be preserved for transport department record.</h4>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading active">
                                        <h3 class="panel-title">
                                            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">Leave your contact details
                                            </a>
                                        </h3>
                                    </div>

                                    <div id="collapseOne1" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="media accordion-inner">
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        
                                                        <label>Vehicle No</label>
                                                    </div>
                                                    <div class="col-sm-3">

                                                        <asp:TextBox ID="txtvehicleno" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <label>Year of registration</label>
                                                       
                                                    </div>
                                                    <div class=" col-sm-3">

                                                        <asp:TextBox ID="txtregistrationyear" runat="server"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label>Owner Name(R/C) *</label>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        
                                                    <asp:TextBox ID="txtownername" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                         <label>Mobile No *</label>
                                                    </div>
                                                    <div class=" col-sm-3">
                                                       
                                                    <asp:TextBox ID="txtmobno" runat="server" TextMode="Number"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <div class="col-sm-3">
                                                        <label>Email Id</label>
                                                    </div>
                                                    <div class=" col-sm-3">
                                                      
                                                    <asp:TextBox ID="txtemailid" runat="server" TextMode="Email"></asp:TextBox>
                                                    </div>
                                                    <div class="col-sm-3">
                                                    </div>
                                                     <div class="col-sm-3">
                                                         <asp:Button ID="btnsubmit" runat="server" Text="Submit" ForeColor="White" BackColor="Green" Width="70%" OnClick="btnsubmit_Click" OnClientClick="return validateReg()" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>


                            </div>
                            <!--/#accordion1-->
                        </div>
                    </div>

                </div>
                <!--/.row-->
            </div>
            <!--/.container-->
        </section>

    </div>
</asp:Content>
