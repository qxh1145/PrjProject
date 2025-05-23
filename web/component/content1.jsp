<div class="main-content container text-center mt-4 mb-4">
    <div class="row g-6">
        <div class="col-md-4">
            <div class="card">
                <img src="images/Coffee Beans Background Banner.png" class="card-img-top" alt="...">
              
                <div class="card-body">
                  <h5 class="card-title">Summer Special</h5>
                  <p class="card-text">Summer's best flavors are in your glass!</p>
                  <a href="#" class="btn btn-primary">Check it out</a>
                </div>
              </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="images/Coffee Beans Background Banner.png" class="card-img-top" alt="...">
              
                <div class="card-body">
                  <h5 class="card-title">10 Best Coffee Recipes</h5>
                  <p class="card-text">Need a caffeine boost? Sip on one of these and bring the coffee shop to your house.</p>
                  <a href="#" class="btn btn-primary">Check it out</a>
                </div>
              </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="images/Coffee Beans Background Banner.png" class="card-img-top" alt="...">
              
                <div class="card-body">
                  <h5 class="card-title">Easy Cocktail Recipes</h5>
                  <p class="card-text">Raise a glass to our quick and easy cocktail recipes.</p>
                  <a href="#" class="btn btn-primary">Check it out</a>
                </div>
              </div>
        </div>
    </div>

    <!-- Trending Now Section -->
    <div class="trending-section mt-5">
        <div class="trending-bg">
            <img src="images/Coffee Beans Background Banner.png" alt="Trending Background" class="trending-background">
            <div class="trending-overlay">
                <h2 class="section-title">Trending Now</h2>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="trending-card">
                            <div class="trending-number">01</div>
                            <h4>Vietnamese Coffee</h4>
                            <p>Classic Vietnamese drip coffee with condensed milk</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="trending-card">
                            <div class="trending-number">02</div>
                            <h4>Matcha Latte</h4>
                            <p>Japanese green tea with creamy milk</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="trending-card">
                            <div class="trending-number">03</div>
                            <h4>Cold Brew</h4>
                            <p>Smooth and refreshing cold coffee</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="trending-card">
                            <div class="trending-number">04</div>
                            <h4>Bubble Tea</h4>
                            <p>Taiwanese milk tea with chewy pearls</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Popular Categories -->
    <div class="categories-section mt-5">
        <h2 class="section-title">Popular Categories</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="category-card">
                    <i class="fas fa-coffee category-icon"></i>
                    <h4>Coffee</h4>
                    <span class="recipe-count">120+ Recipes</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <i class="fas fa-glass-martini-alt category-icon"></i>
                    <h4>Cocktails</h4>
                    <span class="recipe-count">85+ Recipes</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="category-card">
                    <i class="fas fa-mug-hot category-icon"></i>
                    <h4>Tea</h4>
                    <span class="recipe-count">95+ Recipes</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Join Community Section -->
    <div class="community-section mt-5">
        <div class="community-bg">
            <img src="images/R.png" alt="Community Background" class="community-background">
            <div class="community-overlay">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="community-content">
                            <h2 class="community-title">Join Our Community</h2>
                            <p class="community-text">Connect with fellow coffee and tea enthusiasts. Share your recipes, discover new favorites, and be part of our growing community.</p>
                            
                            <div class="community-buttons">
                                <a href="#" class="btn btn-primary">Join Now</a>
                                <a href="#" class="btn btn-outline-light">Learn More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="community-features">
                            <div class="feature-item">
                                <i class="fas fa-share-alt"></i>
                                <h4>Share Recipes</h4>
                                <p>Share your favorite coffee and tea recipes with the community</p>
                            </div>
                            <div class="feature-item">
                                <i class="fas fa-comments"></i>
                                <h4>Join Discussions</h4>
                                <p>Participate in lively discussions about brewing techniques</p>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<style>
    .card {
        text-align: left;
        height: 100%;
        border: 2px solid rgba(0, 0, 0, 0.295);
        border-radius: 10px;
        background: white;
        height: 100%;
        transition: all 0.3s ease;
        text-align: left;
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
    }
    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0, 121, 107, 0.2);
    }
    .card-body {
        text-align: left;
        font-family: Arial, sans-serif;
        display: flex;
        flex-direction: column;
        gap: 1rem;
        padding: 1.5rem;
    }
    .card-title {
        text-align: left;
        color: #00796B;
        font-family: Arial, sans-serif;
        font-weight: bold;
        margin: 0;
    }
    .card-text {
        text-align: left;
        font-family: Arial, sans-serif;
        margin: 0;
    }
    .btn-primary {
        font-family: Arial, sans-serif;
        background-color: #00796B;
        border-color: #00796B;
        margin-top: auto;
        width: 50%;
    }
    .btn-primary:hover {
        background-color: #005b52;
        border-color: #005b52;
    }
    .card-img-top {
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }
    .g-4 {
        --bs-gutter-x: 30px;
        --bs-gutter-y: 30px;
    }
    .main-content-item h3 {
        color: #00796B;
        margin-bottom: 1rem;
        text-align: left;
    }
    .main-content-item p {
        color: #666;
        margin-bottom: 0;
        text-align: left;
    }

    /* New styles for Trending Section */
    .trending-section {
        position: relative;
        margin: 4rem 0;
    }
    .trending-bg {
        position: relative;
        width: 100%;
        overflow: hidden;
        border-radius: 15px;
    }
    .trending-background {
        width: 100%;
        height: 400px;
        object-fit: cover;
        filter: brightness(0.7);
    }
    .trending-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        padding: 3rem 2rem;
        background: rgba(0, 0, 0, 0.4);
    }
    .section-title {
        color: #005b52;
        margin-bottom: 2rem;
        font-weight: bold;
        text-align: center;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }
    .trending-card {
        background: rgba(255, 255, 255, 0.95);
        border: 2px solid rgba(0, 0, 0, 0.295);
        border-radius: 10px;
        padding: 1.5rem;
        height: 100%;
        transition: all 0.3s ease;
        position: relative;
        backdrop-filter: blur(5px);
    }
    .trending-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0, 121, 107, 0.2);
        background: white;
    }
    .trending-number {
        position: absolute;
        top: -15px;
        left: 20px;
        background: #00796B;
        color: white;
        padding: 5px 15px;
        border-radius: 20px;
        font-weight: bold;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }
    .trending-card h4 {
        color: #00796B;
        margin-top: 1rem;
        margin-bottom: 0.5rem;
    }
    .trending-card p {
        color: #666;
        margin: 0;
    }

    /* New styles for Categories Section */
    .category-card {
        background: white;
        border: 2px solid rgba(0, 0, 0, 0.295);
        border-radius: 10px;
        padding: 2rem;
        text-align: center;
        height: 100%;
        transition: all 0.3s ease;
    }
    .category-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 5px 15px rgba(0, 121, 107, 0.2);
    }
    .category-icon {
        font-size: 2.5rem;
        color: #00796B;
        margin-bottom: 1rem;
    }
    .category-card h4 {
        color: #00796B;
        margin-bottom: 0.5rem;
    }
    .recipe-count {
        color: #666;
        font-size: 0.9rem;
    }

    /* Community Section Styles */
    .community-section {
        position: relative;
        margin: 4rem 0;
    }
    .community-bg {
        position: relative;
        width: 100%;
        overflow: hidden;
        border-radius: 15px;
    }
    .community-background {
        width: 100%;
        height: 500px;
        object-fit: cover;
        filter: brightness(0.6);
    }
    .community-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        padding: 3rem;
        background: rgba(0, 0, 0, 0.5);
    }
    .community-content {
        color: white;
    }
    .community-title {
        font-size: 2.5rem;
        font-weight: bold;
        margin-bottom: 1.5rem;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }
    .community-text {
        font-size: 1.1rem;
        margin-bottom: 2rem;
        line-height: 1.6;
    }
  
    
    .community-buttons {
        display: flex;
        gap: 1rem;
        justify-content: center;
    }
    .btn-outline-light {
        border: 2px solid white;
        color: white;
    }
    .btn-outline-light:hover {
        background: white;
        color: #00796B;
    }
    .community-features {
        display: flex;
        flex-direction: column;
        gap: 6rem;
    }
    .feature-item {
        background: rgba(255, 255, 255, 0.1);
        padding: 1.5rem;
        border-radius: 10px;
        backdrop-filter: blur(5px);
        transition: all 0.3s ease;
    }
    .feature-item:hover {
        transform: translateX(10px);
        background: rgba(255, 255, 255, 0.2);
    }
    .feature-item i {
        font-size: 2rem;
        color: #00796B;
        margin-bottom: 1rem;
    }
    .feature-item h4 {
        color: white;
        margin-bottom: 0.5rem;
    }
    .feature-item p {
        color: #ddd;
        margin: 0;
        font-size: 0.9rem;
    }
</style>
</body>
