<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AI Chatbot</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .chat-container {
                height: 70vh;
                overflow-y: auto;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                margin-bottom: 20px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .message {
                margin-bottom: 15px;
                padding: 10px 15px;
                border-radius: 15px;
                max-width: 80%;
                word-wrap: break-word;
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
                background-color: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .input-container textarea {
                padding-right: 50px;
                resize: none;
                border: 1px solid #dee2e6;
                border-radius: 5px;
            }
            .send-button {
                position: absolute;
                right: 25px;
                bottom: 25px;
                background-color: #007bff;
                border: none;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: white;
                transition: background-color 0.2s;
            }
            .send-button:hover {
                background-color: #0056b3;
            }
            .typing-indicator {
                display: none;
                padding: 10px 15px;
                background-color: #e9ecef;
                border-radius: 15px;
                margin-bottom: 15px;
                color: #6c757d;
            }
            .typing-indicator span {
                animation: typing 1s infinite;
                display: inline-block;
            }
            @keyframes typing {
                0% { opacity: 0.3; }
                50% { opacity: 1; }
                100% { opacity: 0.3; }
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">AI Chatbot</h3>
                            <a href="indexLogin.jsp" class="btn btn-outline-light btn-sm">
                                <i class="fas fa-arrow-left"></i> Back
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="chat-container" id="chatContainer">
                                <div class="message ai-message">
                                    Hello! I'm your AI assistant. How can I help you today?
                                </div>
                                <div class="typing-indicator" id="typingIndicator">
                                    AI is typing<span>.</span><span>.</span><span>.</span>
                                </div>
                            </div>
                            <form id="chatForm" action="${pageContext.request.contextPath}/ai" method="POST">
                                <div class="input-container">
                                    <textarea class="form-control" id="prompt" name="prompt" rows="3" 
                                              placeholder="Type your message here..." required></textarea>
                                    <button type="submit" class="send-button">
                                        <i class="fas fa-paper-plane"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            document.getElementById('chatForm').addEventListener('submit', function(e) {
                e.preventDefault();
                const prompt = document.getElementById('prompt').value;
                if (!prompt.trim()) return;

                // Add user message to chat
                addMessage(prompt, true);
                
                // Show typing indicator
                const typingIndicator = document.getElementById('typingIndicator');
                typingIndicator.style.display = 'block';
                
                // Send request to server
                const requestData = {
                    prompt: prompt
                };
                console.log('Sending request:', requestData);
                
                fetch(this.action, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify(requestData)
                })
                .then(response => {
                    console.log('Response status:', response.status);
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Received data:', data);
                    // Hide typing indicator
                    typingIndicator.style.display = 'none';
                    
                    if (data.error) {
                        addMessage('Error: ' + data.error, false);
                    } else if (data.response) {
                        addMessage(data.response, false);
                    } else {
                        addMessage('Sorry, no response received.', false);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Hide typing indicator
                    typingIndicator.style.display = 'none';
                    addMessage('Sorry, there was an error processing your request: ' + error.message, false);
                });

                // Clear input
                document.getElementById('prompt').value = '';
            });

            function addMessage(text, isUser) {
                const chatContainer = document.getElementById('chatContainer');
                const messageDiv = document.createElement('div');
                messageDiv.className = `message ${isUser ? 'user-message' : 'ai-message'}`;
                messageDiv.textContent = text;
                
                // Insert before typing indicator
                const typingIndicator = document.getElementById('typingIndicator');
                chatContainer.insertBefore(messageDiv, typingIndicator);
                
                // Scroll to bottom
                chatContainer.scrollTop = chatContainer.scrollHeight;
            }
        </script>
    </body>
</html> 