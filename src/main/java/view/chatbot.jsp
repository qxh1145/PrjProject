<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AI Chatbot</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .chat-container {
                height: 70vh;
                overflow-y: auto;
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .message {
                margin-bottom: 15px;
                padding: 10px 15px;
                border-radius: 15px;
                max-width: 80%;
            }
            .user-message {
                background-color: #007bff;
                color: white;
                margin-left: auto;
            }
            .ai-message {
                background-color: #e9ecef;
                color: #212529;
            }
            .input-container {
                position: relative;
            }
            .input-container textarea {
                padding-right: 50px;
                resize: none;
            }
            .send-button {
                position: absolute;
                right: 10px;
                bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h3 class="mb-0">AI Chatbot</h3>
                        </div>
                        <div class="card-body">
                            <div class="chat-container" id="chatContainer">
                                <div class="message ai-message">
                                    Hello! I'm your AI assistant. How can I help you today?
                                </div>
                            </div>
                            <form id="chatForm" action="${pageContext.request.contextPath}/ai/chat" method="POST">
                                <div class="input-container">
                                    <textarea class="form-control" id="prompt" name="prompt" rows="3" 
                                              placeholder="Type your message here..." required></textarea>
                                    <button type="submit" class="btn btn-primary send-button">
                                        <i class="fas fa-paper-plane"></i> Send
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/your-font-awesome-kit.js"></script>
        <script>
            document.getElementById('chatForm').addEventListener('submit', function(e) {
                e.preventDefault();
                const prompt = document.getElementById('prompt').value;
                if (!prompt.trim()) return;

                // Add user message to chat
                addMessage(prompt, true);
                
                // Send request to server
                fetch(this.action, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'prompt=' + encodeURIComponent(prompt)
                })
                .then(response => response.json())
                .then(data => {
                    addMessage(data.response, false);
                })
                .catch(error => {
                    addMessage('Sorry, there was an error processing your request.', false);
                });

                // Clear input
                document.getElementById('prompt').value = '';
            });

            function addMessage(text, isUser) {
                const chatContainer = document.getElementById('chatContainer');
                const messageDiv = document.createElement('div');
                messageDiv.className = `message ${isUser ? 'user-message' : 'ai-message'}`;
                messageDiv.textContent = text;
                chatContainer.appendChild(messageDiv);
                chatContainer.scrollTop = chatContainer.scrollHeight;
            }
        </script>
    </body>
</html> 