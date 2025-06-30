<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is admin
    String username = (String) session.getAttribute("user");
    if (username == null || !"admin".equals(username)) {
        response.sendRedirect("../indexLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Test Admin Servlet</title>
</head>
<body>
    <h1>Test Admin Servlet</h1>
    <p>Current user: <%= username %></p>
    
    <button onclick="testGetUsers()">Test Get Users</button>
    <div id="result"></div>
    
    <script>
        function testGetUsers() {
            fetch('${pageContext.request.contextPath}/main?action=getUsers', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                console.log('Response status:', response.status);
                return response.text();
            })
            .then(data => {
                console.log('Response data:', data);
                document.getElementById('result').innerHTML = '<pre>' + data + '</pre>';
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('result').innerHTML = 'Error: ' + error.message;
            });
        }
    </script>
</body>
</html> 