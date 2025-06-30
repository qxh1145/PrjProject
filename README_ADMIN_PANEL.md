# Admin Panel - Update Client Account

## Tổng quan
Hệ thống quản lý tài khoản người dùng cho admin, cho phép nâng cấp/hạ cấp tài khoản và ghi log các thao tác.

## Tính năng chính

### 1. Thay đổi Navigation Menu
- **Admin**: Thấy tab "Update Client Account" thay vì "Buy Premium"
- **User thường**: Vẫn thấy tab "Buy Premium"

### 2. Trang Quản lý Tài khoản (`/admin/updateClientAccount.jsp`)
- **Bảng danh sách users** với thông tin:
  - Username
  - Email
  - Account Type (Free/Premium)
  - Registration Date
  - Last Login
  - Actions (Upgrade/Downgrade)

### 3. Chức năng Nâng cấp/Hạ cấp
- **Nút Upgrade**: Chuyển từ Free → Premium
- **Nút Downgrade**: Chuyển từ Premium → Free
- **Xác nhận**: Hiện confirm dialog trước khi thực hiện

### 4. Ghi Log
- **Format log**: `[YYYY-MM-DD HH:mm:ss] ADMIN: {admin_username} {ACTION} account type for user: {target_username} to: {new_account_type}`
- **Vị trí**: Console log của server
- **Ví dụ**: `[2024-01-15 14:30:25] ADMIN: admin UPGRADED account type for user: john_doe to: premium`

## Cấu trúc Files

### Frontend
- `src/main/webapp/component/header.jsp` - Cập nhật navigation menu
- `src/main/webapp/admin/updateClientAccount.jsp` - Trang quản lý admin

### Backend
- `src/main/java/controller/GetUsersServlet.java` - Lấy danh sách users
- `src/main/java/controller/UpdateAccountTypeServlet.java` - Cập nhật account type + ghi log
- `src/main/java/dao/UserDAO.java` - Thêm methods getAllUsers() và updateAccountType()
- `src/main/java/model/User.java` - Thêm fields email, registrationDate, lastLogin

## API Endpoints

### 1. GET `/admin/getUsers`
- **Mục đích**: Lấy danh sách tất cả users
- **Response**: JSON với danh sách users
- **Auth**: Chỉ admin mới truy cập được

### 2. POST `/admin/updateAccountType`
- **Mục đích**: Cập nhật account type của user
- **Body**: `{"username": "user123", "newAccountType": "premium"}`
- **Response**: JSON success/error
- **Auth**: Chỉ admin mới truy cập được

## Cách sử dụng

### 1. Đăng nhập Admin
- Đăng nhập với tài khoản có role = "admin"
- Sẽ thấy tab "Update Client Account" trong navigation

### 2. Truy cập Admin Panel
- Click vào "Update Client Account"
- Hệ thống sẽ load danh sách tất cả users

### 3. Nâng cấp/Hạ cấp Tài khoản
- Tìm user cần thay đổi trong bảng
- Click nút "Upgrade" hoặc "Downgrade"
- Xác nhận trong dialog
- Hệ thống sẽ cập nhật và ghi log

### 4. Xem Log
- Log được in ra console của server
- Format: `[Timestamp] ADMIN: {admin} {ACTION} account type for user: {user} to: {type}`

## Bảo mật

### 1. Phân quyền
- Chỉ user có role = "admin" mới truy cập được
- Session validation ở mọi endpoint

### 2. Validation
- Kiểm tra input parameters
- Xác nhận trước khi thực hiện thay đổi

### 3. Logging
- Ghi log mọi thao tác thay đổi account type
- Bao gồm timestamp, admin, action, target user

## Database Requirements

### Bảng Users cần có:
- `username` (VARCHAR)
- `password` (VARCHAR) 
- `account_type` (VARCHAR) - "free" hoặc "premium"
- `email` (VARCHAR) - optional
- `registration_date` (VARCHAR/DATETIME) - optional
- `last_login` (VARCHAR/DATETIME) - optional

## Troubleshooting

### 1. Không thấy tab "Update Client Account"
- Kiểm tra user có role = "admin" không
- Kiểm tra session có lưu đúng role không

### 2. Không load được danh sách users
- Kiểm tra database connection
- Kiểm tra bảng Users có dữ liệu không
- Xem log server để debug

### 3. Không cập nhật được account type
- Kiểm tra username có tồn tại trong database không
- Kiểm tra quyền write vào database
- Xem log server để debug

### 4. Không thấy log
- Kiểm tra console của server (Tomcat/Glassfish)
- Đảm bảo System.out.println hoạt động 