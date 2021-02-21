<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestTutorial101.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="slider">

        <div id="about-slider">
            <div id="carousel-slider" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators visible-xs">
                    <li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-slider" data-slide-to="1"></li>
                    <li data-target="#carousel-slider" data-slide-to="2"></li>
                    <li data-target="#carousel-slider" data-slide-to="3"></li>
                </ol>

                <div class="carousel-inner">
                    <div class="item active">
                        <%-- <img src="extra-images/quality-banner.jpg" />--%>
                        <img src="images/banner1.jpg" />
                    </div>
                    <div class="item ">
                        <img src="images/gallery/Banner5.png" />
                    </div>

                    <div class="item">
                        <img src="images/banner3.jpg" />
                    </div>

                    <div class="item">
                        <img src="images/banner2.jpg" />
                    </div>
                </div>

                <a class="left carousel-control hidden-xs" href="#carousel-slider" data-slide="prev">
                    <i class="fa fa-angle-left"></i>
                </a>

                <a class=" right carousel-control hidden-xs" href="#carousel-slider" data-slide="next">
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
            <!--/#carousel-slider-->
        </div>
        <!--/#about-slider-->

    </div>

    <section id="feature">
        <div class="container">
            <div class="wow fadeInDown">
                <br />
                <br />
                <div class="center">
                    <h2>About Us</h2>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-6"></div>
                    <div class="col-md-6 col-sm-6"></div>
                </div>

                <p style="text-align: justify;">
                    Automotive 101 Society is a Non-Profit Organization, which is registered by a group of professionals under Societies Registration Act XXI of 1860. Registration no. S 54032 dated. 21st Oct 2005. The Society is also registered U/S 80 G (5) (VI) of Income Tax Act, 1961.  
                                <br />
                    <br />
                    From last seven years Automotive 101 Society is providing quality skill education and vocational training to the youths of urban and rural areas to improve upon their technical capabilities related to sales, repairs and supervisor’s
                                job in the Automobile industry particularly at the dealership level.
                                <br />
                    <br />
                    Automotive 101 Society believe that new companies Act on Corporate Social Responsibility (CSR) is an organization’s organised responsibility towards building an equitable society which in turn will build a strong and prosperous 
                                nation. The Ministry of Corporate Affairs has issued the final guideline that would apply to companies, commencing 1st April 2014. One of the main objectives behind having CSR is promoting awareness and share responsibilities
                                with partnership to address critical areas that need focus which cannot be achieved by one entity alone, but with the combined efforts of partnership, sustainable solutions can be offered to many issues in the society.
                                <br />
                    <br />
                    This New act have open’s a big doors to the millions of stakeholders in the society who have a capacity to built themselves but need startup support from the drivers of the society. We are introducing some of the project initiative
                                where we are looking support from the drivers of the society to act for the growth of the society:
                                <br />
                    <br />
                    Provide quality vocational training to the youths of urban and rural  in trades such as vehicle mechanic, and allied trades so that customer can get his vehicle repaired in one attempt, with genuine spare parts as these factors too account for vehicle accidents, training youth will provide lively hood opportunities to persons of weaker section of society.
                <br />
                    <br />

                    Area Covered: Uttar Pradesh, Delhi/NCR ,Uttarakhand, Haryana, Punjab, Chandigarh, Madhya
                                Pradesh, Jammu & Kashmir, Rajasthan, Himachal Pradesh
                                Supporting for: Children, Youth, Women, Man, Elderly, Differently Able
                                Looking Support from: Public and Private organization’s
                </p>
                <p style="text-align: justify;">
                    <b>Educate vehicle users about Road Safety, </b>duties towards other road users in order to avoid road accidents and being able to save precious human lives.
                </p>
                <p style="text-align: justify;">
                    <b>SCRAPING OF VEHICLE OF OLD VEHICLES AFTER END OF VEHICLE LIFE.</b>
                </p>
                <p>
                    <b>We conduct Road safety & Lifesaving classes in schools.</b>
                     <div class="row">
                         <div class="col-md-6 col-sm-6">
                    <img class="img-responsive" src="images/gallery/RoadSafety.jpg" style="height: 270px; width: 558px"  />
                </div>
                <div class="col-md-6 col-sm-6">
                    <img class="img-responsive" src="images/gallery/RoadSafety1.jpg" style="height: 270px; width: 558px"  />
                </div>
                           
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6 pull-left">
                                 <img class="img-responsive"  src="images/gallery/LifeSave.jpg"  style="height: 270px; width: 558px; padding-top:12px;"  />
                            </div>
                            <div class="col-sm-6 pull-left">
                                <img class="img-responsive"  src="images/gallery/LifeSave1.jpg"  style="padding-top:12px;  height: 270px; width: 558px"/>
                            </div>
                        </div>
                   
                </p>
                <p style="text-align: justify;">
                    Society is managed by group of professionals, They are expert having more than 35 year experience in different sectors. President of society is a retired Commandant (Border Security Force), Who has commanded/ Headed Central School of Motor Transport at Tekanpur, Gwalior, having experience in different aspects of Automobile sector such as maintenance of vehicle, managing repair and maintenance workshops and imparting training in different trades. He established three year Diploma course affiliated to M P Technical Education Board, Bhopal. For wards of BSF personnel.

                </p>
                <ul>
                    <li>Society is presently imparting vocational training in Automobile sector.
                    </li>
                    <li>Car Washer and Assistant service Technician & Taxi driver/chauffeur. </li>
                </ul>
                <p>These courses are aligned to NSQF and their certification is done through ASDC (Automotive skill development council).</p>
                <p>We have conducted vocational training under MES (SDI) Scheme & PMKVY-I in both above mentioned courses of Automobile sector.</p>
            </div>
            <br />

            <div class="row">
                <div class="col-sm-4 pull-left">
                    <img class="img-responsive" src="images/service/Vocational-Training.JPG" />
                </div>
                <div class="col-sm-8 pull-left">
                    <p>
                        Society also extend help to individuals in establishing own business by providing 
		detailed project guidance.
We support operation of E-vehicle in NCR area for effective pollution control.
                    </p>
                </div>
            </div>
            <br />
            <div class="row">

                <div class="col-sm-8 pull-left">
                    <p>
                        Society also extend help to individuals in establishing own business by providing 
		detailed project guidance.
We support operation of E-vehicle in NCR area for effective pollution control.
                    </p>
                </div>
                <div class="col-sm-4 pull-left">
                    <img class="img-responsive" src="images/service/Vocational-Training.JPG" />
                </div>
            </div>
            <div>
            </div>

        </div>
        <!--/.container-->
    </section>
    <!--/#feature-->
    <div class="container wow">
        <div class="panel-heading active">
            <h3 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">Affiliated with:-
                                 <%-- <i class="fa fa-angle-right pull-right"></i>--%>
                </a>
            </h3>
        </div>
        <div style="height: 150px;" class="fadeInDown">
            <marquee direction="left" behavior="scroll" direction="left" onmouseover="this.stop();" onmouseout="this.start();">
                <img src="images/ASDC.png" style="padding-top:12px; padding-right:10px" /><img src="images/NSDC.jpg"  style="padding-top:12px; padding-right:20px" />
                <img src="images/PMKVY.png"  style="padding-top:12px; padding-right:10px" />
            </marquee>
        </div>
    </div>



    <%--    <section id="middle">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 wow fadeInDown">
                    <div class="skill">
                        <h2>Our Skills</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                        <div class="progress-wrap">
                            <h3>Graphic Design</h3>
                            <div class="progress">
                              <div class="progress-bar  color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 85%">
                                <span class="bar-width">85%</span>
                              </div>

                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>HTML</h3>
                            <div class="progress">
                              <div class="progress-bar color2" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 95%">
                               <span class="bar-width">95%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>CSS</h3>
                            <div class="progress">
                              <div class="progress-bar color3" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                <span class="bar-width">80%</span>
                              </div>
                            </div>
                        </div>

                        <div class="progress-wrap">
                            <h3>Wordpress</h3>
                            <div class="progress">
                              <div class="progress-bar color4" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                <span class="bar-width">90%</span>
                              </div>
                            </div>
                        </div>
                    </div>

                </div><!--/.col-sm-6-->

                <div class="col-sm-6 wow fadeInDown">
                    <div class="accordion">
                        <h2>Why People like us?</h2>
                        <div class="panel-group" id="accordion1">
                          <div class="panel panel-default">
                            <div class="panel-heading active">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">
                                  Lorem ipsum dolor sit amet
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>

                            <div id="collapseOne1" class="panel-collapse collapse in">
                              <div class="panel-body">
                                  <div class="media accordion-inner">
                                        <div class="pull-left">
                                            <img class="img-responsive" src="images/accordion1.png">
                                        </div>
                                        <div class="media-body">
                                             <h4>Adipisicing elit</h4>
                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore</p>
                                        </div>
                                  </div>
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">
                                  Lorem ipsum dolor sit amet
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseTwo1" class="panel-collapse collapse">
                              <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">
                                  Lorem ipsum dolor sit amet
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseThree1" class="panel-collapse collapse">
                              <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.
                              </div>
                            </div>
                          </div>

                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapseFour1">
                                  Lorem ipsum dolor sit amet
                                  <i class="fa fa-angle-right pull-right"></i>
                                </a>
                              </h3>
                            </div>
                            <div id="collapseFour1" class="panel-collapse collapse">
                              <div class="panel-body">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor.
                              </div>
                            </div>
                          </div>
                        </div><!--/#accordion1-->
                    </div>
                </div>

            </div><!--/.row-->
        </div><!--/.container-->
    </section>--%>
    <!--/#middle-->


</asp:Content>
