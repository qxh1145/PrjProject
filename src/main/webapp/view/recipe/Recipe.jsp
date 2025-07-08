<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Recipe" %>

<%!
    // Simple HTML escaping method to replace StringEscapeUtils
    public String escapeHtml(String text) {
        if (text == null) return "";
        return text.replace("&", "&amp;")
                  .replace("<", "&lt;")
                  .replace(">", "&gt;")
                  .replace("\"", "&quot;")
                  .replace("'", "&#39;");
    }
%>

<%
    // Get current user from session
    String currentUser = (String) session.getAttribute("user");
    boolean isLoggedIn = currentUser != null && !currentUser.trim().isEmpty();
    
    List<Recipe> recipes = (List<Recipe>) request.getAttribute("recipes");
    if (recipes == null || recipes.isEmpty()) {
%>
<div class="empty-state">
    <i class="fas fa-cocktail"></i>
    <h2>No recipes found</h2>
    <p>Be the first to share a drink recipe!</p>
</div>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>DrinkCraft - Recipe Feed</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
           * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    color: #333;
    background: linear-gradient(135deg, #e8f5e8 0%, #f0f9f0 100%);
    min-height: 100vh;
}

.navbar {
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
}

.nav-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 70px;
}

.logo {
    display: flex;
    align-items: center;
    font-size: 24px;
    font-weight: 700;
    color: #2c3e50;
}

.logo i {
    margin-right: 10px;
    color: #16a34a;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 20px;
}

.user-info {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 8px 16px;
    background: #f8f9fa;
    border-radius: 25px;
    border: 1px solid #e9ecef;
}

.user-info i {
    color: #16a34a;
}

.nav-links a {
    text-decoration: none;
    color: #2c3e50;
    font-weight: 500;
    padding: 8px 16px;
    border-radius: 20px;
    transition: all 0.3s ease;
}

.nav-links a:hover {
    background: #16a34a;
    color: white;
}

.post-btn {
    background: #16a34a;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 25px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    gap: 8px;
}

.post-btn:hover {
    background: #15803d;
    transform: translateY(-2px);
}

.post-btn:disabled {
    background: #94a3b8;
    cursor: not-allowed;
    transform: none;
}

.main-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 20px;
    display: grid;
    grid-template-columns: 1fr;
    gap: 30px;
}

.page-header {
    text-align: center;
    margin-bottom: 40px;
    color: #2c3e50;
}

.page-header h1 {
    font-size: 3rem;
    margin-bottom: 10px;
    font-weight: 300;
}

.page-header p {
    font-size: 1.2rem;
    opacity: 0.8;
}

.feed-container {
    display: flex;
    flex-direction: column;
    gap: 30px;
    align-items: center;
}

.post-card {
    background: white;
    border-radius: 20px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
    overflow: hidden;
    transition: all 0.3s ease;
    position: relative;
    width: 100%;
    max-width: 800px;
    margin: 0 auto;
}

.post-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.18);
}

.post-header {
    padding: 20px 24px 16px;
    border-bottom: 1px solid #f1f5f9;
    display: flex;
    align-items: center;
    gap: 12px;
}

.author-avatar {
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: linear-gradient(135deg, #16a34a, #22c55e);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 18px;
}

.post-info {
    flex: 1;
}

.author-name {
    font-weight: 600;
    color: #1a1a1a;
    font-size: 16px;
}

.post-time {
    color: #64748b;
    font-size: 14px;
    margin-top: 2px;
}

.post-content {
    padding: 0 24px 20px;
}

.title {
    font-size: 24px;
    font-weight: 700;
    color: #1a1a1a;
    margin-bottom: 12px;
    line-height: 1.3;
}

.description {
    color: #475569;
    font-size: 16px;
    line-height: 1.6;
    margin-bottom: 20px;
}

.recipe-img {
    width: 100%;
    height: 320px;
    object-fit: cover;
    border-radius: 16px;
    margin: 16px 0 24px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
}

.recipe-details {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
    margin-top: 20px;
}

.section-title {
    font-size: 18px;
    font-weight: 600;
    color: #16a34a;
    margin-bottom: 12px;
    display: flex;
    align-items: center;
    gap: 8px;
}

.section-title i {
    color: #22c55e;
    font-size: 16px;
}

.ingredients-list, .instructions-list {
    background: #f8fafc;
    border-radius: 12px;
    padding: 16px;
    border-left: 4px solid #22c55e;
}

.ingredients-list ul, .instructions-list ol {
    padding-left: 20px;
}

.ingredients-list li, .instructions-list li {
    margin-bottom: 8px;
    color: #475569;
    line-height: 1.5;
}

.post-actions {
    padding: 16px 24px;
    border-top: 1px solid #f1f5f9;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: #fafbfc;
}

.action-buttons {
    display: flex;
    gap: 20px;
}

.action-btn {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 10px 16px;
    border: none;
    background: none;
    color: #64748b;
    cursor: pointer;
    border-radius: 25px;
    transition: all 0.2s ease;
    font-size: 14px;
    font-weight: 500;
}

.action-btn:hover {
    background: #e2e8f0;
    color: #16a34a;
}

.action-btn:disabled {
    cursor: not-allowed;
    opacity: 0.6;
}

.action-btn.liked {
    color: #dc2626;
    background: #fef2f2;
}

.action-btn.liked:hover {
    background: #fecaca;
}

.comment-section {
    border-top: 1px solid #f1f5f9;
    padding: 20px 24px;
    background: #f8fafc;
}

.comment-input-container {
    display: flex;
    gap: 12px;
    margin-bottom: 20px;
}

.comment-avatar {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background: linear-gradient(135deg, #16a34a, #22c55e);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 14px;
}

.comment-input {
    flex: 1;
    padding: 12px 16px;
    border: 1px solid #e2e8f0;
    border-radius: 20px;
    background: white;
    font-size: 14px;
    resize: none;
    outline: none;
    transition: border-color 0.2s ease;
}

.comment-input:focus {
    border-color: #16a34a;
    box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.1);
}

.comment-submit {
    padding: 12px 20px;
    background: #16a34a;
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.2s ease;
}

.comment-submit:hover {
    background: #15803d;
}

.comment-submit:disabled {
    background: #94a3b8;
    cursor: not-allowed;
}

.comments-list {
    display: flex;
    flex-direction: column;
    gap: 16px;
}

.comment-item {
    display: flex;
    gap: 12px;
}

.comment-content {
    flex: 1;
    background: white;
    padding: 12px 16px;
    border-radius: 12px;
    position: relative;
    border: 1px solid #e2e8f0;
}

.comment-author {
    font-weight: 600;
    color: #1a1a1a;
    font-size: 14px;
    margin-bottom: 4px;
}

.comment-text {
    color: #475569;
    font-size: 14px;
    line-height: 1.5;
}

.comment-time {
    color: #94a3b8;
    font-size: 12px;
    margin-top: 8px;
}

.empty-state {
    text-align: center;
    padding: 60px 20px;
    color: #2c3e50;
}

.empty-state i {
    font-size: 4rem;
    margin-bottom: 20px;
    opacity: 0.7;
}

.login-notice {
    background: #fef3c7;
    border: 1px solid #f59e0b;
    border-radius: 12px;
    padding: 12px 16px;
    margin-bottom: 16px;
    text-align: center;
    color: #92400e;
}

.login-notice a {
    color: #16a34a;
    text-decoration: none;
    font-weight: 600;
}

.login-notice a:hover {
    text-decoration: underline;
}

.error-message {
    background: #fee2e2;
    border: 1px solid #fca5a5;
    border-radius: 8px;
    padding: 12px;
    margin: 10px 0;
    color: #dc2626;
    text-align: center;
}

.success-message {
    background: #dcfce7;
    border: 1px solid #86efac;
    border-radius: 8px;
    padding: 12px;
    margin: 10px 0;
    color: #166534;
    text-align: center;
}

.loading-comments {
    text-align: center;
    padding: 20px;
    color: #64748b;
    font-style: italic;
}

@media (max-width: 1024px) {
    .post-card {
        max-width: 700px;
    }
    
    .recipe-details {
        grid-template-columns: 1fr;
        gap: 20px;
    }
    
    .recipe-img {
        height: 280px;
    }
}

@media (max-width: 768px) {
    .main-content {
        padding: 20px 16px;
    }

    .post-card {
        border-radius: 16px;
        max-width: 600px;
    }

    .recipe-details {
        grid-template-columns: 1fr;
        gap: 16px;
    }

    .page-header h1 {
        font-size: 2.2rem;
    }

    .action-buttons {
        gap: 12px;
    }

    .nav-container {
        padding: 0 16px;
    }

    .nav-links {
        gap: 16px;
    }
    
    .recipe-img {
        height: 240px;
    }
}

@media (max-width: 480px) {
    .post-card {
        margin: 0 -4px;
        max-width: 100%;
    }

    .comment-input-container {
        flex-direction: column;
        gap: 8px;
    }
    
    .recipe-img {
        height: 200px;
    }
}
        </style>
    </head>
    <body>
        <nav class="navbar">
            <div class="nav-container">
                <div class="logo">
                    <i class="fas fa-cocktail"></i>
                    DrinkCraft
                </div>
                <div class="nav-links">
                    <div class="user-info">
                        <i class="fas fa-user"></i>
                        <span><%= isLoggedIn ? "Welcome " + escapeHtml(currentUser) : "Guest" %></span>
                    </div>
                    <a href="/"><i class="fas fa-home"></i> Home</a>
                    <a href="/recipes"><i class="fas fa-glass-water"></i> Recipes</a>
                    <% if (isLoggedIn) { %>
                    <a href="/profile"><i class="fas fa-user"></i> Profile</a>
                    <button class="post-btn" onclick="openPostModal()">
                        <i class="fas fa-plus"></i>
                        Post Recipe
                    </button>
                    <% } else { %>
                    <a href="/login"><i class="fas fa-sign-in-alt"></i> Login</a>
                    <a href="/register"><i class="fas fa-user-plus"></i> Register</a>
                    <% } %>
                </div>
            </div>
        </nav>

        <div class="main-content">
            <div class="page-header">
                <h1><i class="fas fa-tint"></i> Drink Recipe Feed</h1>
                <p>Discover and share amazing drink recipes with the community</p>
            </div>

            <div class="feed-container">
                <% for (Recipe recipe : recipes) { %>
                <div class="post-card" data-recipe-id="<%= recipe.getRecipeId() %>">
                    <div class="post-header">
                        <div class="author-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="post-info">
                            <div class="author-name">Drink Master</div>
                            <div class="post-time">2 hours ago</div>
                        </div>
                    </div>

                    <div class="post-content">
                        <div class="title"><%= escapeHtml(recipe.getTitle()) %></div>
                        <div class="description"><%= escapeHtml(recipe.getDescription()) %></div>

                        <% if (recipe.getImagePath() != null && !recipe.getImagePath().isEmpty()) { %>
                        <img src="<%= escapeHtml(recipe.getImagePath()) %>" alt="Drink Recipe Image" class="recipe-img">
                        <% } %>

                        <div class="recipe-details">
                            <div class="ingredients-list">
                                <div class="section-title">
                                    <i class="fas fa-list-ul"></i>
                                    Ingredients
                                </div>
                                <ul>
                                    <% for (String ing : recipe.getIngredients().split("\\n")) { %>
                                    <li><%= escapeHtml(ing.trim()) %></li>
                                        <% } %>
                                </ul>
                            </div>

                            <div class="instructions-list">
                                <div class="section-title">
                                    <i class="fas fa-tasks"></i>
                                    Instructions
                                </div>
                                <ol>
                                    <% for (String step : recipe.getInstructions().split("\\n")) { %>
                                    <li><%= escapeHtml(step.trim()) %></li>
                                        <% } %>
                                </ol>
                            </div>
                        </div>
                    </div>

                    <div class="post-actions">
                        <div class="action-buttons">
                            <button class="action-btn" data-action="like" <%= !isLoggedIn ? "disabled" : "" %>>
                                <i class="far fa-heart"></i>
                                <span>124</span>
                            </button>
                            <button class="action-btn" data-action="comment">
                                <i class="far fa-comment"></i>
                                <span>0</span>
                            </button>
                        </div>
                    </div>

                    <div class="comment-section" style="display: none;">
                        <% if (!isLoggedIn) { %>
                        <div class="login-notice">
                            <i class="fas fa-info-circle"></i>
                            Please <a href="/login">login</a> to add comments
                        </div>
                        <% } else { %>
                        <div class="comment-input-container">
                            <div class="comment-avatar"><%= currentUser.substring(0, 1).toUpperCase() %></div>
                            <textarea class="comment-input" placeholder="Share your thoughts about this recipe..." rows="2"></textarea>
                            <button class="comment-submit" data-action="submit-comment">
                                <i class="fas fa-paper-plane"></i>
                            </button>
                        </div>
                        <% } %>

                        <div class="comments-list">
                            <!-- Comments will be loaded here -->
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>

        <script>
            // Define all functions in global scope first
            var isLoggedIn = <%= isLoggedIn %>;
            var currentUser = '<%= isLoggedIn ? escapeHtml(currentUser) : "" %>';
            var contextPath = '<%= request.getContextPath() %>';

            // Global functions
            function toggleLike(button) {
                if (!isLoggedIn) {
                    showMessage('Please login to like recipes', 'error');
                    return;
                }

                const icon = button.querySelector('i');
                const count = button.querySelector('span');
                const currentCount = parseInt(count.textContent);

                if (button.classList.contains('liked')) {
                    button.classList.remove('liked');
                    icon.className = 'far fa-heart';
                    count.textContent = currentCount - 1;
                } else {
                    button.classList.add('liked');
                    icon.className = 'fas fa-heart';
                    count.textContent = currentCount + 1;
                }
            }

            function toggleComments(button) {
                const postCard = button.closest('.post-card');
                const commentSection = postCard.querySelector('.comment-section');

                if (commentSection.style.display === 'none' || commentSection.style.display === '') {
                    commentSection.style.display = 'block';
                    loadComments(postCard);
                    setTimeout(() => {
                        commentSection.scrollIntoView({behavior: 'smooth', block: 'nearest'});
                    }, 100);
                } else {
                    commentSection.style.display = 'none';
                }
            }

            function loadComments(postCard) {
                const recipeId = postCard.getAttribute('data-recipe-id');
                const commentsContainer = postCard.querySelector('.comments-list'); // Fixed: changed from .comments-container to .comments-list

                if (!commentsContainer) {
                    console.error('Comments container not found');
                    return;
                }

                // Show loading state
                commentsContainer.innerHTML = '<div class="loading-comments">Loading comments...</div>';

                const url = contextPath + '/main?action=comment&commentAction=getRecipeComments&recipeId=' + recipeId;

                fetch(url)
                        .then(response => {
                            if (!response.ok) {
                                throw new Error(`HTTP error! status: ${response.status}`);
                            }
                            return response.text(); // JSP trả về HTML
                        })
                        .then(html => {
                            commentsContainer.innerHTML = html;
                        })
                        .catch(error => {
                            console.error('Error loading comments:', error);
                            commentsContainer.innerHTML = '<p style="color: red;">Error loading comments. Please try again.</p>';
                        });
            }

            function addComment(button) {
                const postCard = button.closest('.post-card');
                const recipeId = postCard.getAttribute('data-recipe-id');
                const textarea = postCard.querySelector('.comment-input');
                const commentText = textarea.value.trim();

                if (!commentText) {
                    showMessage('Please enter a comment', 'error');
                    textarea.focus();
                    return;
                }

                if (commentText.length > 1000) {
                    showMessage('Comment is too long (max 1000 characters)', 'error');
                    return;
                }

                // Disable button and show loading state
                button.disabled = true;
                button.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
                textarea.disabled = true;

                const formData = new FormData();
                formData.append('action', 'comment');
                formData.append('commentAction', 'addRecipeComment');
                formData.append('recipeId', recipeId);
                formData.append('commentText', commentText);

                fetch(contextPath + '/main', {
                    method: 'POST',
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest'
                    },
                    body: formData
                })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error(`HTTP error! status: ${response.status}`);
                            }
                            return response.text(); // Đổi từ response.json() thành response.text()
                        })
                        .then(data => {
                            // Kiểm tra nếu response là JSON
                            try {
                                const jsonData = JSON.parse(data);
                                if (jsonData.success) {
                                    showMessage(jsonData.message || 'Comment added successfully', 'success');
                                    textarea.value = '';
                                    loadComments(postCard); // Reload comments
                                } else {
                                    showMessage(jsonData.message || 'Failed to add comment', 'error');
                                }
                            } catch (e) {
                                // Nếu không phải JSON, có thể là HTML error page
                                console.error('Server returned HTML instead of JSON:', data);
                                if (data.includes('<!DOCTYPE') || data.includes('<html')) {
                                    showMessage('Server error occurred. Please try again.', 'error');
                                } else {
                                    // Có thể là plain text message
                                    showMessage(data || 'Comment added successfully', 'success');
                                    textarea.value = '';
                                    loadComments(postCard);
                                }
                            }
                        })
                        .catch(error => {
                            console.error('Error adding comment:', error);
                            showMessage('Error adding comment. Please try again.', 'error');
                        })
                        .finally(() => {
                            // Re-enable button and restore original state
                            button.disabled = false;
                            button.innerHTML = '<i class="fas fa-paper-plane"></i>';
                            textarea.disabled = false;
                        });
            }

            function showMessage(message, type) {
                // Remove existing messages
                const existingMessages = document.querySelectorAll('.error-message, .success-message');
                existingMessages.forEach(msg => msg.remove());

                // Create new message
                const messageDiv = document.createElement('div');
                messageDiv.className = type === 'error' ? 'error-message' : 'success-message';
                messageDiv.textContent = message;
                messageDiv.style.cssText = 'position: fixed; top: 20px; right: 20px; padding: 12px 24px; border-radius: 4px; color: white; font-weight: bold; z-index: 9999; background: ' + (type === 'error' ? '#dc2626' : '#16a34a') + ';';

                document.body.appendChild(messageDiv);

                // Auto-remove after 5 seconds
                setTimeout(() => {
                    messageDiv.remove();
                }, 5000);
            }

            function formatDate(dateString) {
                try {
                    const date = new Date(dateString);
                    const now = new Date();
                    const diff = now - date;

                    if (diff < 60000) { // Less than 1 minute
                        return 'Just now';
                    } else if (diff < 3600000) { // Less than 1 hour
                        const minutes = Math.floor(diff / 60000);
                        return minutes + ' minute' + (minutes > 1 ? 's' : '') + ' ago';
                    } else if (diff < 86400000) { // Less than 1 day
                        const hours = Math.floor(diff / 3600000);
                        return hours + ' hour' + (hours > 1 ? 's' : '') + ' ago';
                    } else {
                        return date.toLocaleDateString();
                    }
                } catch (e) {
                    return dateString;
                }
            }

            function escapeHtml(text) {
                const div = document.createElement('div');
                div.textContent = text;
                return div.innerHTML;
            }

            function openPostModal() {
                if (!isLoggedIn) {
                    showMessage('Please login to post recipes', 'error');
                    return;
                }
                showMessage('Post recipe functionality would be implemented here', 'success');
            }

            // Event delegation when DOM is ready
            document.addEventListener('DOMContentLoaded', function () {
                // Event delegation for all buttons
                document.addEventListener('click', function (e) {
                    const button = e.target.closest('button');
                    if (!button)
                        return;

                    const action = button.getAttribute('data-action');
                    if (!action)
                        return;

                    e.preventDefault();

                    switch (action) {
                        case 'like':
                            toggleLike(button);
                            break;
                        case 'comment':
                            toggleComments(button);
                            break;
                        case 'submit-comment':
                            addComment(button);
                            break;
                    }
                });

                // Initialize comments count on page load
                const postCards = document.querySelectorAll('.post-card');
                postCards.forEach(card => {
                    const recipeId = card.getAttribute('data-recipe-id');
                    if (recipeId) {
                        console.log('Page loaded with recipe ID:', recipeId);
                    }
                });
            });
        </script>
    </body>
</html>