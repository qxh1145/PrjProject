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
        password VARCHAR(50) NOT NULL
    );
END

select * from Users