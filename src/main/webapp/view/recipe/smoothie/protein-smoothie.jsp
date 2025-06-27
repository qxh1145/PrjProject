<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Protein Smoothie Recipes</title>
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
    <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1543362906-acfc16c67564?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <h1>Protein Smoothies</h1>
        <p>Power-packed smoothies for muscle recovery and growth</p>
    </div>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item"><a href="../">Smoothies</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item active" aria-current="page">Protein Smoothie</li>
            </ol>
        </nav>

        <!-- Basic Recipe Section -->
        <div class="card">
            <h2 class="card-title">Chocolate Protein Power Smoothie</h2>
            <div class="ingredients">
                <h3>Ingredients</h3>
                <ul class="list">
                    <li class="list-item">1 scoop chocolate protein powder</li>
                    <li class="list-item">1 banana</li>
                    <li class="list-item">1 cup Greek yogurt</li>
                    <li class="list-item">1 tablespoon almond butter</li>
                    <li class="list-item">1 tablespoon cocoa powder</li>
                    <li class="list-item">1 cup almond milk</li>
                    <li class="list-item">1 tablespoon chia seeds</li>
                    <li class="list-item">1 handful of spinach (optional)</li>
                    <li class="list-item">4-5 ice cubes</li>
                </ul>
            </div>
        </div>

        <!-- Instructions Section -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Add almond milk and Greek yogurt to the blender first.</li>
                <li class="step-item">Add protein powder, cocoa powder, and chia seeds.</li>
                <li class="step-item">Add banana, almond butter, and spinach if using.</li>
                <li class="step-item">Add ice cubes.</li>
                <li class="step-item">Blend on high speed until smooth and creamy (about 1-2 minutes).</li>
                <li class="step-item">Check consistency and add more liquid if needed.</li>
                <li class="step-item">Pour into glasses and serve immediately.</li>
            </ol>
        </div>

        <!-- Tips Section -->
        <div class="card">
            <div class="tips">
                <h3 class="tips-title">Pro Tips</h3>
                <ul class="tips-list">
                    <li class="tips-item">Use frozen banana for a thicker texture</li>
                    <li class="tips-item">Add oats for extra sustained energy</li>
                    <li class="tips-item">Use plant-based protein for vegan option</li>
                    <li class="tips-item">Add coffee for pre-workout boost</li>
                    <li class="tips-item">Include collagen powder for extra protein</li>
                </ul>
            </div>
        </div>

        <!-- Variations Section -->
        <div class="card">
            <h2 class="card-title">Popular Variations</h2>
            <div class="recipe-grid">
                <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/68/44/eb/6844eb33375f89dc0ef9a6f7c0ebff3f.jpg" alt="Vanilla Berry Protein" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Vanilla Berry Protein</h3>
                        <p class="recipe-description">Mixed berries with vanilla protein</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/e9/d2/fc/e9d2fcdd148a7b7e105bc2f48c1a9790.jpg" alt="Peanut Butter Power" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Peanut Butter Power</h3>
                        <p class="recipe-description">Protein-rich peanut butter blend</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/78/b7/62/78b7627ac31e320eb1ac7192d98a19d1.jpg" alt="Coffee Protein Kick" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Coffee Protein Kick</h3>
                        <p class="recipe-description">Pre-workout coffee protein blend</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
</body>
</html> 