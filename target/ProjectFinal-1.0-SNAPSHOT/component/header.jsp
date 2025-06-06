<nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #00796B;">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.html" style="margin-left: 20px;">How to Cook Recipes</a>
        
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
                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Milk Tea</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Classic Milk Tea</a></li>
                                <li><a class="dropdown-item" href="#">Milk Tea Latte</a></li>
                                <li><a class="dropdown-item" href="#">Tropical Milk Tea</a></li>
                                <li><a class="dropdown-item" href="#">Matcha Milk Tea</a></li>
                            </ul>
                        </li>
                        <li class="dropend">
                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Fruit Tea</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Basic Fruit Tea</a></li>
                                <li><a class="dropdown-item" href="#">Pineapple Fruit Tea</a></li>
                                <li><a class="dropdown-item" href="#">Peach Oolong Tea</a></li>
                                <li><a class="dropdown-item" href="#">Strawberry Jasmine Tea</a></li>
                                <li><a class="dropdown-item" href="#">Mango Black Tea</a></li>
                            </ul>
                        </li>
                        <li class="dropend">
                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Coffee</a>
                            <ul class="dropdown-menu">
                                <li class="dropend">
                                    <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">ColdBrew</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=htmcoldbrew">How to make ColdBrew</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=coldbrew-latte">ColdBrew Latte</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=vanilla-sweet-cream-cold-brew">Vanilla Sweet Cream Cold Brew</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=tropical-cold-brew">Tropical Cold Brew</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Vietnamese Coffee</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=traditional-vietnamese-drip">Traditional Vietnamese Drip Coffee</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=bac-xiu">Bac Xiu</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=egg-coffee">Egg Coffee</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=orange-coffee">Orange Coffee</a></li>
                                    </ul>
                                </li>
                                <li class="dropend">
                                    <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Italian Coffee</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=cappuccino">Cappuccino</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=latte">Latte</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=moka">Moka</a></li>
                                        <li><a class="dropdown-item" href="navigation?action=recipe&category=coffee&recipe=macchiato">Macchiato</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="dropend">
                            <a class="dropdown-item dropdown-toggle" href="#" data-bs-toggle="dropdown">Smoothie</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="navigation?action=recipe&category=smoothie&recipe=fruit-smoothie">Fruit Smoothie</a></li>
                                <li><a class="dropdown-item" href="navigation?action=recipe&category=smoothie&recipe=green-smoothie">Seed Smoothie</a></li>
                                <li><a class="dropdown-item" href="navigation?action=recipe&category=smoothie&recipe=protein-smoothie">Green Smoothie (Vegeterian)</a></li>
                                <li><a class="dropdown-item" href="navigation?action=recipe&category=smoothie&recipe=seed-smoothie">Smoothie Protein</a></li>
                            </ul>
                        </li>
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
                            <a class="dropdown-item text-danger" href="LogoutServlet">
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