<%-- 
    Document   : student.coursedetail.jsp
    Created on : Dec 18, 2023, 4:44:27 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Order</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Lingua project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="assets/styles/bootstrap4/bootstrap.min.css">
        <link href="assets/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="assets/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="assets/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="assets/plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="assets/styles/course.css">
        <link rel="stylesheet" type="text/css" href="assets/styles/course_responsive.css">
        <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
    </head>
    <body>

        <div class="super_container">
            <c:set var="u" value="${user}"/>
            <header class="header">
                <div class="header_container">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="header_content d-flex flex-row align-items-center justify-content-start">
                                    <div class="logo_container mr-auto">
                                        <a href="#" style="box-shadow: 0px 0px 10px 0px rgba(213, 164, 164, 1)">
                                            <img class="logoimg" src="assets/images/logo.jpg" alt="">
                                        </a>
                                    </div>
                                    <nav class="main_nav_contaner">
                                        <ul class="main_nav">
                                            <li class="active"><a href="adminhome">Home</a></li>
                                            <li><a href="admincourses">Courses</a></li>
                                            <li><a href="adminuser">Users</a></li>
                                            <li><a href="adminorder">Orders</a></li>
                                            <li><a href="adminnews">News</a></li>
                                        </ul>
                                    </nav>
                                    <div class="header_content_right ml-auto text-right">
                                        <div class="header_search">
                                            <div class="search_form_container">
                                                <form action="adminsearch" method="GET" id="search_form" class="search_form trans_400">
                                                    <input type="search" name="keyword" class="header_search_input trans_400" placeholder="Type for Search" required="required">
                                                    <div class="search_button">
                                                        <button tyle="submit" style="background-color: transparent;border: none;cursor: pointer;"><i class="fa fa-search" aria-hidden="true"></i></button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="hamburger menu_mm">
                                            <i class="fa fa-bars menu_mm" aria-hidden="true"></i>
                                        </div>
                                    </div><div class="user" id="userDropdown">
                                        <a href="#" onclick="toggleDropdown(event)">
                                            <i class="fa fa-user" aria-hidden="true"></i>
                                        </a>
                                        <div class="dropdown-content">
                                            <div class="dropdown-item-container">
                                                <a href="logout" class="dropdown-item"><i class="fa fa-sign-out"></i> Log out</a>
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        function toggleDropdown(event) {
                                            event.stopPropagation();
                                            var dropdownContent = document.querySelector('.dropdown-content');
                                            var user = document.querySelector('.user');
                                            if (user.classList.contains('open')) {
                                                user.classList.remove('open');
                                            } else {
                                                user.classList.add('open');
                                            }
                                        }
                                        document.addEventListener('click', function (event) {
                                            var user = document.querySelector('.user');
                                            var dropdownContent = document.querySelector('.dropdown-content');

                                            if (user.classList.contains('open') && !user.contains(event.target)) {
                                                user.classList.remove('open');
                                            }
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Menu -->

            <div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
                <div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
                <div class="search">
                    <form action="#" class="header_search_form menu_mm">
                        <input type="search" class="search_input menu_mm" placeholder="Search" required="required">
                        <button class="header_search_button d-flex flex-column align-items-center justify-content-center menu_mm">
                            <i class="fa fa-search menu_mm" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
                <nav class="menu_nav">
                    <ul class="menu_mm">
                        <li class="menu_mm"><a href="adminhome">Home</a></li>
                        <li class="menu_mm"><a href="admincourse">Courses</a></li>
                        <li class="menu_mm"><a href="adminuser">Users</a></li>
                        <li class="menu_mm"><a href="adminorder">Orders</a></li>
                        <li class="menu_mm"><a href="adminnews">News</a></li>
                    </ul>
                </nav>
            </div>

            <div class="home" style="height: 150px;">
                <div class="breadcrumbs_container">
                    <div class="container">
                        <div class="row" style="margin-bottom: 10px;">
                            <button class="btn btn-primary btn-login" style="background-color: #251b1b; border: 2px;" onclick="goBack()"><i class="fa fa-arrow-circle-o-left">Back</i></button>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>

            <!-- Intro -->

            <c:set var="c" value="${course}"/>

            <!-- Course -->

            <div class="course" style="padding-bottom: 215px">
                <div class="course_top"></div>
                <div class="container">
                    <div class="row row-lg-eq-height">

                        <!-- Panels -->
                        <div class="col-lg-9">
                            <div class="tab_panels">

                                <!-- Tabs -->
                                <div class="course_tabs_container">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-9">
                                                <div class="tabs d-flex flex-row align-items-center justify-content-start">
                                                    <div class="tab active">All order</div>
                                                    <div class="tab">Order By Month</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>		
                                </div>

                                <!-- Description -->
                                <div class="tab_panel description active">
                                    <div class="panel_title">All orders<button onclick="ExportToExcel('xlsx')"; style="margin-left: 20px; font-size: 15px">Xuất Excel</button></div>
                                    <div style="padding-top: 30px">
                                        <table id="order" style="border: solid 2px black; padding: 5px">
                                            <thead >
                                                <tr style="border: solid 2px black">
                                                    <th style="border: solid 2px black; padding: 5px">Order Bill</th>
                                                    <th style="border: solid 2px black; padding: 5px">Order Date</th>
                                                    <th style="border: solid 2px black; padding: 5px">Customer</th>
                                                    <th style="border: solid 2px black; padding: 5px">Price</th>
                                                    <th style="border: solid 2px black; padding: 5px">Note</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="la" items="${la}" varStatus="loop">
                                                    <tr style="border: solid 2px black">
                                                        <td style="border: solid 2px black; padding: 5px">${la.orderid}</td>
                                                        <td style="border: solid 2px black; padding: 5px">${la.orderdate}</td>
                                                        <td style="border: solid 2px black; padding: 5px">${la.userid.fullname}</td>
                                                        <td style="border: solid 2px black; padding: 5px">${la.totalamount}</td>
                                                        <td style="border: solid 2px black; padding: 5px">${la.note}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                    <script>
                                        function ExportToExcel(type, fn, dl) {
                                            var elt = document.getElementById('order');
                                            var wb = XLSX.utils.table_to_book(elt, {sheet: "sheet1"});
                                            return dl ?
                                                    XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}) :
                                                    XLSX.writeFile(wb, fn || ('order.' + (type || 'xlsx')));
                                        }
                                    </script>
                                </div>
                                <!-- Curriculum -->
                                <div class="tab_panel curriculum">
                                    <c:forEach var="i" begin="1" end="12" step="1">
                                        <div class="panel_title">Month : ${i}</div>
                                        <c:set var="name" value="month${i}"/>
                                        
                                            <div style="padding-top: 30px">
                                                <table id="ordermonth" style="border: solid 2px black; padding: 5px">
                                                    <thead >
                                                        <tr style="border: solid 2px black">
                                                            <th style="border: solid 2px black; padding: 5px">Order Bill</th>
                                                            <th style="border: solid 2px black; padding: 5px">Order Date</th>
                                                            <th style="border: solid 2px black; padding: 5px">Customer</th>
                                                            <th style="border: solid 2px black; padding: 5px">Price</th>
                                                            <th style="border: solid 2px black; padding: 5px">Note</th>
                                                            <th style="border: solid 2px black; padding: 5px"><button onclick="ExportToExcel1('xlsx')"; style=" font-size: 15px">Xuất Excel</button></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="om" items="${sessionScope[name]}" varStatus="loop">
                                                            <tr style="border: solid 2px black">
                                                                <td style="border: solid 2px black; padding: 5px">${om.orderid}</td>
                                                                <td style="border: solid 2px black; padding: 5px">${om.orderdate}</td>
                                                                <td style="border: solid 2px black; padding: 5px">${om.userid.fullname}</td>
                                                                <td style="border: solid 2px black; padding: 5px">${om.totalamount}</td>
                                                                <td style="border: solid 2px black; padding: 5px">${om.note}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        
                                        
                                    </c:forEach>
                                    

                                    <script>
                                        function ExportToExcel1(type, fn, dl) {
                                            var elt = document.getElementById('ordermonth');
                                            var wb = XLSX.utils.table_to_book(elt, {sheet: "sheet1"});
                                            return dl ?
                                                    XLSX.write(wb, {bookType: type, bookSST: true, type: 'base64'}) :
                                                    XLSX.writeFile(wb, fn || ('ordermonth.' + (type || 'xlsx')));
                                        }
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->

        <footer class="footer">
            <div class="copyright">
                <div class="container">
                    <div class="cr" style="text-align: center">
                        @2023
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/styles/bootstrap4/popper.js"></script>
    <script src="assets/styles/bootstrap4/bootstrap.min.js"></script>
    <script src="assets/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
    <script src="assets/plugins/easing/easing.js"></script>
    <script src="assets/plugins/parallax-js-master/parallax.min.js"></script>
    <script src="assets/plugins/progressbar/progressbar.min.js"></script>
    <script src="assets/js/course.js"></script>
</body>
</html>
