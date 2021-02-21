<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="TestTutorial101.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w3layouts-banner-1">

        <br />
        <br />
    </div>


    <section id="middle">
        <div class="container">
            <div class="row">

                <div class="col-sm-12 wow fadeInDown">
                    <div class="accordion">

                        <br />
                        <br />
                        <div class="panel-group" id="accordion1">
                            <div class="panel panel-default">
                                <div class="panel-heading active">
                                    <h3 class="panel-title">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">Our Services
                                 <%-- <i class="fa fa-angle-right pull-right"></i>--%>
                                        </a>
                                    </h3>
                                </div>

                                <div id="collapseOne1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="media accordion-inner">
                                            <div class="col-sm-3 pull-left">
                                                <img class="img-responsive" src="images/service/Vocational-Training.JPG" />

                                            </div>
                                            <div class=" col-sm-8 media-body">

                                                <h4>We have conducted vocational training under MES (SDI) Scheme & PMKVY-I in both above mentioned courses of Automobile sector.</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">

                                        <div class="media accordion-inner">

                                            <div class="col-sm-8 media-body">
                                                <h4>Society also extend help to individuals in establishing own business by providing 
		detailed project guidance.
                                                </h4>
                                                <p>We support operation of E-vehicle in NCR area for effective pollution control.</p>
                                            </div>
                                            <div class=" col-sm-3 pull-right">
                                                <img class="img-responsive" src="images/service/establishing-own-business.jpg" />

                                            </div>
                                        </div>
                                    </div>

                                    <div class="panel-body">
                                        <div class="media accordion-inner">
                                            <div class="col-sm-3 pull-left">

                                                <img class="img-responsive" src="images/service/Society-extends.JPG" />
                                            </div>
                                            <div class=" col-sm-8 media-body">

                                                <h4>Society extends Insurance advise to individuals on General insurance matters.</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">

                                        <div class="media accordion-inner">

                                            <div class="col-sm-8 media-body">
                                                <h4>Society has written course contents on Automobile trade courses for Training
 Providers.

                                                </h4>
                                            </div>
                                            <div class=" col-sm-3 pull-right">
                                                <img class="img-responsive" src="images/service/Automobile%20trade.jpg" />

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

    <div class="banner-bottom">
        <div class="container" style="background-color: white;">
            <div class="panel-heading active">
                <h3 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">Society implements CSR projects from time to time for building future for Society.
                    </a>
                </h3>
                
            </div>
            <p style="color:red;margin-left:3%">
                    We are in field of vehicle scraping as GOVT SCRAPPER.
                </p>
            <div class="w3ls_banner_bottom_grids">
                <div class="col-md-12 agileits_services_grid">


                    <div class="col-md-6">
                        <h3>Society intends to work in following field as and when such project is assigned.</h3>
                        <ul class="list-group w3-agile">
                            <li class="list-group-item">Donating Education to School Children</li>
                            <li class="list-group-item">Distributing Solar Light to rural students</li>
                            <li class="list-group-item">Adult Education</li>
                            <li class="list-group-item">Donating Customized School Learning Kit</li>
                            <li class="list-group-item">Mentorship and Capacity Building</li>
                            <li class="list-group-item">Enrolment in School</li>
                            <li class="list-group-item">Coaching Classes for Admission in Sr. Sec School</li>
                            <li class="list-group-item">Scholarship Distribution</li>

                        </ul>
                    </div>
                    <div class="col-md-6">
                        <h3>Rural area projects</h3>
                        <ul class="list-group w3-agile">
                            <li class="list-group-item">Creating Self Help Group (SHG)</li>
                            <li class="list-group-item">Seed Distribution Program</li>
                            <li class="list-group-item">Loan Facilitation to Farmers</li>
                            <li class="list-group-item">Vocational Training on Agriculture Trade, Tractor Servicing, Tyre Puncture, </li>
                            <li class="list-group-item">Sanitation at Villages: Creation of “Sochalye” at villages</li>
                            <li class="list-group-item">Entrepreneurial Training</li>
                            <li class="list-group-item">Creating Micro Vendor in Village</li>
                            <li class="list-group-item">Lift Irrigation Project</li>
                            <li class="list-group-item">Spoken English Program</li>
                            <li class="list-group-item">Distribution of Agriculture Spray Machine</li>
                            <li class="list-group-item">Education for Village Girls, Evening Coaching Class for Workers in Village
    and Sites</li>

                        </ul>
                    </div>


                </div>

                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <br />
    <div class="clearfix"></div>
</asp:Content>
