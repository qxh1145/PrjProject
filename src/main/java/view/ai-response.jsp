<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AI Response</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="text-center">AI Response</h3>
                        </div>
                        <div class="card-body">
                            <div class="mb-4">
                                <h5>Your message:</h5>
                                <p class="border p-3 rounded">${aiResponse.prompt}</p>
                            </div>
                            
                            <c:if test="${not empty aiResponse.error}">
                                <div class="alert alert-danger">
                                    ${aiResponse.error}
                                </div>
                            </c:if>
                            
                            <c:if test="${not empty aiResponse.response}">
                                <div class="mb-4">
                                    <h5>AI's response:</h5>
                                    <p class="border p-3 rounded">${aiResponse.response}</p>
                                </div>
                            </c:if>
                            
                            <div class="text-center">
                                <a href="${pageContext.request.contextPath}/ai" class="btn btn-primary">New Chat</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html> 