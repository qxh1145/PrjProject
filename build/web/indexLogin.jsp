<!DOCTYPE html>
<html lang="en">
<head>
    <title>Nested Dropdown Example</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
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
        .btn-outline-light:hover {
            background-color: #fff;
            color: #00796B;
        }
        .btn-light:hover {
            background-color: #e9ecef;
            color: #00796B;
        }
        footer a:hover {
            color: #ffc107 !important;
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

    /* Tùy chọn: hover mở submenu */
    .dropdown-menu li:hover > .dropdown-menu {
        display: block;
    }

    /* Đảm bảo submenu không bị ẩn */
    .dropdown-menu .dropdown-menu {
        display: none;
        position: absolute;
    }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #00796B;">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html" style="margin-left: 20px;">How to Cook Recipes</a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="recipesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Chatbot</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" id="communityLink">Community</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="toolsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Tools
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="toolsDropdown">
                            <li><a class="dropdown-item" href="#">Recipe Calculator</a></li>
                            <li><a class="dropdown-item" href="#">Unit Converter</a></li>
                            <li><a class="dropdown-item" href="#">Timer</a></li>
                            <li><a class="dropdown-item" href="#">Shopping List</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#">Test</a>
                        <ul class="dropdown-menu">
                            <li></li>
                        </ul>
                    </li>
                </ul>

                <div class="d-flex" style="margin-right: 20px;">
                    <button class="btn btn-outline-light me-2">
                        <a href="login.jsp" class="text-decoration-none text-light">Login</a>
                    </button>
                    <button class="btn btn-light">
                        <a href="http://localhost:8080/ProjectPrj/register.jsp" class="text-decoration-none text-dark">Register</a>
                    </button>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <%@include file="component/topContent.jsp"%>
        <%@include file="component/content1.jsp"%>
    </div>

    <!-- Footer -->
    <footer class="text-light mt-auto" style="background-color: #00796B;">
        <div class="container-fluid py-5">
            <div class="row justify-content-center text-center">
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

                <div class="col-md-4 mb-4">
                    <h5 class="mb-3">Contact Us</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i>123 Cooking Street, Food City</li>
                        <li class="mb-2"><i class="fas fa-phone me-2"></i>+1 234 567 890</li>
                        <li class="mb-2"><i class="fas fa-envelope me-2"></i>info@howtocook.com</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="text-center py-3" style="background-color: #036358;">
            <p class="mb-0">&copy; 2024 How to Cook Recipes. All rights reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
