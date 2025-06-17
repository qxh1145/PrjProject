<%-- 
    Document   : Grape juice
    Created on : Jun 7, 2025, 9:25:51?AM
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
        <div class="recipe-header" style="--header-image: url('https://i.pinimg.com/736x/74/1b/ad/741badbb035c07ac2af1315130fa2bbb.jpg')">
            <h1>How to Make Grape juice</h1>
            <p>The perfect way to enjoy smooth</p>
        </div>

        <div class="container">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="../">Juices</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Grape juice</li>
                </ol>
            </nav>



            <!-- Ingredients Section -->
            <div class="card">
                <h2 class="card-title">Ingredients</h2>
                <ul class="list">
                    <li class="list-item">4 cups of fresh seedless grapes - preferably red or black for a sweeter, deeper flavor.</li>
                    <li class="list-item">1/2 cup (120ml) cold filtered water - optional, to help blend the grapes.</li>
                    <li class="list-item">1 to 2 tablespoons of sugar or honey (optional) - adjust to taste if needed.</li>
                    <li class="list-item">1 teaspoon of lemon juice - optional, for brightness and balance.</li>
                    <li class="list-item">Ice cubes - for serving, especially refreshing on warm days.</li>
                    <li class="list-item">Fine-mesh strainer or cheesecloth - to separate juice from pulp and skins.</li>
                    <li class="list-item">Blender or juicer - for extracting the juice.</li>
                </ul>
            </div>

            <!-- Instructions Section -->
            <div class="card">
                <h2 class="card-title">Instructions</h2>
                <ol class="steps-list">
                    <li class="step-item">Rinse the grapes thoroughly under cool running water and remove all stems.</li>
                    <li class="step-item">Place the grapes into a blender or juicer. Add water if needed for easier blending.</li>
                    <li class="step-item">Blend on low speed until smooth. Avoid over-blending to keep the juice light and fresh.</li>
                    <li class="step-item">Pour the blended mixture through a fine-mesh strainer into a large bowl or pitcher. Press with a spoon to extract maximum juice. Discard the solids.</li>
                    <li class="step-item">Taste the juice. If needed, stir in sugar or honey and a splash of lemon juice to enhance the flavor.</li>
                    <li class="step-item">Serve over ice cubes in glasses. Garnish with a grape skewer or mint leaf for a stylish touch.</li>
                    <li class="step-item">Refrigerate any leftover juice in an airtight container and enjoy within 2-3 days for best flavor.</li>
                </ol>
            </div>

            <!-- Tips Section -->
            <div class="card">
                <div class="tips">
                    <h3 class="tips-title">Pro Tips</h3>
                    <ul class="tips-list">
                        <li class="tips-item">Use darker grapes like Concord or black grapes for a more intense flavor and rich color.</li>
                        <li class="tips-item">To make a grape slush, freeze grapes before blending - no need for ice cubes!</li>
                        <li class="tips-item">A touch of lemon juice can help balance the sweetness and make the flavor pop.</li>
                        <li class="tips-item">Add a few fresh mint leaves while serving for an extra refreshing twist.</li>
                        <li class="tips-item">You can also mix grape juice with sparkling water for a fizzy homemade grape soda.</li>
                    </ul>
                </div>
            </div>


            <!-- Related Recipes Section -->
            <div class="related-recipes">
                <h2 class="related-recipes-title">You May Also Like</h2>
                <div class="recipe-grid">
                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/db/9a/7b/db9a7b53a859982a6ca3fa48e3bbd6c5.jpg" alt="Carrot Orange Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Carrot Orange Juice</h3>
                            <p class="recipe-description">A vibrant and nutritious drink packed with Vitamin C and beta-carotene - a great way to start your day with a natural energy boost.</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/45/58/4f/45584fc3f3753fc8c74dbb4fc66452e7.jpg" alt="Tropical Smoothie" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Tropical Smoothie</h3>
                            <p class="recipe-description">A creamy blend of mango, banana, pineapple, and passion fruit - perfect for a light breakfast or afternoon snack.</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>
                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/3f/fd/93/3ffd9312086d64428d1662ff1671aae7.jpg" alt="Cucumber Mint Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Cucumber Mint Juice</h3>
                            <p class="recipe-description">A light, hydrating juice made with fresh cucumber, mint leaves, and a splash of lime - perfect for cooling down on hot days.</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>
                </div>
            </div>



    </body>
    <!-- Footer -->
    <%--<%@include file="../../component/footer.jsp" %>--%>
    <%@ include file="../../../../../component/footer.jsp" %>
    <%--<jsp:include page="/component/footer.jsp" />--%>

</html>