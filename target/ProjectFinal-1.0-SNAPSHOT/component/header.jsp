<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #00796B;">
    <div class="container-fluid">
        <a class="navbar-brand" href="indexLogin.jsp" style="margin-left: 20px;">How to Cook Recipes</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <%
                String username = (String) session.getAttribute("user");
                String accountType = (String) session.getAttribute("accountType");
                String premiumExpiryDate = (String) session.getAttribute("premiumExpiryDate");
            %>
            <ul class="navbar-nav mx-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="recipesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Recipes
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="recipesDropdown">
                        <li class="dropend">
                            <a class="dropdown-item" href="main?action=recipeOverview&type=milktea">Milk Tea</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="main?action=recipe&type=milktea&name=classic-milk-tea">Classic Milk Tea</a></li>
                                <li><a class="dropdown-item" href="main?action=recipe&type=milktea&name=milk-tea-latte">Milk Tea Latte</a></li>
                                <li><a class="dropdown-item" href="main?action=recipe&type=milktea&name=tropical-milk-tea">Tropical Milk Tea</a></li>
                                <li><a class="dropdown-item" href="main?action=recipe&type=milktea&name=matcha-milk-tea">Matcha Milk Tea</a></li>
                            </ul>
                        </li>
                        <li class="dropend">
                            <a class="dropdown-item" href="main?action=recipeOverview&type=fruittea">Fruit Tea</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="main?action=recipe&type=fruittea&name=basic-fruit-tea">Basic Fruit Tea</a></li>
                                <li><a class="dropdown-item" href="main?action=recipe&type=fruittea&name=pineapple-fruit-tea">Pineapple Fruit Tea</a></li>
                                <li><a class="dropdown-item" href="main?action=recipe&type=fruittea&name=peach-oolong-tea">Peach Oolong Tea</a></li>
                                <li><a class="dropdown-item" href="main?action=recipe&type=fruittea&name=strawberry-jasmine-tea">Strawberry Jasmine Tea</a></li>
                                <li><a class="dropdown-item" href="main?action=recipe&type=fruittea&name=mango-black-tea">Mango Black Tea</a></li>
                            </ul>
                        </li>
                        <li class="dropend">
                            <a class="dropdown-item" href="main?action=recipeOverview&type=coffee">Coffee</a>
                            <ul class="dropdown-menu">
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">ColdBrew</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=htmcoldbrew">How to make ColdBrew</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=coldbrew-latte">ColdBrew Latte</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=vanilla-sweet-cream-cold-brew">Vanilla Sweet Cream Cold Brew</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=tropical-cold-brew">Tropical Cold Brew</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Vietnamese Coffee</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=traditional-vietnamese-drip">Traditional Vietnamese Drip Coffee</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=bac-xiu">Bac Xiu</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=egg-coffee">Egg Coffee</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=orange-coffee">Orange Coffee</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Italian Coffee</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=cappuccino">Cappuccino</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=latte">Latte</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=moka">Moka</a></li>
                                        <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=coffee&recipe=macchiato">Macchiato</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropend">
                            <a class="dropdown-item" href="main?action=recipeOverview&type=smoothie">Smoothie</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=smoothie&recipe=fruit-smoothie">Fruit Smoothie</a></li>
                                <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=smoothie&recipe=green-smoothie">Seed Smoothie</a></li>
                                <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=smoothie&recipe=protein-smoothie">Green Smoothie (Vegeterian)</a></li>
                                <li><a class="dropdown-item" href="main?action=navigation&navAction=recipe&category=smoothie&recipe=seed-smoothie">Smoothie Protein</a></li>
                            </ul>
                        </li>
                        <%-- add list juice by diemkieu --%>
                        <li class="dropend">
                            <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Juices</a>
                            <ul class="dropdown-menu">
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Fruit Juices</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/fruitsJuices&name=passionJuices">Passion fruit juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/fruitsJuices&name=grapeJuices">Grapefruit juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/fruitsJuices&name=orangeJuices">Orange juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/fruitsJuices&name=tropicalFruitJuices">Tropical Fruit Juices</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Vegetable Juices</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/vegetableJuices&name=celeryJuice">Celery juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/vegetableJuices&name=beetrootJuice">Beetroot juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/vegetableJuices&name=cucumberJuice">Cucumber juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/vegetableJuices&name=carrotJuice">Carrot juice</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Mixed Juices</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/mixedJuices&name=appleCarrotJuice">Apple & carrot juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/mixedJuices&name=pineapplePassionJuice">Pineapple & passion fruit juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/mixedJuices&name=watermelonMintJuice">Watermelon & mint juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/mixedJuices&name=mixedVegetableJuice">Mixed vegetable juice</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Detox/Healthy</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/detox&name=greenJuice">Green juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/detox&name=detoxJuice">Detox juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/detox&name=turmericJuice">Turmeric juice</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipe&type=juices/detox&name=immunityBoostingJuice">Immunity Boosting</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!--add cocktail-->
                        <li class="dropend">
                            <a class="dropdown-item" href="main?action=recipeOverview&type=cocktail">Cocktail</a>
                            <ul class="dropdown-menu">
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Classic Cocktails</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/cosmopolitan.jsp">Cosmopolitan </a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/manhattan.jsp">Manhattan</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/margarita.jsp">Margarita</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/martini.jsp">Martini </a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/mojito.jsp">Mojito </a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/negroni.jsp">Negroni </a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/ClassicCocktails/whiskey-sour.jsp">Whiskey Sour </a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Fruit-based Cocktails</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/blue-lagoon.jsp">Blue Lagoon</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/mai-tai.jsp">Mai Tai</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/mango-margarita.jsp">Mango Margarita</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/strawberry-daiquiri.jsp">Strawberry Daiquiri</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Fruit_basedCocktails/tequila-sunrise.jsp">Tequila Sunrise</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item" href="#" data-bs-toggle="dropdown">Mocktails</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Mocktails/fruit-punch.jsp">Fruit Punch</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Mocktails/nojito.jsp">Nojito </a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Mocktails/shirley-temple.jsp">Shirley Temple</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Mocktails/sunset-cooler.jsp">Sunset Cooler</a></li>
                                        <li><a class="dropdown-item" href="main?action=recipeDetail&path=view/recipe/cocktail/Mocktails/virgin-mojito.jsp">Virgin Mojito</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <!--add cocktail-->
                        <%--//end list --%>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ai/chatbot">Chatbot</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="community.jsp" id="communityLink">Community</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="toolsDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Tools
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="toolsDropdown">
                        <li><a class="dropdown-item" href="#">Recipe Calculator</a></li>
                        <li><a class="dropdown-item" href="#">Unit Converter</a></li>
                        <li><a class="dropdown-item" href="#">Timer</a></li>
                        <li><a class="dropdown-item" href="#">Shopping List</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <% if ("admin".equals(username)) { %>
                        <a class="nav-link admin-panel-link" href="main?action=adminPanel" data-transition="slide">
                            <i class="fas fa-shield-alt me-1"></i>Admin Control Panel
                        </a>
                    <% } else { %>
                        <a class="nav-link" href="BuyPremium.jsp">Buy Premium</a>
                    <% } %>
                </li>
            </ul>

            <div class="d-flex" style="margin-right: 20px;">
                <div class="dropdown">
                    <div class="d-flex align-items-center" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer;">
                        <i class="fas fa-user me-2"></i>
                        <% if (username != null) { %>
                        <span class="text-light me-3"><%= username %></span>
                        <i class="fas fa-chevron-down text-light"></i>
                        <% } %>
                    </div>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                            <div class="dropdown-item">
                                <strong>Account Type:</strong>
                                <span class="<%= "premium".equals(accountType) ? "text-warning" : "text-secondary" %>">
                                    <%= accountType != null ? accountType : "Free" %>
                                </span>
                            </div>
                        </li>
                        <% if ("premium".equals(accountType)) { %>
                        <li>
                            <div class="dropdown-item">
                                <strong>Premium Expires:</strong><br>
                                <%= premiumExpiryDate != null ? premiumExpiryDate : "Lifetime" %>
                            </div>
                        </li>
                        <% } %>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-danger" href="main?action=logout">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</nav>
<style>
    .navbar {
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .dropdown-menu {
        margin-top: 0.5rem;
        border-radius: 0.5rem;
        box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        z-index: 1000;
    }

    .dropdown-item {
        transition: all 0.2s;
    }
    .dropdown-item:hover {
        background-color: #f8f9fa;
    }
    .btn-outline-light:hover {
        background-color: #fff;
        color: #00796B;
    }
    .btn-light:hover {
        background-color: #e9ecef;
        color: #00796B;
    }
    footer a:hover {
        color: #ffc107 !important;
    }
    .nav-link.disabled {
        pointer-events: none;
        opacity: 0.6;
        cursor: not-allowed;
    }
    .nav-link.disabled:hover::after {
        content: "You must login to use this";
        position: absolute;
        bottom: -30px;
        left: 50%;
        transform: translateX(-50%);
        background-color: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 5px 10px;
        border-radius: 4px;
        font-size: 12px;
        white-space: nowrap;
        z-index: 1000;
    }
    .dropdown-menu .dropdown-toggle::after {
        float: right;
        margin-left: 5px;
    }

    .dropdown-menu .dropdown-menu {
        top: 0;
        left: 100%;
        margin-top: -0.1rem;
        margin-left: 0;
        display: none;
        position: absolute;
    }

    .dropdown-menu li:hover > .dropdown-menu {
        display: block;
    }
    
    /* Fix for nested dropdowns */
    .dropend .dropdown-menu {
        margin-left: 0.125rem;
    }
    
    .dropend .dropdown-toggle::after {
        vertical-align: middle;
        margin-left: 0.5em;
    }
    
    /* Admin Panel Link Transition Effects */
    .admin-panel-link {
        position: relative;
        transition: all 0.3s ease;
        overflow: hidden;
    }
    
    .admin-panel-link::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: left 0.5s ease;
    }
    
    .admin-panel-link:hover::before {
        left: 100%;
    }
    
    .admin-panel-link:hover {
        transform: translateY(-2px);
        text-shadow: 0 2px 8px rgba(255,255,255,0.3);
    }
    
    .admin-panel-link i {
        transition: transform 0.3s ease;
    }
    
    .admin-panel-link:hover i {
        transform: rotate(360deg) scale(1.2);
    }
    
    /* Page Transition Overlay */
    .page-transition-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, #00796B, #004D40);
        z-index: 9999;
        transform: translateX(-100%);
        transition: transform 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 2rem;
        font-weight: 700;
        opacity: 0;
    }
    
    .page-transition-overlay.active {
        transform: translateX(0);
        opacity: 1;
        transition: transform 0.8s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.6s ease;
    }
    
    .page-transition-overlay.fade-out {
        opacity: 0;
        transform: translateX(100%);
        transition: transform 1.2s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.8s ease;
    }
    
    .page-transition-overlay .loading-content {
        text-align: center;
        opacity: 0;
        transform: translateY(20px);
        transition: all 0.8s ease 0.4s;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 1.5rem;
    }
    
    .page-transition-overlay.active .loading-content {
        opacity: 1;
        transform: translateY(0);
    }
    
    .page-transition-overlay.fade-out .loading-content {
        opacity: 0;
        transform: translateY(-20px);
        transition: all 1.8s ease;
    }
    
    .loading-text h3 {
        color: var(--white);
        font-size: 1.5rem;
        font-weight: 600;
        margin: 0;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    }
    
    .loading-text p {
        color: rgba(255, 255, 255, 0.8);
        font-size: 1rem;
        margin: 0.5rem 0 0 0;
        font-weight: 400;
    }
    
    /* Lottie Player Styling */
    dotlottie-player {
        filter: drop-shadow(0 4px 8px rgba(0, 0, 0, 0.2));
        border-radius: 12px;
        overflow: hidden;
        transition: all 0.5s ease;
    }
    
    /* Default size for recipe animations and Admin Panel */
    dotlottie-player[src*="0474c5a5-5252-43f4-b2a1-2728acf6b4cd"],
    dotlottie-player[src*="d5f71086-414e-4a71-bb9e-8493aee61ffe"] {
        width: 300px !important;
        height: 300px !important;
    }
    
    /* Default size for other animations */
    dotlottie-player:not([src*="0474c5a5-5252-43f4-b2a1-2728acf6b4cd"]):not([src*="d5f71086-414e-4a71-bb9e-8493aee61ffe"]) {
        width: 520px !important;
        height: 320px !important;
    }
    
    .page-transition-overlay.fade-out dotlottie-player {
        transform: scale(0.8);
        opacity: 0;
    }
    
    /* Pulse effect for admin panel link */
    .admin-panel-link {
        animation: adminPulse 3s infinite;
    }
    
    /* Loading effect for all navigation links */
    .nav-link, .dropdown-item {
        position: relative;
        transition: all 0.3s ease;
        overflow: hidden;
        opacity: 1;
    }
    
    /* Exclude dropdown toggle items from loading effects */
    .nav-link[data-bs-toggle="dropdown"], 
    .dropdown-item[data-bs-toggle="dropdown"] {
        pointer-events: auto;
    }
    
    .nav-link[data-bs-toggle="dropdown"]:hover, 
    .dropdown-item[data-bs-toggle="dropdown"]:hover {
        transform: none;
        text-shadow: none;
    }
    
    .nav-link[data-bs-toggle="dropdown"]::before, 
    .dropdown-item[data-bs-toggle="dropdown"]::before {
        display: none;
    }
    
    .nav-link::before, .dropdown-item::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        transition: left 0.5s ease;
    }
    
    .nav-link:hover::before, .dropdown-item:hover::before {
        left: 100%;
    }
    
    .nav-link:hover, .dropdown-item:hover {
        transform: translateY(-2px);
        text-shadow: 0 2px 8px rgba(255,255,255,0.3);
        opacity: 0.8;
    }
    
    .nav-link i, .dropdown-item i {
        transition: transform 0.3s ease;
    }
    
    .nav-link:hover i, .dropdown-item:hover i {
        transform: rotate(360deg) scale(1.2);
    }
    
    /* Fade out animation for clicked links */
    .nav-link.fade-out, .dropdown-item.fade-out {
        animation: fadeOut 1.2s ease forwards;
    }
    
    @keyframes fadeOut {
        0% {
            opacity: 1;
            transform: scale(1);
        }
        30% {
            opacity: 0.7;
            transform: scale(0.98);
        }
        70% {
            opacity: 0.3;
            transform: scale(0.95);
        }
        100% {
            opacity: 0;
            transform: scale(0.9);
        }
    }
    
    /* Fade in animation for page load */
    .nav-link, .dropdown-item {
        animation: fadeIn 0.8s ease forwards;
    }
    
    @keyframes fadeIn {
        0% {
            opacity: 0;
            transform: translateY(10px);
        }
        100% {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    @keyframes adminPulse {
        0% { box-shadow: 0 0 0 0 rgba(255,255,255,0.4); }
        70% { box-shadow: 0 0 0 10px rgba(255,255,255,0); }
        100% { box-shadow: 0 0 0 0 rgba(255,255,255,0); }
    }
    
    /* Curtain effect for homepage link */
    .navbar-brand {
        position: relative;
        transition: all 0.3s ease;
    }
    
    .navbar-brand.curtain-effect {
        animation: curtainClose 1.5s ease forwards;
    }
    
    @keyframes curtainClose {
        0% {
            transform: scale(1);
            opacity: 1;
        }
        20% {
            transform: scale(0.95);
            opacity: 0.8;
        }
        50% {
            transform: scale(0.8);
            opacity: 0.5;
        }
        80% {
            transform: scale(0.6);
            opacity: 0.2;
        }
        100% {
            transform: scale(0.3);
            opacity: 0;
        }
    }
    
    /* Curtain overlay for homepage */
    .curtain-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, #00796B, #004D40);
        z-index: 9998;
        transform: translateY(-100%);
        transition: transform 1.5s cubic-bezier(0.4, 0, 0.2, 1);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 2rem;
        font-weight: 700;
    }
    
    .curtain-overlay.active {
        transform: translateY(0);
    }
    
    .curtain-overlay.open {
        transform: translateY(100%);
        transition: transform 1.2s cubic-bezier(0.4, 0, 0.2, 1);
    }
    
    .curtain-content {
        text-align: center;
        opacity: 0;
        transform: translateY(30px);
        transition: all 0.8s ease 0.5s;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 1.5rem;
    }
    
    .curtain-overlay.active .curtain-content {
        opacity: 1;
        transform: translateY(0);
    }
    
    .curtain-overlay.open .curtain-content {
        opacity: 0;
        transform: translateY(-30px);
        transition: all 0.5s ease;
    }
</style>

<!-- Page Transition Overlay -->
<div class="page-transition-overlay" id="pageTransitionOverlay">
    <div class="loading-content">
        <dotlottie-player 
            src="https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie" 
            background="transparent" 
            speed="1" 
            style="width: 300px; height: 300px" 
            loop 
            autoplay>
        </dotlottie-player>
        <div class="loading-text">
            <h3 id="loadingTitle">Loading...</h3>
            <p id="loadingSubtitle">Please wait while we prepare your content</p>
        </div>
    </div>
</div>

<!-- Curtain Overlay for Homepage -->
<div class="curtain-overlay" id="curtainOverlay">
    <div class="curtain-content">
        <dotlottie-player 
            src="https://lottie.host/d5f71086-414e-4a71-bb9e-8493aee61ffe/m1pbm5YX5j.lottie" 
            background="transparent" 
            speed="1" 
            style="width: 300px; height: 300px" 
            loop 
            autoplay>
        </dotlottie-player>
        <div class="loading-text">
            <h3>Welcome Home!</h3>
            <p>Opening the main stage...</p>
        </div>
    </div>
</div>

<!-- Lottie Player Script -->
<script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>

<script>
    // Curtain Effect for Homepage Link
    document.addEventListener('DOMContentLoaded', function() {
        const curtainOverlay = document.getElementById('curtainOverlay');
        const navbarBrand = document.querySelector('.navbar-brand');
        
        if (navbarBrand) {
            navbarBrand.addEventListener('click', function(e) {
                e.preventDefault();
                
                const href = this.getAttribute('href');
                
                // Add curtain effect to brand
                this.classList.add('curtain-effect');
                
                // Show curtain overlay
                setTimeout(() => {
                    curtainOverlay.classList.add('active');
                }, 800);
                
                // Open curtain and navigate
                setTimeout(() => {
                    curtainOverlay.classList.add('open');
                    
                    // Navigate after curtain opens
                    setTimeout(() => {
                        window.location.href = href;
                    }, 1200);
                }, 3000);
            });
        }
        
        // Hide curtain when page loads (for back navigation)
        if (curtainOverlay.classList.contains('active')) {
            setTimeout(() => {
                curtainOverlay.classList.add('open');
                setTimeout(() => {
                    curtainOverlay.classList.remove('active', 'open');
                }, 1200);
            }, 500);
        }
    });
    
    // Page Transition Effect for All Navigation Links
    document.addEventListener('DOMContentLoaded', function() {
        const overlay = document.getElementById('pageTransitionOverlay');
        const loadingTitle = document.getElementById('loadingTitle');
        const loadingSubtitle = document.getElementById('loadingSubtitle');
        
        // Function to get loading text based on link
        function getLoadingText(linkText, href) {
            const textMap = {
                'Admin Control Panel': {
                    title: 'Loading Admin Panel...',
                    subtitle: 'Preparing your dashboard',
                    animation: 'https://lottie.host/d5f71086-414e-4a71-bb9e-8493aee61ffe/m1pbm5YX5j.lottie'
                },
                'Chatbot': {
                    title: 'Loading Chatbot...',
                    subtitle: 'Initializing AI assistant',
                    animation: 'https://lottie.host/d5f71086-414e-4a71-bb9e-8493aee61ffe/m1pbm5YX5j.lottie'
                },
                'Community': {
                    title: 'Loading Community...',
                    subtitle: 'Connecting to community',
                    animation: 'https://lottie.host/d5f71086-414e-4a71-bb9e-8493aee61ffe/m1pbm5YX5j.lottie'
                },
                'Buy Premium': {
                    title: 'Loading Premium...',
                    subtitle: 'Preparing premium features',
                    animation: 'https://lottie.host/d5f71086-414e-4a71-bb9e-8493aee61ffe/m1pbm5YX5j.lottie'
                },
                'Recipes': {
                    title: 'Loading Recipes...',
                    subtitle: 'Fetching delicious recipes',
                    animation: 'https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie'
                },
                'Tools': {
                    title: 'Loading Tools...',
                    subtitle: 'Preparing useful tools',
                    animation: 'https://lottie.host/d5f71086-414e-4a71-bb9e-8493aee61ffe/m1pbm5YX5j.lottie'
                }
            };
            
            // Check for recipe types
            if (href.includes('recipe')) {
                if (href.includes('milktea')) {
                    return { 
                        title: 'Loading Milk Tea Recipes...', 
                        subtitle: 'Brewing delicious drinks',
                        animation: 'https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie'
                    };
                } else if (href.includes('coffee')) {
                    return { 
                        title: 'Loading Coffee Recipes...', 
                        subtitle: 'Grinding fresh beans',
                        animation: 'https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie'
                    };
                } else if (href.includes('cocktail')) {
                    return { 
                        title: 'Loading Cocktail Recipes...', 
                        subtitle: 'Mixing perfect drinks',
                        animation: 'https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie'
                    };
                } else if (href.includes('smoothie')) {
                    return { 
                        title: 'Loading Smoothie Recipes...', 
                        subtitle: 'Blending healthy drinks',
                        animation: 'https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie'
                    };
                } else if (href.includes('juices')) {
                    return { 
                        title: 'Loading Juice Recipes...', 
                        subtitle: 'Extracting fresh juices',
                        animation: 'https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie'
                    };
                } else if (href.includes('fruittea')) {
                    return { 
                        title: 'Loading Fruit Tea Recipes...', 
                        subtitle: 'Steeping aromatic teas',
                        animation: 'https://lottie.host/0474c5a5-5252-43f4-b2a1-2728acf6b4cd/xlQZbUYuIf.lottie'
                    };
                }
            }
            
            return textMap[linkText] || { 
                title: 'Loading...', 
                subtitle: 'Please wait while we prepare your content',
                animation: 'https://lottie.host/d5f71086-414e-4a71-bb9e-8493aee61ffe/m1pbm5YX5j.lottie'
            };
        }
        
        // Add loading effect to all navigation links
        function addLoadingEffect(link) {
            link.addEventListener('click', function(e) {
                // Skip if it's a dropdown toggle, external link, or nested dropdown item
                if (this.getAttribute('data-bs-toggle') || 
                    this.getAttribute('href') === '#' || 
                    this.getAttribute('href').startsWith('http') ||
                    this.closest('.dropdown-menu .dropdown-menu')) {
                    return;
                }
                
                e.preventDefault();
                
                const href = this.getAttribute('href');
                const linkText = this.textContent.trim();
                const loadingText = getLoadingText(linkText, href);
                
                // Add fade out effect to clicked link
                this.classList.add('fade-out');
                
                // Update loading text
                loadingTitle.textContent = loadingText.title;
                loadingSubtitle.textContent = loadingText.subtitle;
                
                // Update Lottie animation source and size
                const lottiePlayer = document.querySelector('dotlottie-player');
                if (lottiePlayer) {
                    lottiePlayer.setAttribute('src', loadingText.animation);
                    
                    // Set size based on animation type
                    if (loadingText.animation.includes('0474c5a5-5252-43f4-b2a1-2728acf6b4cd') || 
                        linkText === 'Admin Control Panel') {
                        // Recipe animations and Admin Panel - smaller size
                        lottiePlayer.style.width = '300px';
                        lottiePlayer.style.height = '300px';
                    } else {
                        // Other animations - larger size
                        lottiePlayer.style.width = '520px';
                        lottiePlayer.style.height = '320px';
                    }
                }
                
                // Show transition overlay after fade out
                setTimeout(() => {
                    overlay.classList.add('active');
                }, 800);
                
                // Add click effect
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 150);
                
                // Navigate after transition
                setTimeout(() => {
                    // Add fade out effect to overlay
                    overlay.classList.add('fade-out');
                    
                    // Navigate after fade out
                    setTimeout(() => {
                        window.location.href = href;
                    }, 1200);
                }, 3000);
            });
        }
        
        // Apply loading effect only to main navigation links (not nested dropdown items)
        const mainNavLinks = document.querySelectorAll('.nav-link:not([data-bs-toggle]), .dropdown-menu > .dropend > .dropdown-item');
        mainNavLinks.forEach((link, index) => {
            addLoadingEffect(link);
            
            // Stagger fade in animation
            link.style.animationDelay = `${index * 0.1}s`;
        });
        
        // Hide overlay when page loads (for back navigation)
        if (overlay.classList.contains('active')) {
            setTimeout(() => {
                overlay.classList.add('fade-out');
                setTimeout(() => {
                    overlay.classList.remove('active', 'fade-out');
                }, 1200);
            }, 500);
        }
    });
</script>