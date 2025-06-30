-- Script để cập nhật bảng payments
USE ProjectPrjDB;
GO

-- Kiểm tra xem bảng payments có tồn tại không
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'payments')
BEGIN
    PRINT 'Creating payments table...';
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
    
    PRINT 'Payments table created successfully!';
END
ELSE
BEGIN
    PRINT 'Payments table already exists. Checking for new columns...';
    
    -- Thêm các cột mới nếu chưa có
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('payments') AND name = 'account_number')
    BEGIN
        PRINT 'Adding account_number column...';
        ALTER TABLE payments ADD account_number VARCHAR(50);
    END
    
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('payments') AND name = 'account_name')
    BEGIN
        PRINT 'Adding account_name column...';
        ALTER TABLE payments ADD account_name VARCHAR(100);
    END
    
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('payments') AND name = 'payment_method')
    BEGIN
        PRINT 'Adding payment_method column...';
        ALTER TABLE payments ADD payment_method VARCHAR(20) DEFAULT 'QR_CODE';
    END
    
    PRINT 'All columns are up to date!';
END

-- Kiểm tra cấu trúc bảng
PRINT 'Current payments table structure:';
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'payments'
ORDER BY ORDINAL_POSITION;

-- Kiểm tra dữ liệu hiện có
PRINT 'Current payments data:';
SELECT TOP 5 * FROM payments ORDER BY created_at DESC; 