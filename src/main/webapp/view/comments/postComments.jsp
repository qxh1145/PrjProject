<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Comment" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%!
    // Simple HTML escaping method
    public String escapeHtml(String text) {
        if (text == null) return "";
        return text.replace("&", "&amp;")
                  .replace("<", "&lt;")
                  .replace(">", "&gt;")
                  .replace("\"", "&quot;")
                  .replace("'", "&#39;");
    }
    
    // Format date for display
    public String formatDate(Date date) {
        if (date == null) return "Unknown";
        
        Date now = new Date();
        long diff = now.getTime() - date.getTime();
        
        if (diff < 60000) { // Less than 1 minute
            return "Just now";
        } else if (diff < 3600000) { // Less than 1 hour
            long minutes = diff / 60000;
            return minutes + " minute" + (minutes > 1 ? "s" : "") + " ago";
        } else if (diff < 86400000) { // Less than 1 day
            long hours = diff / 3600000;
            return hours + " hour" + (hours > 1 ? "s" : "") + " ago";
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
            return sdf.format(date);
        }
    }
%>

<%
    List<Comment> comments = (List<Comment>) request.getAttribute("comments");
    Integer commentCount = (Integer) request.getAttribute("commentCount");
    Integer postId = (Integer) request.getAttribute("postId");
    
    if (comments == null || comments.isEmpty()) {
%>
<p style="text-align: center; color: #64748b; padding: 20px;">No comments yet. Be the first to comment!</p>
<%
    } else {
        for (Comment comment : comments) {
%>
<div class="comment-item" data-comment-id="<%= comment.getCommentId() %>">
    <div class="comment-avatar">
        <%= escapeHtml(comment.getUsername()).substring(0, 1).toUpperCase() %>
    </div>
    <div class="comment-content">
        <div class="comment-author"><%= escapeHtml(comment.getUsername()) %></div>
        <div class="comment-text"><%= escapeHtml(comment.getCommentText()) %></div>
        <div class="comment-time"><%= formatDate(comment.getCreatedAt()) %></div>
        
        <div class="comment-actions">
            <button class="reply-btn" onclick="toggleReplyForm(<%= comment.getCommentId() %>)">
                <i class="fas fa-reply"></i> Reply
            </button>
        </div>
        
        <!-- Reply form (hidden by default) -->
        <div class="reply-form" id="reply-form-<%= comment.getCommentId() %>" style="display: none;">
            <div class="reply-input-container">
                <textarea class="reply-input" placeholder="Write a reply..." rows="2"></textarea>
                <button class="reply-submit" onclick="addReply(<%= comment.getCommentId() %>, <%= postId %>)">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </div>
        </div>
        
        <!-- Replies section -->
        <div class="replies-container" id="replies-<%= comment.getCommentId() %>">
            <%
                if (comment.getReplies() != null && !comment.getReplies().isEmpty()) {
                    for (Comment reply : comment.getReplies()) {
            %>
            <div class="reply-item" data-reply-id="<%= reply.getCommentId() %>">
                <div class="reply-avatar">
                    <%= escapeHtml(reply.getUsername()).substring(0, 1).toUpperCase() %>
                </div>
                <div class="reply-content">
                    <div class="reply-author"><%= escapeHtml(reply.getUsername()) %></div>
                    <div class="reply-text"><%= escapeHtml(reply.getCommentText()) %></div>
                    <div class="reply-time"><%= formatDate(reply.getCreatedAt()) %></div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
<%
        }
    }
%>

<style>
/* Comment styles */
.comment-item {
    display: flex;
    gap: 12px;
    margin-bottom: 16px;
    padding: 12px;
    background: white;
    border-radius: 12px;
    border: 1px solid #e2e8f0;
}

.comment-avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: linear-gradient(135deg, #16a34a, #22c55e);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 16px;
    flex-shrink: 0;
}

.comment-content {
    flex: 1;
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
    margin-bottom: 8px;
}

.comment-time {
    color: #94a3b8;
    font-size: 12px;
    margin-bottom: 8px;
}

.comment-actions {
    margin-bottom: 12px;
}

.reply-btn {
    background: none;
    border: none;
    color: #64748b;
    font-size: 12px;
    cursor: pointer;
    padding: 4px 8px;
    border-radius: 4px;
    transition: all 0.2s ease;
}

.reply-btn:hover {
    background: #f1f5f9;
    color: #16a34a;
}

.reply-form {
    margin-top: 12px;
    padding: 12px;
    background: #f8fafc;
    border-radius: 8px;
    border: 1px solid #e2e8f0;
}

.reply-input-container {
    display: flex;
    gap: 8px;
    align-items: flex-end;
}

.reply-input {
    flex: 1;
    padding: 8px 12px;
    border: 1px solid #e2e8f0;
    border-radius: 6px;
    background: white;
    font-size: 14px;
    resize: vertical;
    min-height: 40px;
    outline: none;
    transition: border-color 0.2s ease;
}

.reply-input:focus {
    border-color: #16a34a;
    box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.1);
}

.reply-submit {
    padding: 8px 16px;
    background: #16a34a;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
    transition: all 0.2s ease;
    height: 40px;
    display: flex;
    align-items: center;
    gap: 4px;
}

.reply-submit:hover {
    background: #15803d;
}

.reply-submit:disabled {
    background: #94a3b8;
    cursor: not-allowed;
}

.replies-container {
    margin-top: 12px;
    padding-left: 20px;
    border-left: 2px solid #e2e8f0;
}

.reply-item {
    display: flex;
    gap: 10px;
    margin-bottom: 12px;
    padding: 8px;
    background: #f8fafc;
    border-radius: 8px;
}

.reply-avatar {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: linear-gradient(135deg, #16a34a, #22c55e);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 14px;
    flex-shrink: 0;
}

.reply-content {
    flex: 1;
}

.reply-author {
    font-weight: 600;
    color: #1a1a1a;
    font-size: 13px;
    margin-bottom: 2px;
}

.reply-text {
    color: #475569;
    font-size: 13px;
    line-height: 1.4;
    margin-bottom: 4px;
}

.reply-time {
    color: #94a3b8;
    font-size: 11px;
}
</style>

<script>
function toggleReplyForm(commentId) {
    const replyForm = document.getElementById('reply-form-' + commentId);
    if (replyForm.style.display === 'none') {
        replyForm.style.display = 'block';
        replyForm.querySelector('.reply-input').focus();
    } else {
        replyForm.style.display = 'none';
    }
}

function addReply(parentCommentId, postId) {
    const replyForm = document.getElementById('reply-form-' + parentCommentId);
    const textarea = replyForm.querySelector('.reply-input');
    const submitBtn = replyForm.querySelector('.reply-submit');
    const replyText = textarea.value.trim();
    
    if (!replyText) {
        alert('Please enter a reply');
        textarea.focus();
        return;
    }
    
    if (replyText.length > 1000) {
        alert('Reply is too long (max 1000 characters)');
        return;
    }
    
    // Disable button and show loading state
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
    textarea.disabled = true;
    
    const formData = `action=comment&commentAction=addPostReply&postId=${postId}&parentCommentId=${parentCommentId}&commentText=${encodeURIComponent(replyText)}`;
    
    fetch('/main', {
        method: 'POST',
        headers: { 
            'Content-Type': 'application/x-www-form-urlencoded',
            'X-Requested-With': 'XMLHttpRequest'
        },
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.text();
    })
    .then(responseText => {
        // Try to parse as JSON first
        try {
            const data = JSON.parse(responseText);
            if (data.success) {
                textarea.value = '';
                replyForm.style.display = 'none';
                location.reload(); // Reload to show new reply
            } else {
                alert(data.message || 'Failed to add reply');
            }
        } catch (jsonError) {
            // If JSON parsing fails, check if response indicates success
            if (responseText.includes('success') || responseText.includes('Reply added successfully')) {
                textarea.value = '';
                replyForm.style.display = 'none';
                location.reload(); // Reload to show new reply
            } else {
                console.error('Response is not JSON:', responseText);
                alert('Failed to add reply');
            }
        }
    })
    .catch(error => {
        console.error('Error adding reply:', error);
        alert('Error adding reply. Please try again.');
    })
    .finally(() => {
        // Re-enable button and restore original state
        submitBtn.disabled = false;
        submitBtn.innerHTML = '<i class="fas fa-paper-plane"></i>';
        textarea.disabled = false;
    });
}
</script>