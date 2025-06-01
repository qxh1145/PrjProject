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
    <div class="recipe-header" style="--header-image: url('https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')">
        <h1>How to Make Cold Brew Coffee</h1>
        <p>The perfect way to enjoy smooth, low-acidity coffee</p>
    </div>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="../../indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="../">Coffee</a></li>
                <li class="breadcrumb-item active" aria-current="page">Cold Brew</li>
            </ol>
        </nav>

        <!-- Ingredients Section -->
        <div class="card">
            <h2 class="card-title">Ingredients</h2>
            <ul class="list">
                <li class="list-item">1 cup (100g) coarsely ground coffee beans</li>
                <li class="list-item">4 cups (950ml) cold water</li>
                <li class="list-item">Large jar or pitcher</li>
                <li class="list-item">Fine-mesh strainer or cheesecloth</li>
                <li class="list-item">Optional: Coffee filter for extra clarity</li>
            </ul>
        </div>

        <!-- Instructions Section -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Grind your coffee beans to a coarse consistency, similar to sea salt. This helps prevent over-extraction and ensures a smooth taste.</li>
                <li class="step-item">Combine the ground coffee and cold water in your jar or pitcher. Stir gently to ensure all grounds are wet.</li>
                <li class="step-item">Cover the container and let it steep at room temperature for 12-24 hours. The longer you steep, the stronger the flavor will be.</li>
                <li class="step-item">After steeping, strain the coffee using a fine-mesh strainer or cheesecloth. For an even clearer brew, you can strain it a second time through a coffee filter.</li>
                <li class="step-item">Dilute the concentrate with water or milk to your taste preference. A typical ratio is 1:1, but you can adjust based on your preference.</li>
                <li class="step-item">Serve over ice and enjoy! Store any remaining cold brew in the refrigerator for up to 2 weeks.</li>
            </ol>
        </div>

        <!-- Tips Section -->
        <div class="card">
            <div class="tips">
                <h3 class="tips-title">Pro Tips</h3>
                <ul class="tips-list">
                    <li class="tips-item">Use filtered water for the best taste</li>
                    <li class="tips-item">Experiment with different coffee beans to find your perfect flavor profile</li>
                    <li class="tips-item">For a stronger brew, increase the coffee-to-water ratio</li>
                    <li class="tips-item">Add spices like cinnamon or vanilla during the steeping process for unique flavors</li>
                    <li class="tips-item">Cold brew can be stored in the refrigerator for up to 2 weeks</li>
                </ul>
            </div>
        </div>

        <!-- Related Recipes Section -->
        <div class="related-recipes">
            <h2 class="related-recipes-title">You May Also Like</h2>
            <div class="recipe-grid">
                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Vietnamese Iced Coffee" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Vietnamese Iced Coffee</h3>
                        <p class="recipe-description">A sweet and strong coffee drink with condensed milk</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1572442388796-11668a67e53d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Nitro Cold Brew" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Nitro Cold Brew</h3>
                        <p class="recipe-description">Smooth and creamy coffee with a frothy top</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://images.unsplash.com/photo-1579888944880-d98341245702?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Coffee Tonic" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Coffee Tonic</h3>
                        <p class="recipe-description">Refreshing coffee drink with tonic water</p>
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