# Project Final

## Hướng dẫn cho đồng nghiệp mới

### 1. Clone và cài đặt
1. Clone project về máy:
   ```bash
   git clone [URL_REPOSITORY]
   cd ProjectFinal
   ```

2. Cài đặt các công cụ cần thiết:
   - JDK 17 hoặc cao hơn
   - NetBeans IDE
   - SQL Server Management Studio (SSMS)
   - Tomcat 1010.0

### 2. Cấu hình SQL Server
1. Mở SQL Server Configuration Manager
2. Enable SQL Server Authentication:
   - Click chuột phải vào SQL Server
   - Properties -> Security
   - Chọn "SQL Server and Windows Authentication mode"
   - Click OK và restart SQL Server

3. Tạo tài khoản SQL Server:
   - Mở SSMS
   - Security -> Logins
   - Click chuột phải -> New Login
   - Tạo tài khoản:
     - Login name: sa
     - Password: sa
     - Server roles: sysadmin

### 3. Cài đặt Database
1. Mở SQL Server Management Studio (SSMS)
2. Kết nối với SQL Server bằng tài khoản sa:
   - Server type: Database Engine
   - Server name: YOUR_SERVER_NAME
   - Authentication: SQL Server Authentication
   - Login: sa
   - Password: sa

3. Chạy các file SQL theo thứ tự BẮT BUỘC:
   a. Chạy file `src/main/java/dao/create_table.sql` TRƯỚC:
      - Tạo database ProjectPrjDB
      - Tạo bảng Users với cấu trúc đúng
      - KHÔNG chứa dữ liệu mẫu

   b. Chạy file `database/update_data.sql` SAU:
      - Thêm dữ liệu mẫu vào bảng Users
      - Cập nhật dữ liệu mới (nếu có)

4. Kiểm tra dữ liệu:
   - Mở SSMS
   - Kết nối với database ProjectPrjDB
   - Chuột phải vào bảng Users -> Select Top 1000 Rows
   - Kiểm tra dữ liệu mẫu đã được thêm vào

### 4. Cấu hình Project
1. Mở project trong NetBeans
2. Cập nhật thông tin kết nối trong `src/main/java/dao/DBContext.java`:
   ```java
   private static final String SERVER_NAME = "YOUR_SERVER_NAME"; // Tên máy của bạn
   private static final String USERNAME = "sa";                  // Giữ nguyên
   private static final String PASSWORD = "sa";                  // Giữ nguyên
   ```
3. Clean and Build project
4. Chạy trên Tomcat

### 5. Quy trình làm việc với Git

#### Khi bắt đầu làm việc:
1. Pull code mới nhất về:
   ```bash
   git pull origin main
   ```

2. Tạo nhánh mới cho task của bạn:
   ```bash
   git checkout -b feature/ten-task-cua-ban
   ```

#### Trong quá trình làm việc:
1. Commit thường xuyên với message rõ ràng:
   ```bash
   git add .
   git commit -m "feat: thêm chức năng đăng nhập"
   ```

2. Push code lên nhánh của bạn:
   ```bash
   git push origin feature/ten-task-cua-ban
   ```

#### Khi hoàn thành task:
1. Pull code mới nhất từ main:
   ```bash
   git checkout main
   git pull origin main
   git checkout feature/ten-task-cua-ban
   git merge main
   ```

2. Resolve conflicts nếu có

3. Push code lên nhánh của bạn:
   ```bash
   git push origin feature/ten-task-cua-ban
   ```

4. Tạo Pull Request trên GitHub:
   - Source: feature/ten-task-cua-ban
   - Target: main
   - Mô tả rõ các thay đổi
   - Tag người review

#### Khi có thay đổi dữ liệu (ví dụ: thêm tài khoản mới):
1. Export dữ liệu mới:
   - Mở SSMS
   - Chuột phải vào database ProjectPrjDB
   - Tasks -> Generate Scripts
   - Chọn bảng Users
   - Advanced -> Types of data to script -> Data only
   - Lưu file với tên `database/update_data.sql`

2. Commit file SQL:
   ```bash
   git add database/update_data.sql
   git commit -m "data: thêm tài khoản mới"
   git push origin feature/ten-task-cua-ban
   ```

3. Thông báo cho team:
   - Tag team trong commit message
   - Mô tả rõ thay đổi dữ liệu
   - Hướng dẫn cách cập nhật dữ liệu

4. Để đồng nghiệp cập nhật dữ liệu:
   - Pull code mới nhất
   - Chạy file `database/update_data.sql`
   - Kiểm tra dữ liệu đã được cập nhật

### 6. Tài khoản mẫu
1. Admin:
   - Username: admin
   - Password: admin

2. User thường:
   - Username: aido
   - Password: 123456
   - Username: chimto
   - Password: 12345678
   - Username: khoa
   - Password: 12345678
   - Username: quan
   - Password: 1

### 7. Lưu ý quan trọng
1. Luôn pull code mới nhất trước khi bắt đầu làm việc
2. Tạo nhánh mới cho mỗi task
3. Commit message phải rõ ràng và theo format:
   - feat: thêm tính năng mới
   - fix: sửa lỗi
   - docs: cập nhật tài liệu
   - style: định dạng code
   - refactor: tái cấu trúc code
4. Không commit file cấu hình cá nhân
5. Kiểm tra kỹ code trước khi tạo Pull Request
6. Cập nhật README nếu có thay đổi quan trọng

### 8. Xử lý lỗi thường gặp
1. Lỗi kết nối database:
   - Kiểm tra SQL Server đang chạy
   - Kiểm tra SQL Server Authentication đã được bật
   - Kiểm tra tài khoản sa đã được tạo
   - Kiểm tra thông tin kết nối trong DBContext.java
   - Kiểm tra tường lửa
   - Kiểm tra port 1433 đã được mở

2. Lỗi khi pull code:
   - Lưu thay đổi hiện tại: `git stash`
   - Pull code mới: `git pull origin main`
   - Áp dụng lại thay đổi: `git stash pop`

3. Lỗi khi merge:
   - Giải quyết conflict thủ công
   - Test kỹ sau khi merge
   - Commit sau khi đã giải quyết xong conflict 

4. Lỗi khi cập nhật dữ liệu:
   - Backup database trước khi chạy script
   - Kiểm tra script SQL có lỗi không
   - Kiểm tra quyền truy cập database
   - Nếu có lỗi, restore từ backup 