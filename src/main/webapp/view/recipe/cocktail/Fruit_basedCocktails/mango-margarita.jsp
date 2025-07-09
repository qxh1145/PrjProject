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
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('https://th.bing.com/th/id/R.93a9a34aacaaa384424974c3229e74f5?rik=MotW1xoDWJZx4g&riu=http%3a%2f%2fsharkninja-cookingcircle.s3.eu-west-1.amazonaws.com%2fwp-content%2fuploads%2f2022%2f10%2f18154121%2fMango-Margarita-2220x1000.jpg&ehk=w1UPJTwi7rT0qjU2FXNJFTZaXugFOBzAgxnS21bQs8k%3d&risl=&pid=ImgRaw&r=0');
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
  <div class="recipe-header" style="--header-image: url('https://th.bing.com/th/id/R.93a9a34aacaaa384424974c3229e74f5?rik=MotW1xoDWJZx4g&riu=http%3a%2f%2fsharkninja-cookingcircle.s3.eu-west-1.amazonaws.com%2fwp-content%2fuploads%2f2022%2f10%2f18154121%2fMango-Margarita-2220x1000.jpg&ehk=w1UPJTwi7rT0qjU2FXNJFTZaXugFOBzAgxnS21bQs8k%3d&risl=&pid=ImgRaw&r=0')">
    <h1>How to Make a Mango Margarita</h1>
    <p>A tropical twist on the classic margarita with fresh mango</p>
  </div>

  <div class="container">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
      <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
        <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
            <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
            <li class="breadcrumb-item"><a href="../">Cocktails</a></li>
            <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
            <li class="breadcrumb-item active" aria-current="page">Mango Margarita</li>
      </ol>
    </nav>

    <!-- Ingredients -->
    <div class="card">
      <h2 class="card-title">Ingredients</h2>
      <ul class="list">
        <li class="list-item">2 oz (60ml) tequila</li>
        <li class="list-item">1 oz (30ml) triple sec</li>
        <li class="list-item">1 oz (30ml) fresh lime juice</li>
        <li class="list-item">1 oz (30ml) mango puree</li>
        <li class="list-item">Ice cubes</li>
        <li class="list-item">Salt or sugar for rimming glass (optional)</li>
        <li class="list-item">Lime wedge or mango slice for garnish</li>
      </ul>
    </div>

    <!-- Instructions -->
    <div class="card">
      <h2 class="card-title">Instructions</h2>
      <ol class="steps-list">
        <li class="step-item">If desired, rim the glass with salt or sugar by rubbing a lime wedge around the rim and dipping it into salt or sugar.</li>
        <li class="step-item">Fill a shaker with ice cubes.</li>
        <li class="step-item">Add tequila, triple sec, fresh lime juice, and mango puree.</li>
        <li class="step-item">Shake vigorously until well chilled.</li>
        <li class="step-item">Strain into the prepared glass filled with fresh ice.</li>
        <li class="step-item">Garnish with a lime wedge or mango slice.</li>
      </ol>
    </div>

    <!-- Tips -->
    <div class="card">
      <div class="tips">
        <h3 class="tips-title">Pro Tips</h3>
        <ul class="tips-list">
          <li class="tips-item">Use ripe mangoes or quality mango puree for the best flavor.</li>
          <li class="tips-item">Adjust sweetness by adding a splash of simple syrup if needed.</li>
          <li class="tips-item">Try blending the ingredients with ice for a frozen version.</li>
        </ul>
      </div>
    </div>

    <!-- Related Recipes -->
    <div class="related-recipes">
      <h2 class="related-recipes-title">You May Also Like</h2>
      <div class="recipe-grid">
        <div class="recipe-card">
          <img src="https://dayphache.edu.vn/wp-content/uploads/2015/11/cocktail-margaritaa.jpg" class="recipe-image" alt="Classic Margarita" />
          <div class="recipe-content">
            <h3 class="recipe-name">Classic Margarita</h3>
            <p class="recipe-description">The timeless tequila cocktail with lime</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/margarita.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
        <div class="recipe-card">
          <img src="https://www.allrecipes.com/thmb/mzqfZC3tKFI-ZCWdYjfS_yvIbeA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/107945-virgin-strawberry-daiquiri-ddmfs-hero-4x3-e12433432d6543a6846f754b0f298f09.jpg" class="recipe-image" alt="Pineapple Margarita" />
          <div class="recipe-content">
            <h3 class="recipe-name">Strawberry Margarita</h3>
            <p class="recipe-description">Sweet and tangy with fresh strawberry juice</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/strawberry-daiquiri.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
        <div class="recipe-card">
          <img src="https://static01.nyt.com/images/2023/08/17/multimedia/ND-Tequila-Sunrise/LH-Sangria-tjvl-threeByTwoMediumAt2X.jpg" class="recipe-image" alt="Spicy Margarita" />
          <div class="recipe-content">
            <h3 class="recipe-name">Tequila Sunrise</h3>
            <p class="recipe-description">Add a kick with jalapeño and chili powder rim</p>
            <a href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/tequila-sunrise.jsp" class="recipe-link">View Recipe →</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <%--<%@include file="../../component/footer.jsp" %>--%>
</body>
</html>