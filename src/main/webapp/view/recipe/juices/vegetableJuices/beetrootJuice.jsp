<%-- 
    Document   : beetrootJuice
    Created on : Jun 7, 2025, 8:50:56?PM
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
        <div class="recipe-header" style="--header-image: url('https://i.pinimg.com/736x/55/85/31/5585314533854295578f33f7a9205e60.jpg')">
            <h1>How to Make Celery Juice</h1>
            <p>A crisp, hydrating drink with natural detoxifying benefits</p>
        </div>

        <div class="container">
            <!-- Breadcrumb -->
            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                    <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                    <li class="breadcrumb-item"><a href="../">Juices</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Beetroot juice</li>
                </ol>
            </nav>



            <!-- Ingredients Section -->
            <div class="card">
                <h2 class="card-title">Ingredients</h2>
                <ul class="list">
                    <li class="list-item">2 medium beetroots, peeled and chopped</li>
                    <li class="list-item">1 apple (optional, for sweetness)</li>
                    <li class="list-item">1/2 inch piece of ginger (optional)</li>
                    <li class="list-item">1/4 cup water (if blending)</li>
                    <li class="list-item">Juicer or blender</li>
                    <li class="list-item">Strainer or cheesecloth (optional, for smoother juice)</li>
                </ul>
            </div>

            <!-- Instructions Section -->
            <div class="card">
                <h2 class="card-title">Instructions</h2>
                <ol class="steps-list">
                    <li class="step-item">Wash and peel the beetroots. Cut them into small chunks.</li>
                    <li class="step-item">If using a juicer, feed beetroot, apple, and ginger through the chute.</li>
                    <li class="step-item">If using a blender, blend chopped beetroot (and apple or ginger if using) with water until smooth.</li>
                    <li class="step-item">Strain the mixture through a fine-mesh strainer or cheesecloth to remove pulp.</li>
                    <li class="step-item">Pour the juice into a glass and enjoy fresh. Best served chilled.</li>
                    <li class="step-item">Refrigerate any leftover juice in a sealed container for up to 2 days.</li>
                </ol>
            </div>

            <!-- Tips Section -->
            <div class="card">
                <div class="tips">
                    <h3 class="tips-title">Pro Tips</h3>
                    <ul class="tips-list">
                        <li class="tips-item">Use fresh, firm beets for the best flavor and color</li>
                        <li class="tips-item">Combine with carrots or oranges to mellow the earthy taste</li>
                        <li class="tips-item">Wear gloves to avoid staining your hands while handling beets</li>
                        <li class="tips-item">Chill ingredients beforehand for a cooler drink</li>
                        <li class="tips-item">Drink in the morning to take advantage of its energizing effects</li>
                    </ul>
                </div>
            </div>


            <!-- Related Recipes Section -->
            <div class="related-recipes">
                <h2 class="related-recipes-title">You May Also Like</h2>
                <div class="recipe-grid">
                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/00/e2/85/00e285e4dc8019b8d1ca313f83e0f758.jpg" alt="Carrot Beetroot Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Carrot Beetroot Juice</h3>
                            <p class="recipe-description">A vibrant detox drink packed with antioxidants and vitamins</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/1b/d4/0e/1bd40ea90ce4e1d538d51c5f46426524.jpg" alt="Beetroot Apple Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Beetroot Apple Juice</h3>
                            <p class="recipe-description">A naturally sweet juice combining beetroot and crisp red apples</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>

                    <div class="recipe-card">
                        <img src="https://i.pinimg.com/736x/93/6a/f1/936af15a8cfd351440d755697ac77799.jpg" alt="Beetroot Ginger Juice" class="recipe-image">
                        <div class="recipe-content">
                            <h3 class="recipe-name">Beetroot Ginger Juice</h3>
                            <p class="recipe-description">A bold blend of earthy beetroot and spicy ginger for immunity</p>
                            <a href="#" class="recipe-link">View Recipe -></a>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Footer -->
            <%@ include file="../../../../../component/footer.jsp" %>
    </body>
</html>
