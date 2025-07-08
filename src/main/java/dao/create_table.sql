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

select * from Users
select * from Posts


IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Recipes')
BEGIN
    CREATE TABLE Recipes (
        recipe_id INT IDENTITY(1,1) PRIMARY KEY,
        title NVARCHAR(255) NOT NULL,
        description NVARCHAR(MAX), -- phần mô tả cơ bản
        instructions NVARCHAR(MAX), -- phần hướng dẫn chi tiết (chỉ Premium mới được xem)
        ingredients NVARCHAR(MAX), -- nguyên liệu
        image_path VARCHAR(255),
        created_by VARCHAR(50) FOREIGN KEY REFERENCES Users(username),
        created_at DATETIME DEFAULT GETDATE()
    );
END

IF COL_LENGTH('Posts', 'recipe_id') IS NULL
BEGIN
    ALTER TABLE Posts ADD recipe_id INT FOREIGN KEY REFERENCES Recipes(recipe_id);
END

-- Improved Database Schema for DrinkCraft
USE ProjectPrjDB;
GO

-- Drop existing Comments table if it exists (to recreate with better structure)
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Comments')
BEGIN
    DROP TABLE Comments;
END
GO

-- Create improved Comments table that can handle both recipe and post comments
CREATE TABLE Comments (
    comment_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) FOREIGN KEY REFERENCES Users(username),
    comment_text NVARCHAR(MAX) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    
    -- Support both recipe and post comments
    recipe_id INT FOREIGN KEY REFERENCES Recipes(recipe_id) NULL,
    post_id INT FOREIGN KEY REFERENCES Posts(post_id) NULL,
    
    -- For nested comments (replies)
    parent_comment_id INT FOREIGN KEY REFERENCES Comments(comment_id) NULL,
    
    -- Soft delete support
    is_deleted BIT DEFAULT 0,
    
    -- Ensure at least one reference exists
    CONSTRAINT check_comment_reference CHECK (
        (recipe_id IS NOT NULL AND post_id IS NULL) OR 
        (recipe_id IS NULL AND post_id IS NOT NULL)
    )
);
GO

-- Create Likes table for tracking likes on recipes and posts
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Likes')
BEGIN
    CREATE TABLE Likes (
        like_id INT IDENTITY(1,1) PRIMARY KEY,
        username VARCHAR(50) FOREIGN KEY REFERENCES Users(username),
        created_at DATETIME DEFAULT GETDATE(),
        
        -- Support both recipe and post likes
        recipe_id INT FOREIGN KEY REFERENCES Recipes(recipe_id) NULL,
        post_id INT FOREIGN KEY REFERENCES Posts(post_id) NULL,
        
        -- Ensure at least one reference exists
        CONSTRAINT check_like_reference CHECK (
            (recipe_id IS NOT NULL AND post_id IS NULL) OR 
            (recipe_id IS NULL AND post_id IS NOT NULL)
        ),
        
        -- Unique constraint to prevent duplicate likes
        CONSTRAINT unique_user_recipe_like UNIQUE (username, recipe_id),
        CONSTRAINT unique_user_post_like UNIQUE (username, post_id)
    );
END
GO

-- Create indexes for better performance
CREATE INDEX idx_comments_recipe_id ON Comments(recipe_id);
CREATE INDEX idx_comments_post_id ON Comments(post_id);
CREATE INDEX idx_comments_parent_id ON Comments(parent_comment_id);
CREATE INDEX idx_likes_recipe_id ON Likes(recipe_id);
CREATE INDEX idx_likes_post_id ON Likes(post_id);
GO
select * from Recipes


CREATE PROCEDURE GetRecipeComments
    @recipe_id INT
AS
BEGIN
    SELECT 
        c.comment_id,
        c.username,
        c.comment_text,
        c.created_at,
        c.parent_comment_id,
        u.account_type
    FROM Comments c
    JOIN Users u ON c.username = u.username
    WHERE c.recipe_id = @recipe_id 
    AND c.is_deleted = 0
    ORDER BY c.created_at ASC;
END
GO

-- Get like count for a recipe
CREATE PROCEDURE GetRecipeLikeCount
    @recipe_id INT
AS
BEGIN
    SELECT COUNT(*) as like_count
    FROM Likes
    WHERE recipe_id = @recipe_id;
END
GO

-- Check if user liked a recipe
CREATE PROCEDURE CheckUserLikedRecipe
    @username VARCHAR(50),
    @recipe_id INT
AS
BEGIN
    SELECT COUNT(*) as is_liked
    FROM Likes
    WHERE username = @username AND recipe_id = @recipe_id;
END
GO

-- Toggle like (add or remove)
CREATE PROCEDURE ToggleRecipeLike
    @username VARCHAR(50),
    @recipe_id INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Likes WHERE username = @username AND recipe_id = @recipe_id)
    BEGIN
        DELETE FROM Likes WHERE username = @username AND recipe_id = @recipe_id;
        SELECT 'unliked' as action;
    END
    ELSE
    BEGIN
        INSERT INTO Likes (username, recipe_id) VALUES (@username, @recipe_id);
        SELECT 'liked' as action;
    END
END
GO

-- Add comment to recipe
CREATE PROCEDURE AddRecipeComment
    @username VARCHAR(50),
    @recipe_id INT,
    @comment_text NVARCHAR(MAX),
    @parent_comment_id INT = NULL
AS
BEGIN
    INSERT INTO Comments (username, recipe_id, comment_text, parent_comment_id)
    VALUES (@username, @recipe_id, @comment_text, @parent_comment_id);
    
    SELECT SCOPE_IDENTITY() as comment_id;
END
GO

-- Get recipe feed with stats
CREATE PROCEDURE GetRecipeFeedWithStats
AS
BEGIN
    SELECT 
        r.recipe_id,
        r.title,
        r.description,
        r.instructions,
        r.ingredients,
        r.image_path,
        r.created_by,
        r.created_at,
        u.account_type,
        COALESCE(l.like_count, 0) as like_count,
        COALESCE(c.comment_count, 0) as comment_count
    FROM Recipes r
    JOIN Users u ON r.created_by = u.username
    LEFT JOIN (
        SELECT recipe_id, COUNT(*) as like_count
        FROM Likes 
        WHERE recipe_id IS NOT NULL
        GROUP BY recipe_id
    ) l ON r.recipe_id = l.recipe_id
    LEFT JOIN (
        SELECT recipe_id, COUNT(*) as comment_count
        FROM Comments 
        WHERE recipe_id IS NOT NULL AND is_deleted = 0
        GROUP BY recipe_id
    ) c ON r.recipe_id = c.recipe_id
    ORDER BY r.created_at DESC;
END
GO

-- Test the procedures
EXEC GetRecipeFeedWithStats;
EXEC GetRecipeComments 1;
EXEC GetRecipeLikeCount 1;