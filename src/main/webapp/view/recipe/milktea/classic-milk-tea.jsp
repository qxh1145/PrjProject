<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classic Milk Tea Recipe</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { background-color: #f5f5f5; color: #333; line-height: 1.6; }
        .container { max-width: 1200px; margin: 0 auto; padding: 2rem; }
        .recipe-header { text-align: center; padding: 3rem 0; background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1350&q=80'); background-size: cover; background-position: center; color: white; margin-bottom: 3rem; }
        .recipe-header h1 { font-size: 3rem; margin-bottom: 1rem; }
        .recipe-header p { font-size: 1.2rem; opacity: 0.9; }
        .card { background: white; border-radius: 15px; padding: 2rem; margin-bottom: 2rem; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .card-title { color: #2c3e50; margin-bottom: 1.5rem; font-size: 2rem; }
        .list, .steps-list, .tips-list { list-style: none; }
    </style>
</head>
<body>
<% if (request.getAttribute("showLockOverlay") != null) { %>
    <div style="position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(0,0,0,1);z-index:9999;display:flex;align-items:center;justify-content:center;flex-direction:column;">
        <div style="background:#fff;border-radius:16px;padding:40px 32px;box-shadow:0 8px 32px rgba(0,0,0,0.18);text-align:center;min-width:320px;max-width:90vw;">
            <i class="fas fa-lock" style="font-size:3rem;color:#00796B;margin-bottom:18px;"></i>
            <div style="font-size:1.25rem;font-weight:600;margin-bottom:18px;">Bạn cần nâng cấp tài khoản để xem nội dung này</div>
            <div style="display:flex;gap:16px;justify-content:center;">
                <a href="indexLogin.jsp" style="padding:10px 22px;border-radius:8px;background:#eee;color:#333;text-decoration:none;font-weight:500;transition:background 0.2s;">Back to Home Page</a>
                <a href="BuyPremium.jsp" style="padding:10px 22px;border-radius:8px;background:#00796B;color:#fff;text-decoration:none;font-weight:500;transition:background 0.2s;">Nâng cấp tài khoản</a>
            </div>
        </div>
    </div>
<% } %>
    <div class="recipe-header">
        <h1>Classic Milk Tea</h1>
        <p>The timeless favorite with black tea and creamy milk</p>
    </div>
    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item"><a href="../">Milk Tea</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item active" aria-current="page">Classic Milk Tea</li>
            </ol>
        </nav>
        <!-- Ingredients -->
        <div class="card">
            <h2 class="card-title">Ingredients</h2>
            <ul class="list">
                <li class="list-item">2 bags black tea (or 2 tbsp loose leaf)</li>
                <li class="list-item">1 cup hot water</li>
                <li class="list-item">1/2 cup whole milk (or non-dairy alternative)</li>
                <li class="list-item">1-2 tbsp sugar (to taste)</li>
                <li class="list-item">Ice cubes</li>
                <li class="list-item">Optional: tapioca pearls</li>
            </ul>
        </div>
        <!-- Instructions -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Steep the tea in hot water for 3-5 minutes, then remove the tea bags/leaves.</li>
                <li class="step-item">Stir in sugar while the tea is hot.</li>
                <li class="step-item">Add milk and mix well.</li>
                <li class="step-item">Pour over a glass filled with ice (and tapioca pearls if using).</li>
                <li class="step-item">Stir and enjoy!</li>
            </ol>
        </div>
        <!-- Tips -->
        <div class="card">
            <h2 class="card-title">Tips</h2>
            <ul class="tips-list">
                <li class="list-item">Use strong black tea for a richer flavor.</li>
                <li class="list-item">Adjust sweetness and milk to your taste.</li>
                <li class="list-item">Try with brown sugar for a deeper taste.</li>
            </ul>
        </div>
    </div>
    <%@ include file="../../../../component/footer.jsp" %>
</body>
</html> 