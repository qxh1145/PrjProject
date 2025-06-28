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
            max-width: 400px;
            margin: 0 auto;
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
        .badge-lifetime {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 0.9rem;
            padding: 0.5rem 1rem;
            background-color: #28a745;
            color: white;
        }
        .modal-content {
            border-radius: 15px;
        }
        .qr-code-container {
            text-align: center;
            padding: 2rem;
        }
        .qr-code-placeholder {
            width: 200px;
            height: 200px;
            border: 2px dashed #ccc;
            margin: 1rem auto;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            cursor: pointer;
            overflow: hidden;
        }
        .qr-code-placeholder img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            transition: transform 0.3s ease;
        }
        .qr-code-placeholder:hover img {
            transform: scale(1.05);
        }
        .modal-zoom {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            cursor: pointer;
        }
        .modal-zoom img {
            max-width: 90%;
            max-height: 90%;
            object-fit: contain;
        }
        .modal-zoom .close-zoom {
            position: absolute;
            top: 20px;
            right: 30px;
            color: white;
            font-size: 30px;
            cursor: pointer;
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
        <div class="row justify-content-center">
            <!-- Lifetime Plan -->
            <div class="col-md-6 col-lg-4">
                <div class="card pricing-card">
                    <div class="card-body text-center p-4">
                        <span class="badge badge-lifetime">Lifetime</span>
                        <h3 class="card-title">Lifetime Plan</h3>
                        <div class="price-tag">
                            <h2 class="display-4">100,000 VND</h2>
                            <p class="text-muted">one-time payment</p>
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
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Exclusive Content</span>
                            </div>
                            <div class="premium-feature">
                                <i class="fas fa-check-circle"></i>
                                <span>Lifetime Updates</span>
                            </div>
                        </div>
                        <button class="btn btn-premium mt-4" data-bs-toggle="modal" data-bs-target="#paymentModal">Buy Now</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Payment Modal -->
    <div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="paymentModalLabel">Payment via QR Code</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="qr-code-container">
                        <h6>Scan QR Code to Pay</h6>
                        <p class="text-muted">Amount: 100,000 VND</p>
                        <div class="qr-code-placeholder" onclick="openZoomModal()">
                            <img src="images/QRBank.jpg" alt="QR Code" style="width: 100%; height: 100%; object-fit: contain;">
                        </div>
                        <p class="text-muted mt-3">Please scan the QR code above to complete your payment</p>
                        <div class="mt-3">
                            <input type="text" id="userEmailInput" class="form-control" placeholder="Enter your email" required />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-success" onclick="confirmPayment()">Confirm Payment</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Zoom Modal -->
    <div class="modal-zoom" id="zoomModal" onclick="closeZoomModal()">
        <span class="close-zoom" onclick="closeZoomModal()">&times;</span>
        <img src="images/QRBank.jpg" alt="QR Code Zoomed">
    </div>

    <!-- Alert message -->
    <div id="paymentAlert" class="alert d-none position-fixed top-0 start-50 translate-middle-x mt-3" style="z-index: 2000; min-width: 300px; max-width: 90%;"></div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function showAlert(message, type = 'danger') {
            const alertDiv = document.getElementById('paymentAlert');
            alertDiv.className = `alert alert-${type} position-fixed top-0 start-50 translate-middle-x mt-3 show`;
            alertDiv.innerHTML = message;
            alertDiv.style.display = 'block';
            setTimeout(() => {
                alertDiv.className = 'alert d-none position-fixed top-0 start-50 translate-middle-x mt-3';
                alertDiv.style.display = 'none';
            }, 3000);
        }

        function openZoomModal() {
            document.getElementById('zoomModal').style.display = 'flex';
        }
        
        function closeZoomModal() {
            document.getElementById('zoomModal').style.display = 'none';
        }
        
        // Close zoom modal when clicking outside the image
        document.getElementById('zoomModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeZoomModal();
            }
        });
        
        function confirmPayment() {
            // Lấy email từ input
            const userEmail = document.getElementById('userEmailInput').value.trim();
            if (!userEmail) {
                showAlert('Please enter your email to confirm payment.', 'danger');
                return;
            }
            const confirmBtn = event.target;
            const originalText = confirmBtn.innerHTML;
            confirmBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Processing...';
            confirmBtn.disabled = true;
            sendConfirmationEmail(userEmail, confirmBtn, originalText);
        }
        
        function sendConfirmationEmail(userEmail, confirmBtn, originalText) {
            // Create form data for email sending
            const formData = new FormData();
            formData.append('userEmail', userEmail);
            formData.append('amount', '100,000 VND');
            formData.append('plan', 'Lifetime Premium');
            formData.append('paymentMethod', 'QR Code Transfer');
            formData.append('requestType', 'Account Upgrade Request');
            
            // Send request to server with absolute path
            fetch('/ProjectFinal/confirmPayment', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) return;
                return response.json();
            })
            .then(data => {
                // Only close modal and show alert if data exists and success
                if (data && data.success) {
                    const modal = bootstrap.Modal.getInstance(document.getElementById('paymentModal'));
                    modal.hide();
                    showAlert('Payment confirmed successfully! Thank you for your purchase.', 'success');
                }
            })
            .finally(() => {
                // Restore button state
                confirmBtn.innerHTML = originalText;
                confirmBtn.disabled = false;
            });
        }
    </script>
</body>
</html>