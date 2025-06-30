<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Check if user is admin
    String username = (String) session.getAttribute("user");
    if (username == null || !"admin".equals(username)) {
        response.sendRedirect("../indexLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Client Account - Admin Panel</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 80px;
        }
        .admin-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .table-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }
        .table th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            font-weight: 600;
        }
        .btn-upgrade {
            background-color: #28a745;
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s;
        }
        .btn-upgrade:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        .btn-downgrade {
            background-color: #dc3545;
            border: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s;
        }
        .btn-downgrade:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }
        .status-badge {
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            font-size: 0.875rem;
            font-weight: 500;
        }
        .status-premium {
            background-color: #d4edda;
            color: #155724;
        }
        .status-free {
            background-color: #f8d7da;
            color: #721c24;
        }
        .alert {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1050;
            min-width: 300px;
        }
    </style>
</head>
<body>
    <%-- <%@include file="../component/header.jsp"%> --%>
    
    <!-- Simple Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #00796B;">
        <div class="container-fluid">
            <a class="navbar-brand" href="../indexLogin.jsp">How to Cook Recipes - Admin Panel</a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">Welcome, <%= username %></span>
                <a class="nav-link" href="../main?action=logout">Logout</a>
            </div>
        </div>
    </nav>
    
    <!-- Admin Header -->
    <div class="admin-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <h1 class="display-5 mb-0">
                        <i class="fas fa-users-cog me-3"></i>
                        Update Client Account
                    </h1>
                    <p class="lead mb-0">Manage user account types and permissions</p>
                </div>
                <div class="col-md-4 text-end">
                    <button class="btn btn-light" onclick="refreshTable()">
                        <i class="fas fa-sync-alt me-2"></i>Refresh
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <!-- Alert Messages -->
        <div id="alertContainer"></div>
        
        <!-- Users Table -->
        <div class="table-container">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Account Type</th>
                            <th>Registration Date</th>
                            <th>Last Login</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="usersTableBody">
                        <!-- Data will be loaded here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Load users on page load
        document.addEventListener('DOMContentLoaded', function() {
            loadUsers();
        });

        function loadUsers() {
            fetch('../admin/getUsers', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    displayUsers(data.users);
                } else {
                    showAlert('Error loading users: ' + data.message, 'danger');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showAlert('Error loading users', 'danger');
            });
        }
function displayUsers(users) {
    const tbody = document.getElementById('usersTableBody');
    tbody.innerHTML = '';

    users.forEach(user => {
        const row = document.createElement('tr');

        let actionButton = '';
        if (user.accountType === 'premium') {
            actionButton = `<button class="btn btn-downgrade btn-sm" onclick="updateAccountType('${user.username}', 'free')">
                <i class="fas fa-arrow-down me-1"></i>Downgrade</button>`;
        } else {
            actionButton = `<button class="btn btn-upgrade btn-sm" onclick="updateAccountType('${user.username}', 'premium')">
                <i class="fas fa-arrow-up me-1"></i>Upgrade</button>`;
        }

        row.innerHTML = `
            <td>${'$'}{user.username}</td>
            <td>${'$'}{user.email || 'N/A'}</td>
            <td>
                <span class="status-badge ${'$'}{user.accountType === 'premium' ? 'status-premium' : 'status-free'}">
                    ${'$'}{user.accountType || 'free'}
                </span>
            </td>
            <td>${'$'}{user.registrationDate || 'N/A'}</td>
            <td>${'$'}{user.lastLogin || 'N/A'}</td>
            <td>${actionButton}</td>
        `;
        tbody.appendChild(row);
    });
}

        function updateAccountType(username, newAccountType) {
            const action = newAccountType == 'premium' ? 'upgrade' : 'downgrade';
            const confirmMessage = `Are you sure you want to ${action} ${username}'s account to ${newAccountType}?`;
            
            if (!confirm(confirmMessage)) {
                return;
            }

            fetch('../admin/updateAccountType', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    username: username,
                    newAccountType: newAccountType
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showAlert(`Successfully ${action}d ${username}'s account to ${newAccountType}`, 'success');
                    loadUsers(); // Refresh table
                } else {
                    showAlert('Error updating account: ' + data.message, 'danger');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showAlert('Error updating account', 'danger');
            });
        }

        function refreshTable() {
            loadUsers();
            showAlert('Table refreshed', 'info');
        }

        function showAlert(message, type) {
            const alertContainer = document.getElementById('alertContainer');
            const alertId = 'alert-' + Date.now();
            
            const alertHtml = `
                <div id="${alertId}" class="alert alert-${type} alert-dismissible fade show" role="alert">
                    ${message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            `;
            
            alertContainer.innerHTML = alertHtml;
            
            // Auto remove after 5 seconds
            setTimeout(() => {
                const alert = document.getElementById(alertId);
                if (alert) {
                    alert.remove();
                }
            }, 5000);
        }
    </script>
</body>
</html> 