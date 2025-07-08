<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #00796B;">
    <div class="container-fluid">
        <a class="navbar-brand" href="indexLogin.jsp" style="margin-left: 20px;">How to Cook Recipes</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
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
                    <a class="nav-link" href="recipes" id="communityLink">Community</a>
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
                    <a class="nav-link" href="BuyPremium.jsp">Buy Premium</a>
                </li>
            </ul>

            <div class="d-flex" style="margin-right: 20px;">
                <div class="dropdown">
                    <div class="d-flex align-items-center" data-bs-toggle="dropdown" aria-expanded="false" style="cursor: pointer;">
                        <i class="fas fa-user me-2"></i>
                        <%
                            String username = (String) session.getAttribute("user");
                            String accountType = (String) session.getAttribute("accountType");
                            String premiumExpiryDate = (String) session.getAttribute("premiumExpiryDate");
                        %>
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
                                <%= premiumExpiryDate != null ? premiumExpiryDate : "N/A" %>
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
    }

    .dropdown-menu li:hover > .dropdown-menu {
        display: block;
    }

    .dropdown-menu .dropdown-menu {
        display: none;
        position: absolute;
    }
</style>