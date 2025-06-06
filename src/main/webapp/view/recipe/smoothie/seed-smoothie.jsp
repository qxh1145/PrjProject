<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seed Smoothie Recipes</title>
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
    <!-- Recipe Header -->
    <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1590301157890-4810ed352733?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <h1>Nutritious Seed Smoothies</h1>
        <p>Power-packed smoothies with healthy seeds</p>
    </div>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item"><a href="../">Smoothies</a></li>
                <li class="breadcrumb-item" style="margin: 0 10px;">/</li>
                <li class="breadcrumb-item active" aria-current="page">Seed Smoothie</li>
            </ol>
        </nav>

        <!-- Basic Recipe Section -->
        <div class="card">
            <h2 class="card-title">Super Seed Power Smoothie</h2>
            <div class="ingredients">
                <h3>Ingredients</h3>
                <ul class="list">
                    <li class="list-item">2 tablespoons chia seeds</li>
                    <li class="list-item">1 tablespoon flax seeds</li>
                    <li class="list-item">1 tablespoon pumpkin seeds</li>
                    <li class="list-item">1 banana</li>
                    <li class="list-item">1 cup almond milk</li>
                    <li class="list-item">1 tablespoon honey or maple syrup</li>
                    <li class="list-item">1/2 teaspoon cinnamon</li>
                    <li class="list-item">4-5 ice cubes</li>
                </ul>
            </div>
        </div>

        <!-- Instructions Section -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Soak chia seeds in 1/4 cup water for 10 minutes.</li>
                <li class="step-item">Grind flax seeds in a coffee grinder or spice grinder.</li>
                <li class="step-item">Add soaked chia seeds, ground flax seeds, and all other ingredients to your blender.</li>
                <li class="step-item">Blend on high speed until smooth and creamy (about 1-2 minutes).</li>
                <li class="step-item">Taste and adjust sweetness if needed.</li>
                <li class="step-item">Pour into glasses and top with additional seeds if desired.</li>
                <li class="step-item">Serve immediately for best texture.</li>
            </ol>
        </div>

        <!-- Tips Section -->
        <div class="card">
            <div class="tips">
                <h3 class="tips-title">Pro Tips</h3>
                <ul class="tips-list">
                    <li class="tips-item">Always grind flax seeds for better nutrient absorption</li>
                    <li class="tips-item">Store seeds in the refrigerator to keep them fresh</li>
                    <li class="tips-item">Add a handful of spinach for extra nutrients</li>
                    <li class="tips-item">Use frozen banana for a thicker smoothie</li>
                    <li class="tips-item">Try different plant-based milk alternatives</li>
                </ul>
            </div>
        </div>

        <!-- Variations Section -->
        <div class="card">
            <h2 class="card-title">Popular Variations</h2>
            <div class="recipe-grid">
                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1590301157890-4810ed352733" alt="Berry Seed Blast" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Berry Seed Blast</h3>
                        <p class="recipe-description">Mixed berries with chia and hemp seeds</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1590301157890-4810ed352733" alt="Green Seed Power" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Green Seed Power</h3>
                        <p class="recipe-description">Spinach and kale with mixed seeds</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1590301157890-4810ed352733" alt="Tropical Seed Fusion" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Tropical Seed Fusion</h3>
                        <p class="recipe-description">Mango and pineapple with sunflower seeds</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
</body>
</html> 