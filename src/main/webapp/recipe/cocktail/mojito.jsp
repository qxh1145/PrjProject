<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Template</title>
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
    <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1603052875768-0e62d321ba1a?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <h1>How to Make a Classic Mojito</h1>
        <p>A refreshing minty cocktail perfect for summer</p>
    </div>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="../../indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="../">Cocktail</a></li>
                <li class="breadcrumb-item active" aria-current="page">Mojito</li>
            </ol>
        </nav>

        <!-- Ingredients Section -->
        <div class="card">
            <h2 class="card-title">Ingredients</h2>
            <ul class="list">
                <li class="list-item">10 fresh mint leaves</li>
                <li class="list-item">1/2 lime, cut into 4 wedges</li>
                <li class="list-item">2 tablespoons white sugar, or to taste</li>
                <li class="list-item">1 cup ice cubes</li>
                <li class="list-item">1 1/2 ounces white rum</li>
                <li class="list-item">1/2 cup club soda</li>
            </ul>
        </div>

        <!-- Instructions Section -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Place mint leaves and 1 lime wedge into a sturdy glass. Use a muddler to crush them and release the mint oils and lime juice.</li>
                <li class="step-item">Add 2 more lime wedges and the sugar, and muddle again to release the lime juice.</li>
                <li class="step-item">Fill the glass with ice. Pour the rum over the ice.</li>
                <li class="step-item">Top with club soda and stir gently to combine.</li>
                <li class="step-item">Garnish with the remaining lime wedge and a sprig of mint. Serve immediately.</li>
            </ol>
        </div>

        <!-- Tips Section -->
        <div class="card">
            <div class="tips">
                <h3 class="tips-title">Pro Tips</h3>
                <ul class="tips-list">
                    <li class="tips-item">Use fresh mint for the best flavor</li>
                    <li class="tips-item">Adjust sugar to your preferred sweetness</li>
                    <li class="tips-item">Use crushed ice to chill the drink faster</li>
                    <li class="tips-item">Try flavored rums for a twist</li>
                    <li class="tips-item">Garnish with extra mint and lime for presentation</li>
                </ul>
            </div>
        </div>

        <!-- Related Recipes Section -->
        <div class="related-recipes">
            <h2 class="related-recipes-title">You May Also Like</h2>
            <div class="recipe-grid">
                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1589927986089-35812388d1c6?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Strawberry Mojito" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Strawberry Mojito</h3>
                        <p class="recipe-description">A fruity twist on the classic Mojito</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1595461685705-e1d330bf7c2f?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Margarita" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Margarita</h3>
                        <p class="recipe-description">A tangy and refreshing tequila cocktail</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1603052990742-5bc5f8c2a963?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Cuba Libre" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Cuba Libre</h3>
                        <p class="recipe-description">Classic rum and cola with lime</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <%@include file="../../component/footer.jsp" %>
</body>
</html>