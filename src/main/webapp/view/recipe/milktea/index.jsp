<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Milk Tea Recipes</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(120deg, #f5f5f5 60%, #e0f7fa 100%); color: #333; font-family: 'Poppins', sans-serif; padding-top: 70px; }
        .container { max-width: 1200px; margin: 0 auto; padding: 2.5rem 1rem; }
        .overview-header { text-align: center; margin-bottom: 2.5rem; }
        .overview-header h1 { font-family: 'Montserrat', sans-serif; font-size: 2.5rem; color: #00796B; margin-bottom: 0.5rem; }
        .overview-header p { color: #555; font-size: 1.1rem; }
        .recipe-list { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 2.2rem; justify-items: center; }
        .recipe-card { background: #fff; border-radius: 28px; box-shadow: 0 8px 32px rgba(0,0,0,0.15), 0 1.5px 4px rgba(0,0,0,0.08); padding: 1.5rem 1rem 2rem 1rem; max-width: 290px; text-align: center; position: relative; overflow: hidden; transition: transform 0.25s, box-shadow 0.25s; }
        .recipe-card:hover { transform: translateY(-10px) scale(1.04); box-shadow: 0 16px 48px rgba(0,0,0,0.22); }
        .img-wrapper { position: relative; }
        .recipe-img { width: 100%; height: 150px; object-fit: cover; border-radius: 18px; margin-bottom: 1rem; transition: filter 0.2s; }
        .recipe-card:hover .recipe-img { filter: brightness(0.85); }
        .badge { position: absolute; top: 12px; left: 12px; background: linear-gradient(90deg, #ff9800, #ff5722); color: #fff; padding: 0.3em 0.8em; border-radius: 12px; font-size: 0.85em; font-weight: 600; box-shadow: 0 2px 8px rgba(0,0,0,0.12); }
        .recipe-title { font-size: 1.25rem; font-weight: 700; color: #00796B; margin-bottom: 0.5rem; font-family: 'Montserrat', sans-serif; }
        .recipe-desc { font-size: 0.98rem; color: #666; margin-bottom: 1rem; min-height: 38px; }
        .view-btn { display: inline-block; margin-top: 0.5rem; padding: 0.6rem 1.5rem; background: linear-gradient(90deg, #00796B, #43cea2); color: #fff; border-radius: 24px; text-decoration: none; font-weight: 600; font-size: 1.05rem; box-shadow: 0 2px 8px rgba(67,206,162,0.12); transition: background 0.2s, box-shadow 0.2s; }
        .view-btn i { margin-right: 0.5em; }
        .view-btn:hover { background: linear-gradient(90deg, #43cea2, #00796B); box-shadow: 0 4px 16px rgba(67,206,162,0.18); }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../../../../component/header.jsp" %>
        <div class="overview-header">
            <h1>All Milk Tea Recipes</h1>
            <p>Discover the best milk tea recipes, from classic to creative blends!</p>
        </div>
        <div class="recipe-list">
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=400&q=80" alt="Classic Milk Tea" class="recipe-img"/>
                    <span class="badge">Best Seller</span>
                </div>
                <div class="recipe-title">Classic Milk Tea</div>
                <div class="recipe-desc">Trà sữa truyền thống, vị đậm đà, thơm ngậy, phù hợp mọi lứa tuổi.</div>
                <a href="main?action=recipe&type=milktea&name=classic-milk-tea" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1519864600265-abb23847ef2c?auto=format&fit=crop&w=400&q=80" alt="Milk Tea Latte" class="recipe-img"/>
                </div>
                <div class="recipe-title">Milk Tea Latte</div>
                <div class="recipe-desc">Sự kết hợp hoàn hảo giữa trà đen và sữa tươi, vị béo nhẹ, thơm dịu.</div>
                <a href="main?action=recipe&type=milktea&name=milk-tea-latte" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1502741338009-cac2772e18bc?auto=format&fit=crop&w=400&q=80" alt="Tropical Milk Tea" class="recipe-img"/>
                    <span class="badge">New</span>
                </div>
                <div class="recipe-title">Tropical Milk Tea</div>
                <div class="recipe-desc">Trà sữa vị trái cây nhiệt đới, tươi mát, độc đáo, rất được giới trẻ yêu thích.</div>
                <a href="main?action=recipe&type=milktea&name=tropical-milk-tea" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80" alt="Matcha Milk Tea" class="recipe-img"/>
                </div>
                <div class="recipe-title">Matcha Milk Tea</div>
                <div class="recipe-desc">Trà sữa matcha thanh mát, vị trà xanh tự nhiên, tốt cho sức khỏe.</div>
                <a href="main?action=recipe&type=milktea&name=matcha-milk-tea" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
        </div>
    </div>
    <%@ include file="../../../../component/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 