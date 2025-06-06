<%-- 
    Document   : fruitPunch
    Created on : Jun 6, 2025, 11:03:09 PM
    Author     : anhth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recipe Fruit Punch</title>
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

            /* Layout Components */
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 2rem;
            }

            /* Header Component */
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

            /* Card Component */
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

            /* List Components */
            .list {
                list-style: none;
            }

            .list-item {
                padding: 0.5rem 0;
                border-bottom: 1px solid #eee;
            }

            /* Steps List Component */
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

            /* Tips Component */
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

            /* Related Recipes Component */
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

            /* Responsive Design */
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
        <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1570158268183-d296b2892211?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80')">
            <h1>How to Make a Fruit Punch</h1>
            <p>A sweet and colorful non-alcoholic party drink for all ages</p>
        </div>

        <div class="container">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                    <li class="breadcrumb-item"><a href="../../indexLogin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="../">Cocktails</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Fruit Punch</li>
                </ol>
            </nav>

            <!-- Ingredients -->
            <div class="card">
                <h2 class="card-title">Ingredients</h2>
                <ul class="list">
                    <li class="list-item">1 cup orange juice</li>
                    <li class="list-item">1 cup pineapple juice</li>
                    <li class="list-item">1 cup cranberry juice</li>
                    <li class="list-item">1 cup lemon-lime soda or sparkling water</li>
                    <li class="list-item">1/2 cup grenadine (optional for color)</li>
                    <li class="list-item">Fresh fruit slices (orange, lemon, lime, berries)</li>
                    <li class="list-item">Ice cubes</li>
                </ul>
            </div>

            <!-- Instructions -->
            <div class="card">
                <h2 class="card-title">Instructions</h2>
                <ol class="steps-list">
                    <li class="step-item">In a large pitcher or punch bowl, mix orange, pineapple, and cranberry juice.</li>
                    <li class="step-item">Add grenadine for color, if using, and stir well.</li>
                    <li class="step-item">Just before serving, add lemon-lime soda or sparkling water.</li>
                    <li class="step-item">Add ice and fruit slices to the punch for decoration and extra flavor.</li>
                    <li class="step-item">Serve chilled in glasses with extra fruit for garnish.</li>
                </ol>
            </div>

            <!-- Tips -->
            <div class="card">
                <div class="tips">
                    <h3 class="tips-title">Pro Tips</h3>
                    <ul class="tips-list">
                        <li class="tips-item">Chill the juices in advance for best taste.</li>
                        <li class="tips-item">Use sparkling water instead of soda for a less sweet version.</li>
                        <li class="tips-item">Customize with your favorite seasonal fruits.</li>
                    </ul>
                </div>
            </div>

            <!-- Related Recipes -->
            <div class="related-recipes">
                <h2 class="related-recipes-title">You May Also Like</h2>
                <div class="recipe-grid">
                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1570158268183-d296b2892211?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80" class="recipe-image" alt="Fruit Punch" />
                        <div class="recipe-content">
                            <h3 class="recipe-name">Fruit Punch</h3>
                            <p class="recipe-description">A fun and fruity beverage for any occasion</p>
                            <a href="#" class="recipe-link">View Recipe →</a>
                        </div>
                    </div>
                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80" class="recipe-image" alt="Sunset Cooler" />
                        <div class="recipe-content">
                            <h3 class="recipe-name">Sunset Cooler</h3>
                            <p class="recipe-description">A colorful and refreshing tropical drink</p>
                            <a href="#" class="recipe-link">View Recipe →</a>
                        </div>
                    </div>
                    <div class="recipe-card">
                        <img src="https://images.unsplash.com/photo-1524594157363-9f8f1ecb6ee2?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=80" class="recipe-image" alt="Blue Lagoon" />
                        <div class="recipe-content">
                            <h3 class="recipe-name">Blue Lagoon</h3>
                            <p class="recipe-description">A refreshing blue vodka cocktail</p>
                            <a href="#" class="recipe-link">View Recipe →</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="../../component/footer.jsp" %>
    </body>
</html>
