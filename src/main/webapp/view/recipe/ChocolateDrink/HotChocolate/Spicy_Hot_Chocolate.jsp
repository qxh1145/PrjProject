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
        <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1604328698692-f76e3052a29e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80')">
            <h1>How to Make Spicy Hot Chocolate</h1>
            <p>A bold and warming twist with a kick of spice</p>
        </div>

        <div class="container">
            <!-- Ingredients Section -->
            <div class="card">
                <h2 class="card-title">Ingredients</h2>
                <ul class="list">
                    <li class="list-item">2 cups (480ml) milk</li>
                    <li class="list-item">1/2 cup (90g) dark chocolate chips or chopped chocolate</li>
                    <li class="list-item">2 tbsp unsweetened cocoa powder</li>
                    <li class="list-item">1/2 tsp ground cinnamon</li>
                    <li class="list-item">1/8 tsp cayenne pepper (adjust to taste)</li>
                    <li class="list-item">1?2 tbsp sugar or sweetener of choice</li>
                    <li class="list-item">Whipped cream or marshmallows (optional)</li>
                </ul>
            </div>

            <!-- Instructions Section -->
            <div class="card">
                <h2 class="card-title">Instructions</h2>
                <ol class="steps-list">
                    <li class="step-item">In a saucepan over medium heat, warm the milk until steaming.</li>
                    <li class="step-item">Whisk in the cocoa powder, sugar, cinnamon, and cayenne pepper until fully blended.</li>
                    <li class="step-item">Add the chocolate and stir until melted and smooth.</li>
                    <li class="step-item">Taste and adjust sweetness or spice if needed.</li>
                    <li class="step-item">Pour into mugs and top with whipped cream or marshmallows if desired.</li>
                    <li class="step-item">Serve immediately and enjoy the warm, spicy flavor.</li>
                </ol>
            </div>

            <!-- Tips Section -->
            <div class="card">
                <div class="tips">
                    <h3 class="tips-title">Pro Tips</h3>
                    <ul class="tips-list">
                        <li class="tips-item">Start with less cayenne and increase to your heat preference</li>
                        <li class="tips-item">Add a dash of vanilla extract for deeper flavor</li>
                        <li class="tips-item">Mexican chocolate can be used for a more authentic taste</li>
                        <li class="tips-item">Top with a sprinkle of cinnamon or chili powder for garnish</li>
                        <li class="tips-item">Pairs perfectly with churros or cinnamon pastries</li>
                    </ul>
                </div>
            </div>

            <!-- Related Recipes Section -->
            <div class="related-recipes">
                <h2 class="related-recipes-title">You May Also Like</h2>
                <div class="recipe-grid">
                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1610276196757-3cd7be0e92b2?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Salted Caramel Hot Chocolate" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Salted Caramel Hot Chocolate</h3>
                            <p class="recipe-description">A rich blend of chocolate and sweet-salty caramel</p>
                            <a href="#" class="recipe-link">View Recipe ?</a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1607082349566-bb2b8e8dc240?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Mint Hot Chocolate" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Mint Hot Chocolate</h3>
                            <p class="recipe-description">Cooling mint meets velvety chocolate</p>
                            <a href="#" class="recipe-link">View Recipe ?</a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1612801412679-63c2a2a48e2d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Mexican Mocha" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Mexican Mocha</h3>
                            <p class="recipe-description">Coffee with a hint of spice and chocolate</p>
                            <a href="#" class="recipe-link">View Recipe ?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
