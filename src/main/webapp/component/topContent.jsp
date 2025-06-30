<div class="top-content">
    <div class="hero-section">
        <div class="hero-slider">
            <!-- Slide 1 -->
            <div class="hero-slide active">
                <div class="slide-background">
                    <img src="images/Coffee Beans Background Banner.png" alt="Coffee Beans">
                    <div class="slide-overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="content-wrapper">
                        <div class="slide-badge">
                            <i class="fas fa-star"></i>
                            <span>Featured</span>
                        </div>
                        <h1 class="slide-title">Discover the Perfect Brew</h1>
                        <p class="slide-description">Explore our curated collection of premium coffee recipes, from classic espresso to innovative cold brews that will transform your coffee experience.</p>
                        <div class="slide-actions">
                            <a href="#" class="btn btn-primary btn-explore">
                                <i class="fas fa-coffee me-2"></i>
                                Start Exploring
                            </a>
                            <a href="#" class="btn btn-outline-light btn-learn">
                                <i class="fas fa-play me-2"></i>
                                Watch Video
                            </a>
                        </div>
                        <div class="slide-stats">
                            <div class="stat-item">
                                <span class="stat-number">500+</span>
                                <span class="stat-label">Recipes</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">50K+</span>
                                <span class="stat-label">Users</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">4.9</span>
                                <span class="stat-label">Rating</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 2 -->
            <div class="hero-slide">
                <div class="slide-background">
                    <img src="images/Coffee Beans Background Banner.png" alt="Tea Collection">
                    <div class="slide-overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="content-wrapper">
                        <div class="slide-badge">
                            <i class="fas fa-leaf"></i>
                            <span>Premium</span>
                        </div>
                        <h1 class="slide-title">Art of Tea Making</h1>
                        <p class="slide-description">Master the ancient art of tea brewing with our comprehensive guides and traditional techniques from around the world.</p>
                        <div class="slide-actions">
                            <a href="#" class="btn btn-primary btn-explore">
                                <i class="fas fa-mug-hot me-2"></i>
                                Learn More
                            </a>
                            <a href="#" class="btn btn-outline-light btn-learn">
                                <i class="fas fa-book me-2"></i>
                                Read Guide
                            </a>
                        </div>
                        <div class="slide-stats">
                            <div class="stat-item">
                                <span class="stat-number">200+</span>
                                <span class="stat-label">Tea Types</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">25K+</span>
                                <span class="stat-label">Enthusiasts</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">4.8</span>
                                <span class="stat-label">Rating</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Slide 3 -->
            <div class="hero-slide">
                <div class="slide-background">
                    <img src="images/Coffee Beans Background Banner.png" alt="Community">
                    <div class="slide-overlay"></div>
                </div>
                <div class="slide-content">
                    <div class="content-wrapper">
                        <div class="slide-badge">
                            <i class="fas fa-users"></i>
                            <span>Community</span>
                        </div>
                        <h1 class="slide-title">Join Our Community</h1>
                        <p class="slide-description">Connect with fellow coffee and tea enthusiasts. Share your recipes, discover new favorites, and be part of our growing global community.</p>
                        <div class="slide-actions">
                            <a href="#" class="btn btn-primary btn-explore">
                                <i class="fas fa-users me-2"></i>
                                Join Now
                            </a>
                            <a href="#" class="btn btn-outline-light btn-learn">
                                <i class="fas fa-share me-2"></i>
                                Share Recipe
                            </a>
                        </div>
                        <div class="slide-stats">
                            <div class="stat-item">
                                <span class="stat-number">10K+</span>
                                <span class="stat-label">Members</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">1K+</span>
                                <span class="stat-label">Recipes Shared</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">24/7</span>
                                <span class="stat-label">Support</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navigation Dots -->
        <div class="slider-dots">
            <button class="dot active" data-slide="0"></button>
            <button class="dot" data-slide="1"></button>
            <button class="dot" data-slide="2"></button>
        </div>

        <!-- Navigation Arrows -->
        <button class="slider-arrow prev">
            <i class="fas fa-chevron-left"></i>
        </button>
        <button class="slider-arrow next">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
</div>

<style>
.top-content {
    margin-top: 76px;
    margin-bottom: 4rem;
}

.hero-section {
    position: relative;
    height: 600px;
    overflow: hidden;
    border-radius: 24px;
    box-shadow: 0 25px 80px rgba(0, 121, 107, 0.25);
}

.hero-slider {
    position: relative;
    width: 100%;
    height: 100%;
}

.hero-slide {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0;
    transition: opacity 0.8s cubic-bezier(0.4, 0, 0.2, 1);
    display: flex;
    align-items: center;
}

.hero-slide.active {
    opacity: 1;
}

.slide-background {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.slide-background img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.slide-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, 
        rgba(0, 121, 107, 0.8) 0%, 
        rgba(0, 77, 64, 0.9) 50%, 
        rgba(0, 0, 0, 0.7) 100%);
}

.slide-content {
    position: relative;
    z-index: 2;
    width: 100%;
    padding: 0 4rem;
}

.content-wrapper {
    max-width: 600px;
    animation: slideInLeft 1s ease-out;
}

.slide-badge {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    border-radius: 25px;
    padding: 0.5rem 1rem;
    margin-bottom: 1.5rem;
    color: var(--white);
    font-size: 0.9rem;
    font-weight: 500;
}

.slide-badge i {
    color: var(--accent-color);
}

.slide-title {
    font-size: 3.5rem;
    font-weight: 700;
    color: var(--white);
    margin-bottom: 1.5rem;
    line-height: 1.2;
    text-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.slide-description {
    font-size: 1.2rem;
    color: rgba(255, 255, 255, 0.9);
    margin-bottom: 2rem;
    line-height: 1.6;
}

.slide-actions {
    display: flex;
    gap: 1rem;
    margin-bottom: 3rem;
}

.btn-explore {
    background: linear-gradient(135deg, var(--primary-color), var(--primary-light));
    border: none;
    border-radius: 30px;
    padding: 1rem 2rem;
    font-weight: 600;
    font-size: 1rem;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.btn-explore::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
    transition: left 0.5s ease;
}

.btn-explore:hover::before {
    left: 100%;
}

.btn-explore:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(0, 121, 107, 0.4);
}

.btn-learn {
    border: 2px solid rgba(255, 255, 255, 0.8);
    border-radius: 30px;
    padding: 1rem 2rem;
    font-weight: 600;
    font-size: 1rem;
    transition: all 0.3s ease;
    background: transparent;
    color: var(--white);
}

.btn-learn:hover {
    background: var(--white);
    color: var(--primary-color);
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(255, 255, 255, 0.3);
}

.slide-stats {
    display: flex;
    gap: 2rem;
}

.stat-item {
    text-align: center;
}

.stat-number {
    display: block;
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--accent-color);
    margin-bottom: 0.25rem;
}

.stat-label {
    font-size: 0.9rem;
    color: rgba(255, 255, 255, 0.8);
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Navigation Dots */
.slider-dots {
    position: absolute;
    bottom: 2rem;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    gap: 1rem;
    z-index: 3;
}

.dot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    border: 2px solid rgba(255, 255, 255, 0.5);
    background: transparent;
    cursor: pointer;
    transition: all 0.3s ease;
}

.dot.active {
    background: var(--white);
    border-color: var(--white);
    transform: scale(1.2);
}

.dot:hover {
    background: rgba(255, 255, 255, 0.3);
}

/* Navigation Arrows */
.slider-arrow {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: none;
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    color: var(--white);
    font-size: 1.2rem;
    cursor: pointer;
    transition: all 0.3s ease;
    z-index: 3;
}

.slider-arrow:hover {
    background: rgba(255, 255, 255, 0.3);
    transform: translateY(-50%) scale(1.1);
}

.slider-arrow.prev {
    left: 2rem;
}

.slider-arrow.next {
    right: 2rem;
}

@keyframes slideInLeft {
    from {
        opacity: 0;
        transform: translateX(-50px);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}

/* Responsive Design */
@media (max-width: 768px) {
    .hero-section {
        height: 500px;
        border-radius: 16px;
    }
    
    .slide-content {
        padding: 0 2rem;
    }
    
    .slide-title {
        font-size: 2.5rem;
    }
    
    .slide-description {
        font-size: 1rem;
    }
    
    .slide-actions {
        flex-direction: column;
        gap: 0.75rem;
    }
    
    .slide-stats {
        gap: 1rem;
    }
    
    .slider-arrow {
        width: 40px;
        height: 40px;
        font-size: 1rem;
    }
    
    .slider-arrow.prev {
        left: 1rem;
    }
    
    .slider-arrow.next {
        right: 1rem;
    }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.dot');
    const prevBtn = document.querySelector('.slider-arrow.prev');
    const nextBtn = document.querySelector('.slider-arrow.next');
    let currentSlide = 0;

    function showSlide(index) {
        slides.forEach(slide => slide.classList.remove('active'));
        dots.forEach(dot => dot.classList.remove('active'));
        
        slides[index].classList.add('active');
        dots[index].classList.add('active');
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }

    function prevSlide() {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length;
        showSlide(currentSlide);
    }

    // Event listeners
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            currentSlide = index;
            showSlide(currentSlide);
        });
    });

    prevBtn.addEventListener('click', prevSlide);
    nextBtn.addEventListener('click', nextSlide);

    // Auto slide every 5 seconds
    setInterval(nextSlide, 5000);
});
</script>

