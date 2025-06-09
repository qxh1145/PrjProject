<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Classic Hot Chocolate</title>
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
                content: "?";
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
        <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1615484477870-0ef3aa6baf9d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
            <h1>How to Make Classic Hot Chocolate</h1>
            <p>Rich, creamy, and comforting chocolate drink for cozy days</p>
        </div>

        <div class="container">
            <!-- Ingredients Section -->
            <div class="card">
                <h2 class="card-title">Ingredients</h2>
                <ul class="list">
                    <li class="list-item">2 cups (480ml) whole milk</li>
                    <li class="list-item">2 tablespoons unsweetened cocoa powder</li>
                    <li class="list-item">2 tablespoons sugar (adjust to taste)</li>
                    <li class="list-item">1/4 teaspoon vanilla extract</li>
                    <li class="list-item">Pinch of salt</li>
                    <li class="list-item">Optional: Whipped cream or marshmallows</li>
                </ul>
            </div>

            <!-- Instructions Section -->
            <div class="card">
                <h2 class="card-title">Instructions</h2>
                <ol class="steps-list">
                    <li class="step-item">In a saucepan, mix cocoa powder, sugar, salt, and 2 tablespoons of milk to form a paste.</li>
                    <li class="step-item">Add remaining milk gradually while whisking to ensure smooth texture.</li>
                    <li class="step-item">Place over medium heat and stir until hot but not boiling.</li>
                    <li class="step-item">Remove from heat and stir in vanilla extract.</li>
                    <li class="step-item">Pour into mugs and top with whipped cream or marshmallows if desired.</li>
                    <li class="step-item">Serve immediately and enjoy!</li>
                </ol>
            </div>

            <!-- Tips Section -->
            <div class="card">
                <div class="tips">
                    <h3 class="tips-title">Pro Tips</h3>
                    <ul class="tips-list">
                        <li class="tips-item">Use high-quality cocoa for best flavor</li>
                        <li class="tips-item">Add cinnamon or nutmeg for extra warmth</li>
                        <li class="tips-item">Try substituting milk with oat or almond milk</li>
                        <li class="tips-item">Use chocolate chips for a richer version</li>
                        <li class="tips-item">Heat gently to avoid scalding the milk</li>
                    </ul>
                </div>
            </div>

            <!-- Related Recipes Section -->
            <div class="related-recipes">
                <h2 class="related-recipes-title">You May Also Like</h2>
                <div class="recipe-grid">
                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1601979031925-7459d3e2ae6a?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Spicy Hot Chocolate" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Spicy Hot Chocolate</h3>
                            <p class="recipe-description">Chocolate with a kick of chili and cinnamon</p>
                            <a href="#" class="recipe-link">View Recipe ?</a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1619158401205-749b3e7a39d3?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Mint Hot Chocolate" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Mint Hot Chocolate</h3>
                            <p class="recipe-description">A refreshing cocoa blend with mint</p>
                            <a href="#" class="recipe-link">View Recipe ?</a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1634476015327-7d9a2b1dd61f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="White Hot Chocolate" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">White Hot Chocolate</h3>
                            <p class="recipe-description">Sweet and creamy drink made with white chocolate</p>
                            <a href="#" class="recipe-link">View Recipe ?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
