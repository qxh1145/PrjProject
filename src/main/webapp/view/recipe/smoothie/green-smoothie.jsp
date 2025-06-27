<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Smoothie Recipes (Vegetarian)</title>
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
    <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1638176066666-ffb9f013f7dd?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <h1>Green Smoothies</h1>
        <p>Nutrient-rich vegetarian smoothies for a healthy lifestyle</p>
    </div>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item"><a href="../">Smoothies</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item active" aria-current="page">Green Smoothie</li>
            </ol>
        </nav>

        <!-- Basic Recipe Section -->
        <div class="card">
            <h2 class="card-title">Classic Green Goddess Smoothie</h2>
            <div class="ingredients">
                <h3>Ingredients</h3>
                <ul class="list">
                    <li class="list-item">2 cups fresh spinach</li>
                    <li class="list-item">1 cup kale, stems removed</li>
                    <li class="list-item">1 green apple, cored</li>
                    <li class="list-item">1/2 cucumber</li>
                    <li class="list-item">1/2 lemon, juiced</li>
                    <li class="list-item">1 inch piece of ginger</li>
                    <li class="list-item">1 cup coconut water</li>
                    <li class="list-item">1 tablespoon honey or agave (optional)</li>
                    <li class="list-item">4-5 ice cubes</li>
                </ul>
            </div>
        </div>

        <!-- Instructions Section -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Wash all produce thoroughly.</li>
                <li class="step-item">Remove stems from kale and roughly chop.</li>
                <li class="step-item">Core the apple and cut into chunks.</li>
                <li class="step-item">Peel and slice the ginger.</li>
                <li class="step-item">Add spinach, kale, apple, cucumber, lemon juice, and ginger to the blender.</li>
                <li class="step-item">Pour in coconut water and add honey if using.</li>
                <li class="step-item">Add ice cubes and blend until smooth and creamy.</li>
                <li class="step-item">Taste and adjust sweetness if needed.</li>
            </ol>
        </div>

        <!-- Tips Section -->
        <div class="card">
            <div class="tips">
                <h3 class="tips-title">Pro Tips</h3>
                <ul class="tips-list">
                    <li class="tips-item">Blend greens and liquid first for smoother texture</li>
                    <li class="tips-item">Use frozen fruit instead of ice for more flavor</li>
                    <li class="tips-item">Add mint leaves for fresh flavor</li>
                    <li class="tips-item">Rotate your greens for varied nutrition</li>
                    <li class="tips-item">Use ripe fruits for natural sweetness</li>
                </ul>
            </div>
        </div>

        <!-- Variations Section -->
        <div class="card">
            <h2 class="card-title">Popular Variations</h2>
            <div class="recipe-grid">
                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1638176066666-ffb9f013f7dd" alt="Tropical Green" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Tropical Green</h3>
                        <p class="recipe-description">Pineapple and mango with spinach</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1638176066666-ffb9f013f7dd" alt="Green Detox" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Green Detox</h3>
                        <p class="recipe-description">Celery, cucumber, and green apple blend</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1638176066666-ffb9f013f7dd" alt="Minty Green" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Minty Green</h3>
                        <p class="recipe-description">Fresh mint with greens and lime</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
</body>
</html> 