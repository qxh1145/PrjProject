<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upgrade to Premium - How to Cook Recipes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .premium-header {
            color: white;
            padding: 3rem 0;
            margin-bottom: 2rem;
            margin-top: 50px;
            background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                            url('component/images/BartenderSpiritsAwardsUS-01022025054242000000-67767bb248274.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            position: relative;
        }
        .pricing-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            transition: transform 0.3s;
            height: 100%;
        }
        .pricing-card:hover {
            transform: translateY(-5px);
        }
        .premium-feature {
            margin: 1rem 0;
        }
        .premium-feature i {
            color: #00796B;
            margin-right: 0.5rem;
        }
        .btn-premium {
            background-color: #00796B;
            color: white;
            border: none;
            padding: 0.8rem 2rem;
            border-radius: 25px;
            transition: all 0.3s;
        }
        .btn-premium:hover {
            background-color: #005B4B;
            color: white;
            transform: scale(1.05);
        }
        .card-body {
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .premium-features {
            flex-grow: 1;
        }
        .pricing-section {
            min-height: 600px;
        }
        .price-tag {
            margin: 2rem 0;
        }
        .badge-best-value {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 0.9rem;
            padding: 0.5rem 1rem;
        }
    </style>
</head>
<body>
    <%@include file="component/header.jsp"%>
    <!-- Premium Header -->
    <div class="premium-header text-center">
        <div class="container">
            <h1 class="display-4">Upgrade to Premium</h1>
            <p class="lead">Unlock all features and enhance your cooking experience</p>
        </div>
    </div>

    <!-- Pricing Section -->
    <div class="container pricing-section">
        <div class="row justify-content-center h-100">
            <!-- Monthly Plan -->
            <div class="col-md-4 mb-4">
                <div class="card pricing-card">
                    <div class="card-body text-center p-4">
                        <h3 class="card-title">Monthly Plan</h3>
                        <div class="price-tag">
                            <h2 class="display-4">$9.99</h2>
                            <p class="text-muted">per month</p>
                        </div>
                        <hr>
                        <div class="premium-features">
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Unlimited Recipe Access</span>
                            </div>
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Ad-Free Experience</span>
                            </div>
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Priority Support</span>
                            </div>
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Advanced Search</span>
                            </div>
                        </div>
                        <button class="btn btn-premium mt-4">Choose Monthly</button>
                    </div>
                </div>
            </div>

            <!-- Yearly Plan -->
            <div class="col-md-4 mb-4">
                <div class="card pricing-card">
                    <div class="card-body text-center p-4">
                        <span class="badge bg-warning text-dark badge-best-value">Best Value</span>
                        <h3 class="card-title">Yearly Plan</h3>
                        <div class="price-tag">
                            <h2 class="display-4">$89.99</h2>
                            <p class="text-muted">per year</p>
                            <p class="text-success">Save 25% compared to monthly</p>
                        </div>
                        <hr>
                        <div class="premium-features">
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>All Monthly Features</span>
                            </div>
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Exclusive Content</span>
                            </div>
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Early Access</span>
                            </div>
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Recipe Collections</span>
                            </div>
                        </div>
                        <button class="btn btn-premium mt-4">Choose Yearly</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>