<%@page import="com.pharmacystore.pojo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>
<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
   response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
   response.setHeader("Pragma", "no-cache"); // HTTP 1.0
   response.setDateHeader("Expires", 0);
   %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <title>User Home</title>
      <meta content="" name="description">
      <meta content="" name="keywords">
      <!-- Favicons -->
      <link rel="icon" type="image/png" href="Homepage/assets/img/favicon.png">
      <!-- Google Fonts -->
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
      <!-- Vendor CSS Files -->
      <link href="Homepage/vendor/animate.css/animate.min.css" rel="stylesheet">
      <link href="Homepage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="Homepage/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="Homepage/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
      <link href="Homepage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
      <link href="Homepage/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
      <link href="Homepage/vendor/remixicon/remixicon.css" rel="stylesheet">
      <link href="Homepage/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
      <!-- Template Main CSS File -->
      <link href="Homepage/css/style.css" rel="stylesheet">
      <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   </head>
   <style>
      #uname{
      color:#1997cc;
      }
   </style>
   <body>
      <%
         if(!session.isNew() || session.getAttribute("USER") != null)
         {
         %>	
      <!-- ======= Top Bar ======= -->
      <div id="topbar" class="d-flex align-items-center fixed-top">
         <div class="container d-flex justify-content-between">
            <div class="contact-info d-flex align-items-center">
               <i class="bi bi-envelope"></i> <a href="mailto:contact@example.com">sgsits@gmail.com</a>
               <i class="bi bi-phone"></i> +91 8269577494
            </div>
            <div class="d-none d-lg-flex social-links align-items-center">
               <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
               <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
               <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
               <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
            </div>
         </div>
      </div>
      <!-- ======= Header ======= -->
      <header id="header" class="fixed-top">
         <div class="container d-flex align-items-center">
            <h1 class="logo me-auto" id="uname"><a href="index.html" >NexaCare</a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            <nav id="navbar" class="navbar order-last order-lg-0">
               <ul>
                  <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                  <li><a class="nav-link scrollto" href="#about">About</a></li>
                  <li><a class="nav-link scrollto" href="#services">Services</a></li>
                  <li class="dropdown">
                     <a href="#"><span>Products</span> <i class="bi bi-chevron-down"></i></a>
                     <ul>
                        <select class="form-control" id="categoryid" name="categoryid">
                           <%
                              CategoryDao daoImpl = new CategoryDaoImpl();
                                       			List<Category> lst = daoImpl.getAllCategories();
                                       			if(lst.size() > 0)
                                       			{
                                       				for(Category category : lst)
                                       				{
                                       		%>
                           <option value="<%=category.getCategoryId()%>"> <%=category.getCategoryName()%></option>
                           <%			
                              }
                              }
                              %>
                        </select>
                        <c:url var="categoryPageUrl" value="displayproductcategorywisecontroller">
                           <c:param name="page" value="1" />
                           <c:param name="categoryid" value="${selectedCategoryId}" />
                        </c:url>
                        <script>
                           window.onload = function() {
                               var selectElement = document.getElementById("categoryid");
                               selectElement.onchange = function() {
                                   var selectedCategoryId = this.value;
                           var url = "${categoryPageUrl}"+selectedCategoryId;
                                   window.location.href = url;
                               };
                           };
                        </script>
                     </ul>
                  </li>
                  <li class="dropdown">
                     <a href="#"><span>Profile</span> <i class="bi bi-chevron-down"></i></a>
                     <ul>
                        <li><a href="viewyourordercontroller">View Orders</a></li>
                        <li><a href="updateaddresscontroller">Update Address</a></li>
                        <li><a href = "userlogout.jsp">LOGOUT</a></li>
                     </ul>
                  </li>
               </ul>
               </ul>
               </li>
               </ul>
               <i class="bi bi-list mobile-nav-toggle"></i>
           
          
         </div>
      </header>
      <!-- End Header -->
      <!-- ======= Hero Section ======= -->
      <section id="hero" class="d-flex align-items-center">
         <div class="container">
            <c:if test="${param.msg == 'confirmSuccess'}">
               <c:set var="message" value="Order confirmed successful !!!"/>
            </c:if>
            <c:if test="${param.msg == 'MsgSendSucces'}">
               <c:set var="message" value="Message Send successful !!!"/>
            </c:if>
            <c:if test="${param.msg == 'MsgSendFail'}">
               <c:set var="message" value="Message Send Failed !!!"/>
            </c:if>
            
            <c:if test="${not empty message}">
            <script>
               if ("${message}" !== "") {
                 $(document).ready(function() {
                   if ("${message.trim()}" === "Message Send Failed !!!") {
                     swal({
                       title: 'Success!',
                       text: '${message.trim()}',
                       icon: 'success'
                     });
                   } else {
                     swal({
                       title: 'Message From Server',
                       text: '${message.trim()}',
                       icon: 'error'
                     });
                   }
                 });
               }
            </script>
         </c:if>
            <h1>Welcome to NexaCare</h1>
            <h2>Your trusted online pharmacy destination!
               <br>
               Discover a comprehensive range of pharmaceutical products, health supplements, 
               and wellness essentials, all tailored to meet your healthcare needs.  
               Start your journey to better health today!
            </h2>
            <a href="#about" class="btn-get-started scrollto">Get Started</a>
         </div>
      </section>
      <!-- End Hero -->
      <main id="main">
         <!-- ======= Why Us Section ======= -->
         <section id="why-us" class="why-us">
            <div class="container">
               <div class="row">
                  <div class="col-lg-4 d-flex align-items-stretch">
                     <div class="content">
                        <h3>Why Choose NexaCare?</h3>
                        <p>
                           Welcome to NexaCare, your ultimate destination for all your pharmacy needs. 
                           Our online platform offers unmatched convenience, allowing you to access a 
                           wide selection of products from the comfort of your home. 
                           Say goodbye to long queues and tiresome trips to physical stores.
                        </p>
                        <div class="text-center">
                           <a href="#" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
                        </div>
                     </div>
                  </div>
                 
                     <!-- End .content-->
                  </div>
               </div>
            </div>
         </section>
          <section id="about" class="about">
      <div class="container">

        <div class="section-title">
          <h2 style="text-align:center">About Us</h2>
          <p>An E-Pharmacy that operates over the
	internet by selling medications & health-care needs to the
	customers.</p>
        </div>

        <div class="row content">
          <div class="col-lg-6">
            <p>
              It is easy to order online medicines with
		prescription. Individuals who live great distances from a
		terrestrial pharmacy, the elderly, disabled persons, and those
		whose daily schedule includes additional hassles, all can
		benefit from the easy and fast purchasing of medicines
		online. Additionally, shipping charges are often less than the
		expense incurred from travel costs associated with a visit to
		a traditional pharmacy
            </p>
            <ul>
              <li><i class="ri-check-double-line"></i> Processing of Prescriptions</li>
              <li><i class="ri-check-double-line"></i> Care of Patients</li>
              <li><i class="ri-check-double-line"></i> Future vision</li>
	      <li><i class="ri-check-double-line"></i> Range of Choices</li>	
            </ul>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0">
            <p>
                Under Digital India initiative, Jan
                Aushidhi Program the governments takes initiative to create
		awareness & provide access of affordable medicines to the
		general public which compromising to good quality drugs.
		The operating model of E-pharmacy which has mobile &
		web based applications, directly linked to inventory &
		dispensing existing at Jan Aushadhi Stores.
            </p>
            <a href="#" class="btn-learn-more">Learn More</a>
          </div>
        </div>

      </div>
    </section>
        <!-- ======= Services Section ======= -->
         <section id="services" class="services">
      <div class="container">

        <div class="section-title">
          <h2 style="text-align:center">Services</h2>
          <p> In case you're looking to transition purchasing prescriptions from a storefront location, we've chosen the best online pharmacies to meet your needs.</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-arch"></i></div>
              <h4><a href="">Patient choice</a></h4>
              <p>Patient choice in NexaCare involves giving patients the ability to make decisions about their providers and product. </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4><a href="">Managing medicines </a></h4>
              <p>A risk assessment will help pharmacy owners to identify and manage risks by looking at what could cause harm and what needs to be done to minimise them.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4><a href="">Supplying products </a></h4>
              <p>The delivery of medicines can provide a vital service to those unable to visit a pharmacy.</p>
            </div>
          </div>

          
          </div>

        </div>
    </section>
         <!-- End Services Section -->  
         <section id="contact" class="contact">
            <div class="container">
               <div class="section-title">
                  <h2>Contact</h2>    
            </div>
            <div class="container">
               <div class="row mt-5">
                  <div class="col-lg-4">
                     <div class="info">
                        <div class="address">
                           <i class="bi bi-geo-alt"></i>
                           <h4>Location:</h4>
                           <p>SGSITS, Indore</p>
                        </div>
                        <div class="email">
                           <i class="bi bi-envelope"></i>
                           <h4>Email:</h4>
                           <p>SGSITS@gmail.com</p>
                        </div>
                        <div class="phone">
                           <i class="bi bi-phone"></i>
                           <h4>Call:</h4>
                           <p>+91 8269577494</p>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-8 mt-5 mt-lg-0">
                     <form action="query.jsp" method="post" role="form" style="background-color:white; padding:4px;">
                        <div class="row">
                           <div class="col-md-6 form-group">
                              <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                           </div>
                           <div class="col-md-6 form-group mt-3 mt-md-0">
                              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                           </div>
                        </div>
                        <div class="form-group mt-3">
                           <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
                        </div>
                        <div class="form-group mt-3">
                           <textarea class="form-control" name="msg" rows="5" placeholder="Message" id="msg" required></textarea>
                        </div>
                        <div class="text-center"><button type="submit" style="    margin-left: 25px;
						    background: #1977cc;
						    color: #fff;
						    border-radius: 50px;
						    padding: 8px 25px;
						    white-space: nowrap;
						    transition: 0.3s;
						    font-size: 14px;">Send Message</button>
						</div>
                     </form>
                  </div>
               </div>
            </div>
         </section>
         <!-- End Contact Section -->
      
      <!-- End #main -->
      <!-- ======= Footer ======= -->
      <footer id="footer">
         <div class="footer-top">
            <div class="container">
               <div class="row">
                  <div class="col-lg-3 col-md-6 footer-contact">
                     <h3>NexaCare</h3>
                     <p>
                        SGSITS<br>
                        Indore <br>
                        India<br><br>
                        <strong>Phone:</strong> +91 8269577494<br>
                        <strong>Email:</strong> SGSITS@gmail.com<br>
                     </p>
                  </div>
                  <div class="col-lg-2 col-md-6 footer-links">
                     <h4>Useful Links</h4>
                     <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                     </ul>
                  </div>
         <div class="container d-md-flex py-4">
            <div class="me-md-auto text-center text-md-start">
               
               <div class="credits">
                  Designed by <a href="https://bootstrapmade.com/">Group 7</a>
               </div>
            </div>
            <div class="social-links text-center text-md-right pt-3 pt-md-0">
               <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
               <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
               <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
               <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
               <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
         </div>
      </footer>
      <!-- End Footer -->
      <div id="preloader"></div>
      <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
      <!-- Vendor JS Files -->
      <script src="Homepage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
      <script src="Homepage/vendor/glightbox/js/glightbox.min.js"></script>
      <script src="Homepage/vendor/php-email-form/validate.js"></script>
      <script src="Homepage/vendor/purecounter/purecounter.js"></script>
      <script src="Homepage/vendor/swiper/swiper-bundle.min.js"></script>
      <!-- Template Main JS File -->
      <script src="Homepage/js/main.js"></script>
      <%
         }
         else{
         response.sendRedirect("userlogin.jsp?msg=LoginFirst");
         } 
         %>
   </body>
</html>