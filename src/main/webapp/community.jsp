<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
    // Kiểm tra session
    String username = (String) session.getAttribute("user");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Debug information
    System.out.println("Current user: " + username);
    System.out.println("Posts attribute: " + request.getAttribute("posts"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community - Coffee Recipes</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .header h1 {
            font-size: 2.5rem;
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        /* Post Creation Form */
        .post-form {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 3rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #2c3e50;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            resize: vertical;
        }

        textarea.form-control {
            min-height: 100px;
        }

        .btn {
            background: #2c3e50;
            color: white;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #1a252f;
        }

        /* Posts Feed */
        .post {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .post-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .post-user {
            font-weight: 500;
            color: #2c3e50;
        }

        .post-time {
            color: #666;
            font-size: 0.9rem;
        }

        .post-content {
            margin-bottom: 1rem;
            white-space: pre-wrap;
        }

        .post-image {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 1rem;
        }

        .error-message {
            color: #e74c3c;
            margin-top: 0.5rem;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Community</h1>
        </div>

        <!-- Post Creation Form -->
        <div class="post-form">
            <form action="CreatePostServlet" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="content">What's on your mind?</label>
                    <textarea class="form-control" id="content" name="content" placeholder="Share your thoughts..."></textarea>
                </div>
                <div class="form-group">
                    <label for="image">Add an image (optional)</label>
                    <input type="file" class="form-control" id="image" name="image" accept="image/*">
                </div>
                <button type="submit" class="btn">Post</button>
            </form>
        </div>

        <!-- Posts Feed -->
        <div class="posts-feed">
            <c:forEach items="${posts}" var="post">
                <div class="post">
                    <div class="post-header">
                        <span class="post-user">${post.username}</span>
                        <span class="post-time">
                            <fmt:formatDate value="${post.createdAt}" pattern="HH:mm, dd/MM/yyyy"/>
                        </span>
                    </div>
                    <c:if test="${not empty post.content}">
                        <div class="post-content">${post.content}</div>
                    </c:if>
                    <c:if test="${not empty post.imageUrl}">
                        <img src="${post.imageUrl}" alt="Post image" class="post-image">
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html> 