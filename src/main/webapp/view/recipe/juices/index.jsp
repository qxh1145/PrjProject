<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../../component/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Juices Recipes</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body { background: linear-gradient(120deg, #f5f5f5 60%, #b2dfdb 100%); color: #333; font-family: 'Poppins', sans-serif; padding-top: 70px; }
        .container { max-width: 1100px; margin: 0 auto; padding: 2rem; }
        .overview-header { text-align: center; margin-bottom: 2.5rem; }
        .recipe-list { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 2rem; justify-items: center; }
        .recipe-card { background: #fff; border-radius: 18px; box-shadow: 0 6px 24px rgba(0,0,0,0.10); padding: 1.5rem 1rem 2rem 1rem; width: 100%; max-width: 260px; text-align: center; transition: transform 0.2s, box-shadow 0.2s; position: relative; }
        .recipe-card:hover { transform: translateY(-8px) scale(1.03); box-shadow: 0 12px 32px rgba(0,0,0,0.18); }
        .recipe-img { width: 100%; height: 140px; object-fit: cover; border-radius: 12px; margin-bottom: 1rem; }
        .recipe-title { font-size: 1.2rem; font-weight: 600; color: #00796B; margin-bottom: 0.7rem; }
        .view-btn { display: inline-block; margin-top: 0.5rem; padding: 0.5rem 1.2rem; background: #00796B; color: #fff; border-radius: 20px; text-decoration: none; font-weight: 500; transition: background 0.2s; }
        .view-btn:hover { background: #004d40; }
    </style>
</head>
<body>
    <div class="container">
        <div class="overview-header">
            <h1>All Juices Recipes</h1>
            <p>Choose your favorite juice recipe below:</p>
        </div>
        <div class="recipe-list">
            <!-- Example recipe card, hãy bổ sung các công thức thực tế ở đây -->
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" alt="Detox Juice" class="recipe-img"/>
                <div class="recipe-title">Detox Juice</div>
                <a href="main?action=recipe&type=juices&name=detoxJuice" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80" alt="Green Juice" class="recipe-img"/>
                <div class="recipe-title">Green Juice</div>
                <a href="main?action=recipe&type=juices&name=greenJuice" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" alt="Immunity Boosting Juice" class="recipe-img"/>
                <div class="recipe-title">Immunity Boosting Juice</div>
                <a href="main?action=recipe&type=juices&name=immunityBoostingJuice" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80" alt="Turmeric Juice" class="recipe-img"/>
                <div class="recipe-title">Turmeric Juice</div>
                <a href="main?action=recipe&type=juices&name=turmericJuice" class="view-btn">View Recipe</a>
            </div>
        </div>
    </div>
    <%@ include file="../../../../component/footer.jsp" %>
</body>
</html> 