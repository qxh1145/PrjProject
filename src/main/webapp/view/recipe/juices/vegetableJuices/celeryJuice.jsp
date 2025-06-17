<%-- 
    Document   : celeryJuice
    Created on : Jun 7, 2025, 6:04:56?PM
    Author     : ASUS
--%>

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
        <div class="recipe-header" style="--header-image: url('https://i.pinimg.com/736x/16/c4/53/16c4536e5ad181b7523679e05ef7b0f0.jpg')">
            <h1>How to Make Celery Juice</h1>
            <p>A crisp, hydrating drink with natural detoxifying benefits</p>
        </div>

        <div class="container">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="../">Juices</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Celery Juice</li>
                </ol>
            </nav>

            <!-- Ingredients Section -->
            <div class="card">
                <h2 class="card-title">Ingredients</h2>
                <ul class="list">
                    <li class="list-item">1 bunch of fresh celery (about 8-10 stalks)</li>
                    <li class="list-item">1/4 cup (optional) filtered water for blending</li>
                    <li class="list-item">1 green apple (optional, for sweetness)</li>
                    <li class="list-item">Juicer or high-speed blender</li>
                    <li class="list-item">Fine-mesh strainer or cheesecloth (for smooth juice)</li>
                </ul>
            </div>

            <!-- Instructions Section -->
            <div class="card">
                <h2 class="card-title">Instructions</h2>
                <ol class="steps-list">
                    <li class="step-item">Wash the celery thoroughly and cut into smaller pieces if needed.</li>
                    <li class="step-item">If using a juicer, feed the celery through the chute and collect the juice.</li>
                    <li class="step-item">If using a blender, blend celery (and apple if using) with a little water until smooth.</li>
                    <li class="step-item">Strain the blended mixture through a fine-mesh strainer or cheesecloth into a bowl or jar.</li>
                    <li class="step-item">Pour the juice into a glass. Drink immediately on an empty stomach for best results.</li>
                    <li class="step-item">Store leftovers in the fridge for up to 24 hours in an airtight container.</li>
                </ol>
            </div>

            <!-- Tips Section -->
            <div class="card">
                <div class="tips">
                    <h3 class="tips-title">Pro Tips</h3>
                    <ul class="tips-list">
                        <li class="tips-item">Use organic celery to avoid pesticide residues</li>
                        <li class="tips-item">Drink on an empty stomach for optimal nutrient absorption</li>
                        <li class="tips-item">Add cucumber or lemon for extra flavor and hydration</li>
                        <li class="tips-item">If blending, strain well for a smoother texture</li>
                        <li class="tips-item">Prep celery in advance and store chopped in the fridge for quick juicing</li>
                    </ul>
                </div>
            </div>


            <!-- Related Recipes Section -->
            <div class="related-recipes">
                <h2 class="related-recipes-title">You May Also Like</h2>
                <div class="recipe-grid">
                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/88/7f/8c/887f8c5b8a8a6704ed523523a592a4a3.jpg" alt="Green Detox Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Green Detox Juice</h3>
                            <p class="recipe-description">A powerful blend of celery, cucumber, and spinach for a natural cleanse</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/76/44/96/764496912709055916cd0bb2938952a2.jpg" alt="Cucumber Celery Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Cucumber Celery Juice</h3>
                            <p class="recipe-description">Cool, crisp, and perfect for hydration and skin health</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/8b/e9/7c/8be97c8df560fbf86be11ea9b679dde4.jpg" alt="Celery Apple Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Celery Apple Juice</h3>
                            <p class="recipe-description">A mildly sweet combo of green apple and celery for a nutritious boost</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <%@ include file="../../../../../component/footer.jsp" %>
    </body>
</html>