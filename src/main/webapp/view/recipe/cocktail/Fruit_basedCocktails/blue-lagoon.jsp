<%-- 
    Document   : blue-lagoon
    Created on : Jun 18, 2025, 12:17:49 AM
    Author     : anhth
--%>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mojito Recipe</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* Reset & Base Styles */
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        .recipe-header {
            text-align: center;
            padding: 3rem 0;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://tse2.mm.bing.net/th/id/OIP.wjiMApVtGjJhNnENWQuuxQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3');
            background-size: cover;
            background-position: center;
            color: white;
            margin-bottom: 3rem;
        }

        .recipe-header h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .recipe-header p {
            font-size: 1.2rem;
            opacity: 0.9;
        }

        .card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .card-title {
            color: #2c3e50;
            margin-bottom: 1.5rem;
            font-size: 2rem;
        }

        .list, .steps-list, .tips-list {
            list-style: none;
        }

        .list-item, .tips-item {
            padding: 0.5rem 0;
            border-bottom: 1px solid #eee;
        }

        .step-item {
            margin-bottom: 1.5rem;
            padding-left: 3rem;
            position: relative;
        }

        .step-item::before {
            counter-increment: step-counter;
            content: counter(step-counter);
            position: absolute;
            left: 0;
            top: 0;
            width: 2rem;
            height: 2rem;
            background: #2c3e50;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .tips {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
            margin-top: 2rem;
        }

        .tips-title {
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .tips-item::before {
            content: "\2022";
            color: #2c3e50;
            position: absolute;
            left: 0;
        }

        .related-recipes {
            margin-top: 4rem;
        }

        .related-recipes-title {
            color: #2c3e50;
            font-size: 2rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        .recipe-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .recipe-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .recipe-card:hover {
            transform: translateY(-5px);
        }

        .recipe-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .recipe-content {
            padding: 1.5rem;
        }

        .recipe-name {
            font-size: 1.2rem;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }

        .recipe-description {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .recipe-link {
            display: inline-block;
            color: #2c3e50;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .recipe-link:hover {
            color: #1a252f;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .recipe-header h1 {
                font-size: 2rem;
            }

            .recipe-grid {
                grid-template-columns: 1fr;
            }
        }
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


  <!-- Recipe Header -->
  <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1590080874692-845c65b7aefd?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80')">
    <h1>How to Make a Blue Lagoon</h1>
    <p>A bright, citrusy cocktail with vodka, blue curaçao, and lemon</p>
  </div>

  <div class="container">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
      <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
        <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
            <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
            <li class="breadcrumb-item"><a href="../">Cocktails</a></li>
            <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
            <li class="breadcrumb-item active" aria-current="page">Blue Lagoon</li>
      </ol>
    </nav>

    <!-- Ingredients -->
    <div class="card">
      <h2 class="card-title">Ingredients</h2>
      <ul class="list">
        <li class="list-item">1 oz (30ml) vodka</li>
        <li class="list-item">1 oz (30ml) blue curaçao</li>
        <li class="list-item">4 oz (120ml) lemonade</li>
        <li class="list-item">Ice cubes</li>
        <li class="list-item">Lemon slice or cherry for garnish</li>
      </ul>
    </div>

    <!-- Instructions -->
    <div class="card">
      <h2 class="card-title">Instructions</h2>
      <ol class="steps-list">
        <li class="step-item">Fill a highball glass with ice cubes.</li>
        <li class="step-item">Pour in the vodka and blue curaçao.</li>
        <li class="step-item">Top with lemonade and stir gently.</li>
        <li class="step-item">Garnish with a lemon slice or cherry.</li>
      </ol>
    </div>

    <!-- Tips -->
    <div class="card">
      <div class="tips">
        <h3 class="tips-title">Pro Tips</h3>
        <ul class="tips-list">
          <li class="tips-item">Use lemon-lime soda instead of lemonade for added fizz.</li>
          <li class="tips-item">Try a splash of lime juice for extra tartness.</li>
          <li class="tips-item">Serve in a chilled glass for best presentation.</li>
        </ul>
      </div>
    </div>

    <!-- Related Recipes -->
    <div class="related-recipes">
      <h2 class="related-recipes-title">You May Also Like</h2>
      <div class="recipe-grid">
        <div class="recipe-card">
          <img src="https://www.bartender.edu.vn/wp-content/uploads/2021/01/cocktail-cosmopolitan.jpg" class="recipe-image" alt="Blue Hawaii" />
          <div class="recipe-content">
            <h3 class="recipe-name">Cosmopolitan</h3>
            <p class="recipe-description">A chic vodka-based cocktail with cranberry and lime</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/cosmopolitan.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
        <div class="recipe-card">
          <img src="https://amcollege.edu.vn/wp-content/uploads/2023/05/so-luoc-manhattan-cocktail.jpg" class="recipe-image" alt="Electric Lemonade" />
          <div class="recipe-content">
            <h3 class="recipe-name">Manhattan</h3>
            <p class="recipe-description">A strong and smooth whiskey cocktail with sweet vermouth</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/manhattan.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
        <div class="recipe-card">
          <img src="https://dayphache.edu.vn/wp-content/uploads/2015/11/cocktail-margaritaa.jpg" class="recipe-image" alt="Ocean Breeze" />
          <div class="recipe-content">
            <h3 class="recipe-name">Margarita</h3>
            <p class="recipe-description">A tangy mix of tequila, lime juice, and triple sec</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/margarita.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <%--<%@include file="../../component/footer.jsp" %>--%>
</body>
</html>
