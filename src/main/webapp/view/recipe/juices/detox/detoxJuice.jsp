<%-- 
    Document   : detoxJuice
    Created on : Jun 16, 2025
    Author     : ASUS
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detox Juice Recipe</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>

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
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), var(--header-image);
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

        .list {
            list-style: none;
        }

        .list-item {
            padding: 0.5rem 0;
            border-bottom: 1px solid #eee;
        }

        .steps-list {
            list-style: none;
            counter-reset: step-counter;
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

        .tips-list {
            list-style: none;
        }

        .tips-item {
            margin-bottom: 0.5rem;
            padding-left: 1.5rem;
            position: relative;
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

            .recipe-header {
                padding: 2rem 0;
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
    <div class="recipe-header" style="--header-image: url('https://i.pinimg.com/736x/28/48/df/2848dfae78e5720edeaf7d79f96bc129.jpg')">
        <h1>How to Make Detox Juice</h1>
        <p>A nutrient-packed juice perfect for detox and energy boost</p>
    </div>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="../">Juices</a></li>
                <li class="breadcrumb-item active" aria-current="page">Detox Juice</li>
            </ol>
        </nav>

        <!-- Ingredients Section -->
        <div class="card">
            <h2 class="card-title">Ingredients</h2>
            <ul class="list">
                <li class="list-item">1 medium carrot, peeled</li>
                <li class="list-item">1 small cucumber</li>
                <li class="list-item">1 small tomato</li>
                <li class="list-item">1 celery stalk</li>
                <li class="list-item">1 handful spinach or kale</li>
                <li class="list-item">1/2 beetroot (optional, for color and nutrients)</li>
                <li class="list-item">1/2 lemon, juiced</li>
                <li class="list-item">Salt & black pepper to taste</li>
                <li class="list-item">Water (optional)</li>
            </ul>
        </div>

        <!-- Instructions Section -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Wash and chop all vegetables into small chunks.</li>
                <li class="step-item">Add everything to a blender with lemon juice and a splash of water (if needed).</li>
                <li class="step-item">Blend until smooth. Strain if you prefer a clear juice.</li>
                <li class="step-item">Season with salt and black pepper.</li>
                <li class="step-item">Serve chilled or over ice for best taste.</li>
            </ol>
        </div>

        <!-- Tips Section -->
        <div class="card">
            <div class="tips">
                <h3 class="tips-title">Pro Tips</h3>
                <ul class="tips-list">
                    <li class="tips-item">Use organic vegetables for the best health benefits.</li>
                    <li class="tips-item">Add a small piece of ginger or garlic for immune support.</li>
                    <li class="tips-item">Chill your veggies beforehand for a cold juice without ice.</li>
                    <li class="tips-item">Drink immediately to retain all nutrients and avoid oxidation.</li>
                </ul>
            </div>
        </div>

      <!-- Related Recipes Section -->
        <div class="related-recipes">
            <h2 class="related-recipes-title">You May Also Like</h2>
            <div class="recipe-grid">
                <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/db/ad/8c/dbad8c12effc13e2db636265ce33106a.jpg" alt="Tropical Punch" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Tropical Punch</h3>
                        <p class="recipe-description">A party favorite with mixed fruits and juice</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

               <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/36/d2/8a/36d28a0eb1ca5ec64e7f803a47a79d30.jpg" alt="Carrot Orange Juice" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Carrot Orange Juice</h3>
                        <p class="recipe-description">A sweet and tangy blend rich in vitamin C and beta-carotene</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/7e/a8/76/7ea876e176daed525556ff096436431a.jpg" alt="Apple Celery Juice" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Apple Celery Juice</h3>
                        <p class="recipe-description">A light, detoxifying juice that refreshes and revitalizes</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>


                <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/12/d2/c4/12d2c496bd55b5c7ddd7490ae4334c9f.jpg" alt="Green Juice" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Green Juice</h3>
                        <p class="recipe-description">A refreshing detox blend of greens and citrus</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer -->
        <%@ include file="../../../../../component/footer.jsp" %>
    </div>
</body>
</html>
