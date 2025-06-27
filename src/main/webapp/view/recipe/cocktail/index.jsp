<%@ include file="../../../../component/header.jsp" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Cocktail Recipes</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        body { background: linear-gradient(120deg, #f5f5f5 60%, #ffe082 100%); color: #333; font-family: 'Poppins', sans-serif; padding-top: 70px; }
        .container { max-width: 1100px; margin: 0 auto; padding: 2rem; }
        .overview-header { text-align: center; margin-bottom: 2.5rem; }
        .recipe-list { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 2rem; justify-items: center; }
        .recipe-card { background: #fff; border-radius: 18px; box-shadow: 0 6px 24px rgba(0,0,0,0.10); padding: 1.5rem 1rem 2rem 1rem; width: 100%; max-width: 260px; text-align: center; transition: transform 0.2s, box-shadow 0.2s; position: relative; }
        .recipe-card:hover { transform: translateY(-8px) scale(1.03); box-shadow: 0 12px 32px rgba(0,0,0,0.18); }
        .recipe-img { width: 100%; height: 140px; object-fit: cover; border-radius: 12px; margin-bottom: 1rem; }
        .recipe-title { font-size: 1.2rem; font-weight: 600; color: #ff9800; margin-bottom: 0.7rem; }
        .view-btn { display: inline-block; margin-top: 0.5rem; padding: 0.5rem 1.2rem; background: #ff9800; color: #fff; border-radius: 20px; text-decoration: none; font-weight: 500; transition: background 0.2s; }
        .view-btn:hover { background: #e65100; }
    </style>
</head>
<body>
    <div class="container">
        <div class="overview-header">
            <h1>All Cocktail Recipes</h1>
            <p>Choose your favorite cocktail recipe below:</p>
        </div>
        <div class="recipe-list">
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1514361892635-cebb9b6c7ca5?auto=format&fit=crop&w=400&q=80" alt="Cosmopolitan" class="recipe-img"/>
                <div class="recipe-title">Cosmopolitan</div>
                <a href="main?action=recipe&type=cocktail&name=cosmopolitan" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" alt="Manhattan" class="recipe-img"/>
                <div class="recipe-title">Manhattan</div>
                <a href="main?action=recipe&type=cocktail&name=manhattan" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80" alt="Margarita" class="recipe-img"/>
                <div class="recipe-title">Margarita</div>
                <a href="main?action=recipe&type=cocktail&name=margarita" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" alt="Martini" class="recipe-img"/>
                <div class="recipe-title">Martini</div>
                <a href="main?action=recipe&type=cocktail&name=martini" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80" alt="Mojito" class="recipe-img"/>
                <div class="recipe-title">Mojito</div>
                <a href="main?action=recipe&type=cocktail&name=mojito" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80" alt="Negroni" class="recipe-img"/>
                <div class="recipe-title">Negroni</div>
                <a href="main?action=recipe&type=cocktail&name=negroni" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" alt="Whiskey Sour" class="recipe-img"/>
                <div class="recipe-title">Whiskey Sour</div>
                <a href="main?action=recipe&type=cocktail&name=whiskey-sour" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1514361892635-cebb9b6c7ca5?auto=format&fit=crop&w=400&q=80" alt="Blue Lagoon" class="recipe-img"/>
                <div class="recipe-title">Blue Lagoon</div>
                <a href="main?action=recipe&type=cocktail&name=blue-lagoon" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" alt="Mai Tai" class="recipe-img"/>
                <div class="recipe-title">Mai Tai</div>
                <a href="main?action=recipe&type=cocktail&name=mai-tai" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80" alt="Mango Margarita" class="recipe-img"/>
                <div class="recipe-title">Mango Margarita</div>
                <a href="main?action=recipe&type=cocktail&name=mango-margarita" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" alt="Strawberry Daiquiri" class="recipe-img"/>
                <div class="recipe-title">Strawberry Daiquiri</div>
                <a href="main?action=recipe&type=cocktail&name=strawberry-daiquiri" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1514361892635-cebb9b6c7ca5?auto=format&fit=crop&w=400&q=80" alt="Tequila Sunrise" class="recipe-img"/>
                <div class="recipe-title">Tequila Sunrise</div>
                <a href="main?action=recipe&type=cocktail&name=tequila-sunrise" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" alt="Fruit Punch" class="recipe-img"/>
                <div class="recipe-title">Fruit Punch</div>
                <a href="main?action=recipe&type=cocktail&name=fruit-punch" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80" alt="Nojito" class="recipe-img"/>
                <div class="recipe-title">Nojito</div>
                <a href="main?action=recipe&type=cocktail&name=nojito" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" alt="Shirley Temple" class="recipe-img"/>
                <div class="recipe-title">Shirley Temple</div>
                <a href="main?action=recipe&type=cocktail&name=shirley-temple" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80" alt="Sunset Cooler" class="recipe-img"/>
                <div class="recipe-title">Sunset Cooler</div>
                <a href="main?action=recipe&type=cocktail&name=sunset-cooler" class="view-btn">View Recipe</a>
            </div>
            <div class="recipe-card">
                <img src="https://images.unsplash.com/photo-1514361892635-cebb9b6c7ca5?auto=format&fit=crop&w=400&q=80" alt="Virgin Mojito" class="recipe-img"/>
                <div class="recipe-title">Virgin Mojito</div>
                <a href="main?action=recipe&type=cocktail&name=virgin-mojito" class="view-btn">View Recipe</a>
            </div>
        </div>
    </div>
    <%@ include file="../../../../component/footer.jsp" %>
</body>
</html> 