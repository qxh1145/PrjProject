<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/user-info.css">

<header>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #5D4037;">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Coffee Shop</a>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="menu.jsp">Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                </ul>
                
                <div class="d-flex">
                    <c:choose>
                        <c:when test="${sessionScope.user != null}">
                            <div class="user-info-container">
                                <a class="user-dropdown-toggle">
                                    <i class="fas fa-user me-2"></i>${sessionScope.user}
                                    <i class="fas fa-chevron-down ms-2"></i>
                                </a>
                                <div class="user-info-box">
                                    <div class="user-info-header">
                                        <h6 class="mb-0">${sessionScope.user}</h6>
                                    </div>
                                    <div class="user-info-content">
                                        <div class="dropdown-menu">
                                            <a href="profile.jsp" class="dropdown-item">
                                                <i class="fas fa-user-circle me-2"></i>Profile
                                            </a>
                                            <a href="orders.jsp" class="dropdown-item">
                                                <i class="fas fa-shopping-bag me-2"></i>Orders
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a href="LogoutHandle" class="logout-btn">
                                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a href="login.jsp" class="btn btn-outline-light me-2">Login</a>
                            <a href="register.jsp" class="btn btn-light">Register</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </nav>
</header> 