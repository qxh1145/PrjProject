<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../../component/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Smoothie Recipes</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body { background: linear-gradient(120deg, #f5f5f5 60%, #e1bee7 100%); color: #333; font-family: 'Poppins', sans-serif; padding-top: 70px; }
        .container { max-width: 1100px; margin: 0 auto; padding: 2rem; }
        .overview-header { text-align: center; margin-bottom: 2.5rem; }
        .recipe-list { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 2rem; justify-items: center; }
        .recipe-card { background: #fff; border-radius: 18px; box-shadow: 0 6px 24px rgba(0,0,0,0.10); padding: 1.5rem 1rem 2rem 1rem; width: 100%; max-width: 260px; text-align: center; transition: transform 0.2s, box-shadow 0.2s; position: relative; }
        .recipe-card:hover { transform: translateY(-8px) scale(1.03); box-shadow: 0 12px 32px rgba(0,0,0,0.18); }
        .recipe-img { width: 100%; height: 140px; object-fit: cover; border-radius: 12px; margin-bottom: 1rem; }
        .recipe-title { font-size: 1.2rem; font-weight: 600; color: #8e24aa; margin-bottom: 0.7rem; }
        .view-btn { display: inline-block; margin-top: 0.5rem; padding: 0.5rem 1.2rem; background: #8e24aa; color: #fff; border-radius: 20px; text-decoration: none; font-weight: 500; transition: background 0.2s; }
        .view-btn:hover { background: #4a148c; }
    </style>
</head>
<body>
    <div class="container">
        <div class="overview-header">
            <h1>All Smoothie Recipes</h1>
            <p>Choose your favorite smoothie recipe below:</p>
        </div>
        <div class="recipe-list">
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" alt="Fruit Smoothie" class="recipe-img"/>
                <div class="recipe-title">Fruit Smoothie</div>
                <a href="main?action=recipe&type=smoothie&name=fruit-smoothie" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80" alt="Green Smoothie" class="recipe-img"/>
                <div class="recipe-title">Green Smoothie</div>
                <a href="main?action=recipe&type=smoothie&name=green-smoothie" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" alt="Protein Smoothie" class="recipe-img"/>
                <div class="recipe-title">Protein Smoothie</div>
                <a href="main?action=recipe&type=smoothie&name=protein-smoothie" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80" alt="Seed Smoothie" class="recipe-img"/>
                <div class="recipe-title">Seed Smoothie</div>
                <a href="main?action=recipe&type=smoothie&name=seed-smoothie" class="view-btn">View Recipe</a>
            </div>
        </div>
    </div>
    <%@ include file="../../../../component/footer.jsp" %>
</body>
</html> 