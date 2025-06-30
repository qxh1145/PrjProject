<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Coffee Recipes</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            background: linear-gradient(120deg, #f5f5f5 60%, #8d6e63 100%); 
            color: #333; 
            font-family: 'Poppins', sans-serif; 
            padding-top: 70px; 
        }
        .container { 
            max-width: 1200px; 
            margin: 0 auto; 
            padding: 2.5rem 1rem; 
        }
        .overview-header { 
            text-align: center; 
            margin-bottom: 2.5rem; 
        }
        .overview-header h1 { 
            font-family: 'Montserrat', sans-serif; 
            font-size: 2.5rem; 
            color: #5d4037; 
            margin-bottom: 0.5rem; 
        }
        .overview-header p { 
            color: #555; 
            font-size: 1.1rem; 
        }
        .recipe-list { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); 
            gap: 2.2rem; 
            justify-items: center; 
        }
        .recipe-card { 
            background: #fff; 
            border-radius: 28px; 
            box-shadow: 0 8px 32px rgba(0,0,0,0.15), 0 1.5px 4px rgba(0,0,0,0.08); 
            padding: 1.5rem 1rem 2rem 1rem; 
            max-width: 290px; 
            text-align: center; 
            position: relative; 
            overflow: hidden; 
            transition: transform 0.25s, box-shadow 0.25s; 
        }
        .recipe-card:hover { 
            transform: translateY(-10px) scale(1.04); 
            box-shadow: 0 16px 48px rgba(0,0,0,0.22); 
        }
        .img-wrapper { 
            position: relative; 
        }
        .recipe-img { 
            width: 100%; 
            height: 150px; 
            object-fit: cover; 
            border-radius: 18px; 
            margin-bottom: 1rem; 
            transition: filter 0.2s; 
        }
        .recipe-card:hover .recipe-img { 
            filter: brightness(0.85); 
        }
        .badge { 
            position: absolute; 
            top: 12px; 
            left: 12px; 
            background: linear-gradient(90deg, #8d6e63, #5d4037); 
            color: #fff; 
            padding: 0.3em 0.8em; 
            border-radius: 12px; 
            font-size: 0.85em; 
            font-weight: 600; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.12); 
        }
        .recipe-title { 
            font-size: 1.25rem; 
            font-weight: 700; 
            color: #5d4037; 
            margin-bottom: 0.5rem; 
            font-family: 'Montserrat', sans-serif; 
        }
        .recipe-desc { 
            font-size: 0.98rem; 
            color: #666; 
            margin-bottom: 1rem; 
            min-height: 38px; 
        }
        .view-btn { 
            display: inline-block; 
            margin-top: 0.5rem; 
            padding: 0.6rem 1.5rem; 
            background: linear-gradient(90deg, #5d4037, #8d6e63); 
            color: #fff; 
            border-radius: 24px; 
            text-decoration: none; 
            font-weight: 600; 
            font-size: 1.05rem; 
            box-shadow: 0 2px 8px rgba(141,110,99,0.12); 
            transition: background 0.2s, box-shadow 0.2s; 
        }
        .view-btn i { 
            margin-right: 0.5em; 
        }
        .view-btn:hover { 
            background: linear-gradient(90deg, #8d6e63, #5d4037); 
            box-shadow: 0 4px 16px rgba(141,110,99,0.18); 
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../../../../component/header.jsp" %>
        <div class="overview-header">
            <h1>All Coffee Recipes</h1>
            <p>Discover the art of coffee making, from classic brews to modern creations!</p>
        </div>
        <div class="recipe-list">
            <!-- Cold Brew Section -->
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=400&q=80" alt="How to make ColdBrew" class="recipe-img"/>
                    <span class="badge">Popular</span>
                </div>
                <div class="recipe-title">How to make ColdBrew</div>
                <div class="recipe-desc">Cách pha cà phê cold brew truyền thống, vị đậm đà, ít chua, mượt mà.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=htmcoldbrew" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80" alt="ColdBrew Latte" class="recipe-img"/>
                </div>
                <div class="recipe-title">ColdBrew Latte</div>
                <div class="recipe-desc">Cold brew kết hợp với sữa tươi, vị béo nhẹ, thơm ngậy, mượt mà.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=coldbrew-latte" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=400&q=80" alt="Vanilla Sweet Cream Cold Brew" class="recipe-img"/>
                    <span class="badge">New</span>
                </div>
                <div class="recipe-title">Vanilla Sweet Cream Cold Brew</div>
                <div class="recipe-desc">Cold brew với kem ngọt vani, vị ngọt dịu, hương thơm quyến rũ.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=vanilla-sweet-cream-cold-brew" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80" alt="Tropical Cold Brew" class="recipe-img"/>
                </div>
                <div class="recipe-title">Tropical Cold Brew</div>
                <div class="recipe-desc">Cold brew vị trái cây nhiệt đới, tươi mát, độc đáo, rất hợp mùa hè.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=tropical-cold-brew" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            
            <!-- Vietnamese Coffee Section -->
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80" alt="Traditional Vietnamese Drip Coffee" class="recipe-img"/>
                    <span class="badge">Classic</span>
                </div>
                <div class="recipe-title">Traditional Vietnamese Drip Coffee</div>
                <div class="recipe-desc">Cà phê phin truyền thống Việt Nam, vị đậm đà, thơm ngậy đặc trưng.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=traditional-vietnamese-drip" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=400&q=80" alt="Bac Xiu" class="recipe-img"/>
                </div>
                <div class="recipe-title">Bac Xiu</div>
                <div class="recipe-desc">Cà phê sữa đặc Việt Nam, vị ngọt béo, thơm ngậy, rất được yêu thích.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=bac-xiu" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=400&q=80" alt="Egg Coffee" class="recipe-img"/>
                    <span class="badge">Unique</span>
                </div>
                <div class="recipe-title">Egg Coffee</div>
                <div class="recipe-desc">Cà phê trứng Hà Nội, vị béo ngậy, thơm ngọt, độc đáo và hấp dẫn.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=egg-coffee" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80" alt="Orange Coffee" class="recipe-img"/>
                </div>
                <div class="recipe-title">Orange Coffee</div>
                <div class="recipe-desc">Cà phê cam, vị chua ngọt tự nhiên, tươi mát, rất hợp cho buổi sáng.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=orange-coffee" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            
            <!-- Italian Coffee Section -->
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=400&q=80" alt="Cappuccino" class="recipe-img"/>
                    <span class="badge">Italian</span>
                </div>
                <div class="recipe-title">Cappuccino</div>
                <div class="recipe-desc">Cappuccino Ý truyền thống, tỷ lệ hoàn hảo giữa espresso, sữa nóng và bọt sữa.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=cappuccino" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=400&q=80" alt="Latte" class="recipe-img"/>
                </div>
                <div class="recipe-title">Latte</div>
                <div class="recipe-desc">Latte mượt mà với nhiều sữa nóng, ít bọt sữa, vị béo nhẹ, thơm ngậy.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=latte" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1461023058943-07fcbe16d735?auto=format&fit=crop&w=400&q=80" alt="Moka" class="recipe-img"/>
                    <span class="badge">Strong</span>
                </div>
                <div class="recipe-title">Moka</div>
                <div class="recipe-desc">Cà phê Moka đậm đà, vị mạnh, thơm ngậy, rất hợp cho những người thích cà phê đậm.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=moka" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
            <div class="recipe-card">
                <div class="img-wrapper">
                    <img src="https://images.unsplash.com/photo-1572442388796-11668a67e53d?auto=format&fit=crop&w=400&q=80" alt="Macchiato" class="recipe-img"/>
                </div>
                <div class="recipe-title">Macchiato</div>
                <div class="recipe-desc">Macchiato với một chút sữa nóng, vị đậm đà của espresso, thơm ngậy của sữa.</div>
                <a href="main?action=navigation&navAction=recipe&category=coffee&recipe=macchiato" class="view-btn"><i class="fas fa-eye"></i>View Recipe</a>
            </div>
        </div>
    </div>
    <%@ include file="../../../../component/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 