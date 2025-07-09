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
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://static01.nyt.com/images/2023/08/17/multimedia/ND-Tequila-Sunrise/LH-Sangria-tjvl-threeByTwoMediumAt2X.jpg');
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
  <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1510626176961-4b2c5c7e9ccf?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80')">
    <h1>How to Make a Tequila Sunrise</h1>
    <p>A vibrant and refreshing cocktail that looks like a sunrise</p>
  </div>

  <div class="container">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
      <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
        <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
            <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
            <li class="breadcrumb-item"><a href="../">Cocktails</a></li>
            <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
            <li class="breadcrumb-item active" aria-current="page">Tequila Sunrise</li>
      </ol>
    </nav>

    <!-- Ingredients -->
    <div class="card">
      <h2 class="card-title">Ingredients</h2>
      <ul class="list">
        <li class="list-item">2 oz (60ml) tequila</li>
        <li class="list-item">4 oz (120ml) orange juice</li>
        <li class="list-item">1/2 oz (15ml) grenadine syrup</li>
        <li class="list-item">Ice cubes</li>
        <li class="list-item">Orange slice and maraschino cherry for garnish</li>
      </ul>
    </div>

    <!-- Instructions -->
    <div class="card">
      <h2 class="card-title">Instructions</h2>
      <ol class="steps-list">
        <li class="step-item">Fill a tall glass with ice cubes.</li>
        <li class="step-item">Pour the tequila and orange juice over the ice.</li>
        <li class="step-item">Slowly pour grenadine syrup into the glass; it will settle at the bottom creating a sunrise effect.</li>
        <li class="step-item">Do not stir. Garnish with an orange slice and a maraschino cherry.</li>
      </ol>
    </div>

    <!-- Tips -->
    <div class="card">
      <div class="tips">
        <h3 class="tips-title">Pro Tips</h3>
        <ul class="tips-list">
          <li class="tips-item">Use fresh orange juice for the best flavor and color.</li>
          <li class="tips-item">Pour grenadine slowly to achieve the layered sunrise effect.</li>
          <li class="tips-item">Serve immediately to enjoy the visual presentation.</li>
        </ul>
      </div>
    </div>

    <!-- Related Recipes -->
    <div class="related-recipes">
      <h2 class="related-recipes-title">You May Also Like</h2>
      <div class="recipe-grid">
        <div class="recipe-card">
          <img src="https://chaloglass.vn/wp-content/uploads/20240426margarita-la-gi-ly-thuy-tinh-nao-dung-cocktail-margarita-dep-va-phu-hop-1-scaled.jpg" class="recipe-image" alt="Margarita" />
          <div class="recipe-content">
            <h3 class="recipe-name">Margarita</h3>
            <p class="recipe-description">A classic tequila cocktail with lime and salt</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/margarita.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
        <div class="recipe-card">
          <img src="https://www.allrecipes.com/thmb/KMfZaOrzMp7LYEvJYyJjk6UqL8E=/0x512/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/73287-mai-tai-ddmfs-hero-3x4-1001-44ffd41d2ea94e15ba63bac042cffac2.jpg" class="recipe-image" alt="Mai Tai" />
          <div class="recipe-content">
            <h3 class="recipe-name">Mai Tai</h3>
            <p class="recipe-description">A tropical rum-based cocktail</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/mai-tai.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
        <div class="recipe-card">
          <img src="https://res.cloudinary.com/htt8g4cd/images/w_848,h_565,c_scale/f_auto,q_auto/v1730839987/wp/03_23_Blue_Lagoon_Cocktail_HERO_AntonisAchilleos_1920x1280/03_23_Blue_Lagoon_Cocktail_HERO_AntonisAchilleos_1920x1280.jpg?_i=AA" class="recipe-image" alt="Blue Lagoon" />
          <div class="recipe-content">
            <h3 class="recipe-name">Blue Lagoon</h3>
            <p class="recipe-description">A refreshing blue vodka cocktail</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/blue-lagoon.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <%--<%@include file="../../component/footer.jsp" %>--%>
</body>
</html>