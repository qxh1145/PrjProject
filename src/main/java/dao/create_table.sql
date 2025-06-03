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
    content VARCHAR(MAX),  -- <-- sửa TEXT thành VARCHAR(MAX)
    image_url VARCHAR(255),
    created_at DATETIME DEFAULT GETDATE(),
    CONSTRAINT check_content_or_image CHECK (
        (content IS NOT NULL AND LEN(content) > 0) OR 
        (image_url IS NOT NULL AND LEN(image_url) > 0)
    )
);
END

-- Thêm dữ liệu mẫu cho Posts nếu chưa có
IF NOT EXISTS (SELECT * FROM Posts)
BEGIN
    INSERT INTO Posts (username, content, created_at)
    VALUES ('admin', 'Welcome to our coffee community! Share your favorite coffee recipes and experiences here.', GETDATE());
END

select * from Users
select * from Posts