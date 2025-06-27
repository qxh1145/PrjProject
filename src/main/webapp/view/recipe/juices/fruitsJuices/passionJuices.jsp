<%-- 
    Document   : passionJuices
    Created on : Jun 7, 2025, 9:25:51?AM
    Author     : ASUS
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fruit Smoothie Recipes</title>
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
        <div class="recipe-header" style="--header-image: url('https://i.pinimg.com/736x/41/2a/15/412a156da16e76a18c05038819bd844f.jpg')">
            <h1>How to Make Passion Juices</h1>
            <p>The perfect way to enjoy smooth</p>
        </div>

        <div class="container">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="../">Juices</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Passion fruit juice</li>
                </ol>
            </nav>

            <!-- Ingredients Section -->
            <div class="card">
                <h2 class="card-title">Ingredients</h2>
                <ul class="list">
                    <li class="list-item">6 to 8 ripe passion fruits ? choose ones that are slightly wrinkled for the sweetest, most flavorful juice.</li>
                    <li class="list-item">2 cups (480ml) cold filtered water ? helps mellow out the strong tartness of the passion fruit.</li>
                    <li class="list-item">1 to 2 tablespoons of sugar or honey (optional) - adjust according to your taste preferences.</li>
                    <li class="list-item">Ice cubes - for serving, especially refreshing on a hot day.</li>
                    <li class="list-item">Fine-mesh strainer or cheesecloth - to separate the seeds and pulp from the liquid.</li>
                    <li class="list-item">Blender (optional) - useful for loosening the pulp from the seeds quickly.</li>
                </ul>
            </div>

            <!-- Instructions Section -->
            <div class="card">
                <h2 class="card-title">Instructions</h2>
                <ol class="steps-list">
                    <li class="step-item">Wash the passion fruits thoroughly under running water to remove any dirt or residue.</li>
                    <li class="step-item">Cut each fruit in half and use a spoon to scoop the bright yellow pulp and seeds into a bowl or directly into a blender.</li>
                    <li class="step-item">If using a blender, add the cold water and pulse a few times on low speed. Be careful not to blend too much-you just want to loosen the seeds from the pulp, not crush them, which can make the juice bitter.</li>
                    <li class="step-item">Pour the mixture through a fine-mesh strainer into a pitcher or large container. Use the back of a spoon to press and extract as much juice as possible. Discard the seeds and excess pulp.</li>
                    <li class="step-item">Taste the juice. If it's too tart, add sugar or honey one spoon at a time, stirring until completely dissolved. This step is entirely optional, as some people enjoy the pure, tangy flavor on its own.</li>
                    <li class="step-item">To serve, pour the passion fruit juice over ice cubes in glasses. You can garnish with a slice of lime or a few mint leaves for an extra refreshing touch.</li>
                    <li class="step-item">Store any leftover juice in an airtight container in the refrigerator. It?s best enjoyed within 2?3 days while the flavor is at its peak.</li>
                </ol>
            </div>

            <!-- Tips Section -->
            <div class="card">
                <div class="tips">
                    <h3 class="tips-title">Pro Tips</h3>
                    <ul class="tips-list">
                        <li class="tips-item">The more wrinkled the passion fruit skin, the riper and sweeter the juice inside. Don?t be afraid of those ugly fruits - they?re the tastiest!</li>
                        <li class="tips-item">For a more tropical flavor, mix your passion fruit juice with other juices like orange, pineapple, or mango.</li>
                        <li class="tips-item">If you like pulp in your juice, strain the liquid more lightly or skip the straining step altogether.</li>
                        <li class="tips-item">Use chilled passion fruits or cold water to make sure your juice is refreshing straight out of the pitcher.</li>
                        <li class="tips-item">Want a frozen treat? Pour the juice into popsicle molds and freeze for tropical ice pops.</li>
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
                            <p class="recipe-description">A creamy blend of mango, banana, pineapple, and passion fruit ? perfect for a light breakfast or afternoon snack.</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>
                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/3f/fd/93/3ffd9312086d64428d1662ff1671aae7.jpg" alt="Cucumber Mint Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Cucumber Mint Juice</h3>
                            <p class="recipe-description">A light, hydrating juice made with fresh cucumber, mint leaves, and a splash of lime ? perfect for cooling down on hot days.</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>
                </div>
            </div>

            <%@ include file="../../../../../component/footer.jsp" %>

    </body>
    <!-- Footer -->
    <%--<%@include file="../../../component/footer.jsp" %>--%>

</html>