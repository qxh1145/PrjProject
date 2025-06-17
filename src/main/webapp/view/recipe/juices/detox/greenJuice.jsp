<%-- 
    Document   : greenJuice
    Created on : Jun 16, 2025
    Author     : ASUS
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Juice Recipe</title>
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
    <div class="recipe-header" style="--header-image: url('https://i.pinimg.com/736x/12/d2/c4/12d2c496bd55b5c7ddd7490ae4334c9f.jpg')">
        <h1>How to Make Green Juice</h1>
        <p>A refreshing detox blend packed with leafy greens and citrus</p>
    </div>

    <div class="container">
        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb" style="display: flex; list-style: none; padding: 0; margin: 0;">
                <li class="breadcrumb-item"><a href="<%= request.getContextPath() %>/indexLogin.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="../">Juices</a></li>
                <li class="breadcrumb-item active" aria-current="page">Green Juice</li>
            </ol>
        </nav>

        <!-- Ingredients Section -->
        <div class="card">
            <h2 class="card-title">Ingredients</h2>
            <ul class="list">
                <li class="list-item">1 cucumber</li>
                <li class="list-item">1 green apple</li>
                <li class="list-item">1 handful spinach</li>
                <li class="list-item">1 celery stalk</li>
                <li class="list-item">1/2 lemon, juiced</li>
                <li class="list-item">1 small piece of ginger</li>
                <li class="list-item">Water (as needed)</li>
            </ul>
        </div>

        <!-- Instructions Section -->
        <div class="card">
            <h2 class="card-title">Instructions</h2>
            <ol class="steps-list">
                <li class="step-item">Wash and chop all ingredients into smaller pieces.</li>
                <li class="step-item">Add to a blender with lemon juice and a bit of water.</li>
                <li class="step-item">Blend until smooth and strain if preferred.</li>
                <li class="step-item">Serve chilled for a revitalizing effect.</li>
            </ol>
        </div>

        <!-- Tips Section -->
        <div class="card">
            <div class="tips">
                <h3 class="tips-title">Pro Tips</h3>
                <ul class="tips-list">
                    <li class="tips-item">Use fresh greens for optimal flavor and nutrition.</li>
                    <li class="tips-item">Adjust lemon and ginger amounts to taste.</li>
                    <li class="tips-item">Drink immediately after blending to preserve nutrients.</li>
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
                    <img src="https://i.pinimg.com/736x/2e/5b/91/2e5b91a242df88408bb52329edad8de8.jpg" alt="Apple Ginger Juice" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Apple Ginger Juice</h3>
                        <p class="recipe-description">A zingy and energizing combo to kickstart your day</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>

                <div class="recipe-card">
                    <img src="https://i.pinimg.com/736x/63/fe/9e/63fe9e6066520678479ab953fb1c2767.jpg" alt="Watermelon Mint Juice" class="recipe-image">
                    <div class="recipe-content">
                        <h3 class="recipe-name">Watermelon & Mint Juice</h3>
                        <p class="recipe-description">Cool, hydrating, and packed with summer flavor</p>
                        <a href="#" class="recipe-link">View Recipe -></a>
                    </div>
                </div>
            </div>
        <!-- Footer -->
        <%@ include file="../../../../../component/footer.jsp" %>
    </div>
</body>
</html>
