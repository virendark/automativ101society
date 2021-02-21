<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Career.aspx.cs" Inherits="TestTutorial101.Career" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <%-- <div class="w3layouts-banner-1">
    </div>--%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <section id="services" class="service-item">
        <div class="container">
            <div class="center wow fadeInDown">
                <h2></h2>


            </div>

            <div class="row">

                <div class="col-sm-9 col-md-9">
                    <div class="media services-wrap wow fadeInDown">

                        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

                        <div class="col-lg-12">
                            <div class="bs-docs-example">

                                <div class="table-responsive">

                                    <asp:Repeater ID="rptrNewEvent" runat="server">
                                        <HeaderTemplate>
                                            <table class="table table-striped table-bordered table-hover" style="width:100%" id="dataTables-example">
                                                <thead>
                                                </thead>
                                                <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td colspan="4">
                                                    <p>
                                                        <%# DataBinder.Eval(Container.DataItem, "JobTitle")%>
                                                    </p>    <hr />                                                  
                                                    <p>
                                                      Qualification:-  <b><%# DataBinder.Eval(Container.DataItem, "Qualification")%></b>
                                                    </p>
                                                    
                                                     <p>
                                                      <b><%# DataBinder.Eval(Container.DataItem, "CompnayName")%></b>
                                                    </p>
                                                   
                                                    <p>
                                                        <b><%# DataBinder.Eval(Container.DataItem, "jobDesc")%></b>
                                                    </p>
                                                    <p><b>Conditions:-</b></p>
                                                    <p>
                                                        <%# DataBinder.Eval(Container.DataItem, "ConditionOne")%>
                                                    </p>
                                                     <p> 
                                                       <asp:LinkButton ID="btnApply" runat="server" CssClass=" btn btn-primary   btn-small  pull-right" CommandArgument='<%# Eval("AutoID") %>' OnClick="btnApply_Click">
                                        <i class="icon-trash" >Apply</i></asp:LinkButton>

                                                    </p>

                                                </td>
                                            </tr>


                                        </ItemTemplate>
                                        <FooterTemplate></tbody></table></FooterTemplate>
                                    </asp:Repeater>

                                </div>



                            </div>


                        </div>

                     
                        <div class="media-body">
                          
                            <section>
                                <div class="modal-body">

                                  
                                    
                                </div>
                       

                            </section>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3 col-md-3">

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




            </div>
            <!--/.row-->
       
        <!--/.container-->
    </section>

    <br /><br />
    <!-- /navigation -->
  <%--  <div class="w3layouts-banner-1">
    </div>--%>

    <!-- bootstrap-pop-up -->
    <div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    Login...
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <section>
                    <div class="modal-body">

                        <div>
                            <label>User Name :</label>
                            <input type="text" class="form-control" runat="server" />
                            <br />
                        </div>
                        <div>
                            <label>Password:</label>
                            <input type="text" class="form-control" runat="server" />
                            <br />
                        </div>

                        <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="pull-left" />
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="pull-right">Forgot Password</asp:LinkButton>
                        <p>
                            <i>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></i>
                        </p>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <div class="modal video-modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    Registation Form...
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <section>
                    <div class="modal-body">

                        <div>
                            <label>User Name :</label>
                            <input type="text" class="form-control" runat="server" />

                        </div>
                        <div>
                            <label>Email :</label>
                            <input type="text" class="form-control" runat="server" />

                        </div>
                        <div>
                            <label>Mobile :</label>
                            <input type="text" class="form-control" runat="server" />

                        </div>

                        <div>
                            <label>Password:</label>
                            <input type="text" class="form-control" runat="server" />
                            <br />
                        </div>

                        <asp:Button ID="Submit" runat="server" Text="Submit" />
                        <p>
                            <i>
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></i>
                        </p>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <!-- //bootstrap-pop-up -->
    <!-- Footer -->
    <!-- start-smoth-scrolling -->
    <!-- js -->
    <!--//pop-up-box -->
    <%--<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

<!-- //js -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
        });
    });
</script>
<!-- start-smoth-scrolling -->
<!-- smooth scrolling -->
	<script type="text/javascript">
	    $(document).ready(function () {
	        /*
                var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear' 
                };
            */
	        $().UItoTop({ easingType: 'easeOutQuart' });
	    });
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!-- //smooth scrolling -->
<script type="text/javascript" src="js/bootstrap.js"></script>--%>
</asp:Content>
