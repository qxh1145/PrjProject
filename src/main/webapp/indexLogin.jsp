<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <!-- Navbar -->
    <%@include file="component/header.jsp"%>


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
