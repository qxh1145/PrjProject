<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #00796B;
            --primary-light: #009688;
            --primary-dark: #004D40;
            --primary-lighter: #B2DFDB;
            --accent-color: #FFC107;
            --success-color: #4CAF50;
            --danger-color: #F44336;
            --warning-color: #FF9800;
            --text-dark: #212121;
            --text-light: #757575;
            --bg-light: #F5F5F5;
            --white: #FFFFFF;
        }

        body {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--primary-dark) 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .admin-container {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        .page-title {
            color: var(--white);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2.5rem;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        .header-card {
            background: var(--white);
            border-radius: 16px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 32px rgba(0, 121, 107, 0.15);
            border: 1px solid rgba(0, 121, 107, 0.1);
        }
        .stats-card {
            background: var(--white);
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 8px 32px rgba(0, 121, 107, 0.15);
            border: 1px solid rgba(0, 121, 107, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0, 121, 107, 0.25);
        }
        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            font-size: 1.5rem;
            color: var(--white);
        }
        .stats-icon.primary { background: linear-gradient(135deg, var(--primary-color), var(--primary-light)); }
        .stats-icon.success { background: linear-gradient(135deg, var(--success-color), #66BB6A); }
        .stats-icon.warning { background: linear-gradient(135deg, var(--warning-color), #FFB74D); }
        
        .table-container {
            background: var(--white);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 121, 107, 0.15);
            border: 1px solid rgba(0, 121, 107, 0.1);
        }
        .table-header {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-light));
            color: var(--white);
            padding: 1rem 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .table th {
            background: var(--bg-light);
            border: none;
            padding: 1rem;
            font-weight: 600;
            color: var(--text-dark);
        }
        .table td {
            padding: 1rem;
            border: none;
            border-bottom: 1px solid #E0E0E0;
            vertical-align: middle;
        }
        .table tbody tr:hover {
            background: rgba(0, 121, 107, 0.05);
        }
        .user-avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-light));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--white);
            font-size: 0.875rem;
            font-weight: 600;
        }
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
        }
        .status-premium {
            background: linear-gradient(135deg, var(--success-color), #66BB6A);
            color: var(--white);
        }
        .status-free {
            background: linear-gradient(135deg, var(--warning-color), #FFB74D);
            color: var(--white);
        }
        .btn-upgrade, .btn-downgrade {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 8px;
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        .btn-upgrade {
            background: linear-gradient(135deg, var(--success-color), #66BB6A);
            color: var(--white);
        }
        .btn-upgrade:hover {
            background: linear-gradient(135deg, #388E3C, var(--success-color));
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(76, 175, 80, 0.4);
        }
        .btn-downgrade {
            background: linear-gradient(135deg, var(--danger-color), #EF5350);
            color: var(--white);
        }
        .btn-downgrade:hover {
            background: linear-gradient(135deg, #D32F2F, var(--danger-color));
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(244, 67, 54, 0.4);
        }
        .btn-outline-primary {
            border-color: var(--primary-color);
            color: var(--primary-color);
        }
        .btn-outline-primary:hover {
            background: var(--primary-color);
            border-color: var(--primary-color);
            color: var(--white);
        }
        .btn-outline-danger {
            border-color: var(--danger-color);
            color: var(--danger-color);
        }
        .btn-outline-danger:hover {
            background: var(--danger-color);
            border-color: var(--danger-color);
            color: var(--white);
        }
        .text-primary {
            color: var(--primary-color) !important;
        }
        .text-success {
            color: var(--success-color) !important;
        }
        .text-warning {
            color: var(--warning-color) !important;
        }
        .alert {
            border-radius: 12px;
            border: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        .alert-success {
            background: linear-gradient(135deg, var(--success-color), #66BB6A);
            color: var(--white);
        }
        .alert-danger {
            background: linear-gradient(135deg, var(--danger-color), #EF5350);
            color: var(--white);
        }
        .search-box {
            position: relative;
        }
        .search-box input {
            border: none;
            border-radius: 20px;
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.9);
            color: var(--text-dark);
            transition: all 0.3s ease;
        }
        .search-box input:focus {
            outline: none;
            background: var(--white);
            box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.3);
        }
        .search-box input::placeholder {
            color: var(--text-light);
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .fade-in {
            animation: fadeIn 0.3s ease;
        }
        
        /* Loading Animation Styles */
        .btn-loading {
            position: relative;
            overflow: hidden;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-light)) !important;
            color: var(--white) !important;
            border: none !important;
            transform: scale(0.95);
            transition: all 0.3s ease;
        }
        
        .btn-loading::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            animation: shimmer 1.5s infinite;
        }
        
        .btn-loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            margin: -10px 0 0 -10px;
            border: 2px solid transparent;
            border-top: 2px solid var(--white);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }
        
        @keyframes shimmer {
            0% { left: -100%; }
            100% { left: 100%; }
        }
        
        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }
        
        .btn-loading-text {
            opacity: 0.8;
            font-weight: 500;
            letter-spacing: 0.5px;
        }
        
        /* Pulse effect for the button */
        .btn-loading {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(0, 121, 107, 0.7); }
            70% { box-shadow: 0 0 0 10px rgba(0, 121, 107, 0); }
            100% { box-shadow: 0 0 0 0 rgba(0, 121, 107, 0); }
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <h1 class="page-title">Admin Dashboard</h1>
        
        <!-- Header -->
        <div class="header-card">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h2 class="mb-0 text-primary">
                        <i class="fas fa-shield-alt me-2"></i>
                        Tech Admin Panel
                    </h2>
                    <p class="mb-0 text-muted">Welcome, ${adminUsername}</p>
                </div>
                <div class="d-flex gap-2">
                    <a href="indexLogin.jsp" class="btn btn-outline-primary">
                        <i class="fas fa-home me-1"></i>Trở về trang chủ
                    </a>
                    <a href="../main?action=logout" class="btn btn-outline-danger">
                        <i class="fas fa-sign-out-alt me-1"></i>Logout
                    </a>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="stats-card text-center">
                    <div class="stats-icon primary">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="text-primary mb-1">${users.size()}</h3>
                    <p class="text-muted mb-0">Total Users</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card text-center">
                    <div class="stats-icon success">
                        <i class="fas fa-crown"></i>
                    </div>
                    <h3 class="text-success mb-1">
                        <c:set var="premiumCount" value="0"/>
                        <c:forEach var="user" items="${users}">
                            <c:if test="${user.accountType == 'premium'}">
                                <c:set var="premiumCount" value="${premiumCount + 1}"/>
                            </c:if>
                        </c:forEach>
                        ${premiumCount}
                    </h3>
                    <p class="text-muted mb-0">Premium Users</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card text-center">
                    <div class="stats-icon warning">
                        <i class="fas fa-user"></i>
                    </div>
                    <h3 class="text-warning mb-1">
                        <c:set var="freeCount" value="0"/>
                        <c:forEach var="user" items="${users}">
                            <c:if test="${user.accountType != 'premium'}">
                                <c:set var="freeCount" value="${freeCount + 1}"/>
                            </c:if>
                        </c:forEach>
                        ${freeCount}
                    </h3>
                    <p class="text-muted mb-0">Free Users</p>
                </div>
            </div>
        </div>
        
        <div class="table-container">
            <div class="table-header">
                <h3 class="mb-0">
                    <i class="fas fa-table me-2"></i>User Accounts
                </h3>
                <div class="d-flex gap-2 align-items-center">
                    <div class="search-box">
                        <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="Tìm kiếm username..." style="min-width: 200px;">
                    </div>
                    <button class="btn btn-light btn-sm" onclick="refreshTable()">
                        <i class="fas fa-sync-alt me-1"></i>Refresh
                    </button>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-user me-1"></i>Username</th>
                            <th><i class="fas fa-key me-1"></i>Password</th>
                            <th><i class="fas fa-tag me-1"></i>Account Type</th>
                            <th><i class="fas fa-cogs me-1"></i>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="user-avatar me-2">
                                            ${fn:substring(fn:toUpperCase(user.username), 0, 1)}
                                        </div>
                                        <span class="fw-medium">${user.username}</span>
                                    </div>
                                </td>
                                <td>
                                    <code class="bg-light px-2 py-1 rounded">${user.password}</code>
                                </td>
                                <td>
                                    <span class="status-badge ${user.accountType == 'premium' ? 'status-premium' : 'status-free'}">
                                        <i class="fas ${user.accountType == 'premium' ? 'fa-crown' : 'fa-user'} me-1"></i>
                                        ${user.accountType}
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.accountType == 'premium'}">
                                            <button class="btn-downgrade" onclick="updateAccountType('${user.username}', 'Free')">
                                                <i class="fas fa-arrow-down me-1"></i>Downgrade
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn-upgrade" onclick="updateAccountType('${user.username}', 'premium')">
                                                <i class="fas fa-arrow-up me-1"></i>Upgrade
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Alert Container -->
    <div id="alertContainer" style="position: fixed; top: 20px; right: 20px; z-index: 1050;"></div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Search functionality
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const tableRows = document.querySelectorAll('tbody tr');
            
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase().trim();
                
                tableRows.forEach(row => {
                    const username = row.querySelector('td:first-child span').textContent.toLowerCase();
                    
                    if (username.includes(searchTerm)) {
                        row.style.display = '';
                        row.style.animation = 'fadeIn 0.3s ease';
                    } else {
                        row.style.display = 'none';
                    }
                });
                
                // Show/hide "no results" message
                const visibleRows = Array.from(tableRows).filter(row => row.style.display !== 'none');
                showNoResultsMessage(visibleRows.length === 0 && searchTerm !== '');
            });
        });
        
        function showNoResultsMessage(show) {
            let noResultsRow = document.getElementById('noResultsRow');
            
            if (show) {
                if (!noResultsRow) {
                    noResultsRow = document.createElement('tr');
                    noResultsRow.id = 'noResultsRow';
                    noResultsRow.innerHTML = `
                        <td colspan="4" class="text-center py-4">
                            <div class="text-muted">
                                <i class="fas fa-search fa-2x mb-2"></i>
                                <p class="mb-0">Không tìm thấy username phù hợp</p>
                            </div>
                        </td>
                    `;
                    document.querySelector('tbody').appendChild(noResultsRow);
                }
                noResultsRow.style.display = '';
            } else if (noResultsRow) {
                noResultsRow.style.display = 'none';
            }
        }

        function refreshTable() {
            window.location.reload();
        }

        function updateAccountType(username, newAccountType) {
            const action = newAccountType == 'premium' ? 'upgrade' : 'downgrade';
            const confirmMessage = `Are you sure you want to process this action?`;

            if (!confirm(confirmMessage)) {
                return;
            }

            // Show loading state with beautiful animation
            const button = event.target;
            const originalText = button.innerHTML;
            const originalClasses = button.className;
            
            // Apply loading styles
            button.className = originalClasses + ' btn-loading';
            button.innerHTML = '<span class="btn-loading-text">Processing...</span>';
            button.disabled = true;

            fetch('${pageContext.request.contextPath}/main?action=updateAccountType', {
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
                    // Auto refresh after successful update
                    window.location.reload();
                } else {
                    // Reset button state and show error
                    button.className = originalClasses;
                    button.innerHTML = originalText;
                    button.disabled = false;
                    alert('Error updating account: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                // Reset button state and show error
                button.className = originalClasses;
                button.innerHTML = originalText;
                button.disabled = false;
                alert('Error updating account');
            });
        }

        
    </script>
</body>
</html> 