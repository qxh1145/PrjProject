-- Tạo database nếu chưa tồn tại
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ProjectPrjDB')
BEGIN
    CREATE DATABASE ProjectPrjDB;
END
GO

USE ProjectPrjDB;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE Users (
        username VARCHAR(50) PRIMARY KEY,
        password VARCHAR(50) NOT NULL,
        account_type VARCHAR(20) DEFAULT 'Free' CHECK (account_type IN ('Free', 'premium'))
    );
END

-- Add new columns to existing Users table if it exists
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'account_type')
    BEGIN
        ALTER TABLE Users ADD account_type VARCHAR(20) DEFAULT 'Free' CHECK (account_type IN ('Free', 'premium'));
    END
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Posts')
BEGIN
    CREATE TABLE Posts (
    post_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) FOREIGN KEY REFERENCES Users(username),
    content VARCHAR(MAX),
    image_path VARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT check_content_or_image CHECK (
        (content IS NOT NULL AND LEN(content) > 0) OR 
        (image_path IS NOT NULL AND LEN(image_path) > 0)
    )
);
END


-- Thêm dữ liệu mẫu cho Posts nếu chưa có
IF NOT EXISTS (SELECT * FROM Posts)
BEGIN
    INSERT INTO Posts (username, content, created_at)
    VALUES ('admin', 'Welcome to our coffee community! Share your favorite coffee recipes and experiences here.', GETDATE());
END

<<<<<<< HEAD
-- Tạo bảng payments để lưu trữ thông tin thanh toán
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'payments')
BEGIN
    CREATE TABLE payments (
        id INT IDENTITY(1,1) PRIMARY KEY,
        transaction_id VARCHAR(50) UNIQUE NOT NULL,
        username VARCHAR(50) NOT NULL,
        amount DECIMAL(10,2) NOT NULL,
        description TEXT,
        status VARCHAR(20) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'SUCCESS', 'FAILED', 'EXPIRED')),
        created_at DATETIME DEFAULT GETDATE(),
        updated_at DATETIME DEFAULT GETDATE(),
        expiry_time DATETIME NOT NULL,
        bank_code VARCHAR(10),
        bank_name VARCHAR(100),
        qr_data TEXT,
        account_number VARCHAR(50),
        account_name VARCHAR(100),
        payment_method VARCHAR(20) DEFAULT 'QR_CODE'
    );
    
    -- Tạo indexes cho bảng payments
    CREATE INDEX idx_transaction_id ON payments(transaction_id);
    CREATE INDEX idx_username ON payments(username);
    CREATE INDEX idx_status ON payments(status);
    CREATE INDEX idx_created_at ON payments(created_at);
    CREATE INDEX idx_expiry_time ON payments(expiry_time);
END
ELSE
BEGIN
    -- Thêm các cột mới nếu bảng đã tồn tại
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('payments') AND name = 'account_number')
    BEGIN
        ALTER TABLE payments ADD account_number VARCHAR(50);
    END
    
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('payments') AND name = 'account_name')
    BEGIN
        ALTER TABLE payments ADD account_name VARCHAR(100);
    END
    
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('payments') AND name = 'payment_method')
    BEGIN
        ALTER TABLE payments ADD payment_method VARCHAR(20) DEFAULT 'QR_CODE';
    END
END

-- Cập nhật tài khoản admin thành Premium
UPDATE Users SET account_type = 'premium' WHERE username = 'admin';
=======
-- Thêm dữ liệu mẫu cho Users nếu chưa có
IF NOT EXISTS (SELECT * FROM Users WHERE username = 'admin')
BEGIN
    INSERT INTO Users (username, password, account_type)
    VALUES ('admin', 'admin123', 'premium');
END

IF NOT EXISTS (SELECT * FROM Users WHERE username = 'user1')
BEGIN
    INSERT INTO Users (username, password, account_type)
    VALUES ('user1', 'password123', 'Free');
END

IF NOT EXISTS (SELECT * FROM Users WHERE username = 'user2')
BEGIN
    INSERT INTO Users (username, password, account_type)
    VALUES ('user2', 'password123', 'premium');
END
>>>>>>> 90e75cb285a43ef1da25ced5dd4484be0c7172b1

select * from Users
select * from Posts
   SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'payments';