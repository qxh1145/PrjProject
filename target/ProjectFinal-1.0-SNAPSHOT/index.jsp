<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Nested Dropdown Example</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }
            .main-content {
                flex: 1;
            }
            .dropdown-submenu {
                position: relative;
            }
            .dropdown-submenu .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -1px;
            }
            .dropdown-submenu:hover > .dropdown-menu {
                display: block;
            }
            .dropdown-submenu > a:after {
                display: block;
                content: " ";
                float: right;
                width: 0;
                height: 0;
                border-color: transparent;
                border-style: solid;
                border-width: 5px 0 5px 5px;
                border-left-color: #ccc;
                margin-top: 5px;
                margin-right: -10px;
            }
            .coming-soon-container {
                min-height: calc(100vh - 200px);
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                border-radius: 15px;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                margin: 2rem 0;
            }
            .coming-soon-container h1 {
                background: linear-gradient(45deg, #007bff, #6610f2);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            }
            .bg-darker {
                background-color: #1a1a1a;
            }
            .social-links a {
                font-size: 1.2rem;
                transition: color 0.3s;
            }
            .social-links a:hover {
                color: #ffc107 !important;
            }
            footer a {
                transition: color 0.3s;
            }
            footer a:hover {
                color: #ffc107 !important;
            }
            .navbar-nav {
                margin: 0 auto;
            }
            .btn-outline-light:hover {
                background-color: #fff;
                color: #00796B;
            }
            .btn-light:hover {
                background-color: #e9ecef;
                color: #00796B;
            }
            .navbar {
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .dropdown-menu {
                margin-top: 0.5rem;
                border-radius: 0.5rem;
                box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            }
            .dropdown-item {
                transition: all 0.2s;
            }
            .dropdown-item:hover {
                background-color: #f8f9fa;
            }
            .nav-link.disabled {
                pointer-events: none;
                opacity: 0.6;
                cursor: not-allowed;
            }
            .nav-link.disabled:hover::after {
                content: "You must login to use this";
                position: absolute;
                bottom: -30px;
                left: 50%;
                transform: translateX(-50%);
                background-color: rgba(0, 0, 0, 0.8);
                color: white;
                padding: 5px 10px;
                border-radius: 4px;
                font-size: 12px;
                white-space: nowrap;
                z-index: 1000;
            }
            .dropdown-menu .dropdown-toggle::after {
                float: right;
                margin-left: 5px;
            }
            .dropdown-menu .dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -0.1rem;
                margin-left: 0;
            }
            .dropdown-menu li:hover > .dropdown-menu {
                display: block;
            }
            .dropdown-menu .dropdown-menu {
                display: none;
                position: absolute;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #00796B;">
            <div class="container-fluid">
                <!-- Brand Logo -->
                <a class="navbar-brand" href="index.jsp" style="margin-left: 20px;">How to Cook Recipes</a>
                
                <!-- Navbar Toggler -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Navbar Content -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <!-- Center Nav Items -->
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="recipesDropdown" role="button" 
                               data-bs-toggle="dropdown" aria-expanded="false">
                                Recipes
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="recipesDropdown">
                                <li class="dropend">
                                    <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Milk Tea</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Classic Milk Tea</a></li>
                                        <li><a class="dropdown-item" href="#">Milk Tea Latte</a></li>
                                        <li><a class="dropdown-item" href="#">Tropical Milk Tea</a></li>
                                        <li><a class="dropdown-item" href="#">Matcha Milk Tea</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Fruit Tea</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Basic Fruit Tea</a></li>
                                        <li><a class="dropdown-item" href="#">Pineapple Fruit Tea</a></li>
                                        <li><a class="dropdown-item" href="#">Peach Oolong Tea</a></li>
                                        <li><a class="dropdown-item" href="#">Strawberry Jasmine Tea</a></li>
                                        <li><a class="dropdown-item" href="#">Mango Black Tea</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Coffee</a>
                                    <ul class="dropdown-menu">
                                        <li class="dropend">
                                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">ColdBrew</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">How to make ColdBrew</a></li>
                                                <li><a class="dropdown-item" href="#">ColdBrew Latte</a></li>
                                                <li><a class="dropdown-item" href="#">Vanilla Sweet Cream Cold Brew</a></li>
                                                <li><a class="dropdown-item" href="#">Tropical Cold Brew</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropend">
                                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Vietnamese Coffee</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Traditional Vietnamese Drip Coffee</a></li>
                                                <li><a class="dropdown-item" href="#">Bạc Xỉu</a></li>
                                                <li><a class="dropdown-item" href="#">Egg Coffee</a></li>
                                                <li><a class="dropdown-item" href="#">Orange Coffee</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropend">
                                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Italian Coffee</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Cappuccino</a></li>
                                                <li><a class="dropdown-item" href="#">Latte</a></li>
                                                <li><a class="dropdown-item" href="#">Moka</a></li>
                                                <li><a class="dropdown-item" href="#">Macchiato</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <%-- add list juice by diemkieu --%>
                                <li class="dropend">
                                    <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Juices</a>
                                    <ul class="dropdown-menu">
                                        <li class="dropend">
                                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Fruit Juices</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Passion fruit juice</a></li>
                                                <li><a class="dropdown-item" href="#">Grapefruit juice</a></li>
                                                <li><a class="dropdown-item" href="#">Orange juice</a></li>
                                                <li><a class="dropdown-item" href="#">Tropical Fruit Juices</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropend">
                                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Vegetable Juices</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Celery juice</a></li>
                                                <li><a class="dropdown-item" href="#">Beetroot juice</a></li>
                                                <li><a class="dropdown-item" href="#">Cucumber juice</a></li>
                                                <li><a class="dropdown-item" href="#">Carrot juice</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropend">
                                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Mixed Juices</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Apple & carrot juice</a></li>
                                                <li><a class="dropdown-item" href="#">Pineapple & passion fruit juice</a></li>
                                                <li><a class="dropdown-item" href="#">Watermelon & mint juice</a></li>
                                                <li><a class="dropdown-item" href="#">Mixed vegetable juice</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropend">
                                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Detox/Healthy</a>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="#">Green juice</a></li>
                                                <li><a class="dropdown-item" href="#">Detox juice</a></li>
                                                <li><a class="dropdown-item" href="#">Turmeric juice</a></li>
                                                <li><a class="dropdown-item" href="#">Immunity Boosting</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <%--//end list --%>
                            </ul>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Chatbot</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#" id="communityLink">Community</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="toolsDropdown" role="button" 
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    Tools
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="toolsDropdown">
                                    <li><a class="dropdown-item" href="#">Recipe Calculator</a></li>
                                    <li><a class="dropdown-item" href="#">Unit Converter</a></li>
                                    <li><a class="dropdown-item" href="#">Timer</a></li>
                                    <li><a class="dropdown-item" href="#">Shopping List</a></li>
                                </ul>
                            </li>
                        </li>
                        
                    </ul>

                    <!-- Right Side Buttons -->
                    <div class="d-flex" style="margin-right: 20px;">
                        <a href="login.jsp" class="btn btn-outline-light me-2">Login</a>
                        <a href="register.jsp" class="btn btn-light">Register</a>
                    </div>
                </div>
            </div>
        </nav>
        

        <!-- Main Content -->
        <div class="main-content">
            <jsp:include page="component/topContent.jsp"/>
            <jsp:include page="component/content1.jsp"/>
        </div>

        <!-- Footer -->
        <footer class="text-light" style="background-color: #00796B;">
            <div class="container-fluid py-5">
                <div class="row justify-content-center text-center">
                    <!-- About Section -->
                    <div class="col-md-4 mb-4">
                        <h5 class="mb-3">About Us</h5>
                        <p>Discover the art of cooking and coffee brewing with our collection of recipes and guides. From traditional dishes to modern coffee creations.</p>
                        <div class="social-links">
                            <a href="#" class="text-light me-3"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="text-light me-3"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="text-light me-3"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="text-light"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>

                    <!-- Quick Links -->
                    <div class="col-md-4 mb-4">
                        <h5 class="mb-3">Quick Links</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Home</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Recipes</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Coffee Guide</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">About Us</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Contact</a></li>
                        </ul>
                    </div>

                    <!-- Contact Info -->
                    <div class="col-md-4 mb-4">
                        <h5 class="mb-3">Contact Us</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <i class="fas fa-map-marker-alt me-2"></i>
                                123 Cooking Street, Food City
                            </li>
                            <li class="mb-2">
                                <i class="fas fa-phone me-2"></i>
                                +1 234 567 890
                            </li>
                            <li class="mb-2">
                                <i class="fas fa-envelope me-2"></i>
                                info@howtocook.com
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Copyright -->
            <div class="text-center py-3" style="background-color: #036358;">
                <div class="container-fluid">
                    <p class="mb-0">&copy; 2024 How to Cook Recipes. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html> 