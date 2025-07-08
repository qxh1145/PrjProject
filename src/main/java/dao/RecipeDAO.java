package dao;

import java.sql.*;
import java.util.*;
import javax.naming.NamingException;
import model.Recipe;

public class RecipeDAO {
    public List<Recipe> getAllRecipes() {
        List<Recipe> list = new ArrayList<>();
                String sql = "SELECT recipe_id, title, description, ingredients, instructions, image_path, created_by, created_at FROM Recipes";

        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Recipe r = new Recipe();
                  r.setRecipeId(rs.getInt("recipe_id"));
                r.setTitle(rs.getString("title"));
                r.setDescription(rs.getString("description"));
                r.setIngredients(rs.getString("ingredients"));
                r.setInstructions(rs.getString("instructions"));
                r.setImagePath(rs.getString("image_path"));
                r.setCreatedBy(rs.getString("created_by"));
                r.setCreatedAt(rs.getTimestamp("created_at")); // Convert to Date
                
                list.add(r);
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("General error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    
    public boolean testConnection() {
        try (Connection conn = DBContext.getConnection()) {
            return conn != null && !conn.isClosed();
        } catch (Exception e) {
            System.err.println("Connection test failed: " + e.getMessage());
            return false;
        }
    }
    
    public Recipe getRecipeById(int id) throws SQLException, NamingException {
        Recipe recipe = null;
        String sql = "SELECT recipe_id, title, description, ingredients, instructions, image_path, created_by, created_at FROM Recipes WHERE recipe_id = ?";
        
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                recipe = new Recipe();
                recipe.setRecipeId(rs.getInt("recipe_id"));
                recipe.setTitle(rs.getString("title"));
                recipe.setDescription(rs.getString("description"));
                recipe.setIngredients(rs.getString("ingredients"));
                recipe.setInstructions(rs.getString("instructions"));
                recipe.setImagePath(rs.getString("image_path"));
                recipe.setCreatedBy(rs.getString("created_by"));
                recipe.setCreatedAt(rs.getTimestamp("created_at"));
            }
        } catch (SQLException e) {
            System.err.println("Database error: " + e.getMessage());
            e.printStackTrace();
        }
        return recipe;
    }
    
    
    public static void main(String[] args) {
            
RecipeDAO dao = new RecipeDAO();
        
        // Test connection first
        if (!dao.testConnection()) {
            System.out.println("❌ Không thể kết nối đến database!");
            System.out.println("Kiểm tra:");
            System.out.println("1. Database server đã chạy chưa?");
            System.out.println("2. Connection string có đúng không?");
            System.out.println("3. Username/password có đúng không?");
            System.out.println("4. Database và table đã tồn tại chưa?");
            return;
        }
        
        System.out.println("✅ Kết nối database thành công!");
        
        List<Recipe> recipes = dao.getAllRecipes();
        
        if (recipes.isEmpty()) {
            System.out.println("⚠️  Không có công thức nào trong CSDL.");
            System.out.println("Hãy thêm dữ liệu vào bảng Recipes.");
        } else {
            System.out.println("📋 Danh sách công thức (" + recipes.size() + " món):");
            System.out.println("==========================================");
            
            for (Recipe r : recipes) {
                System.out.println("🆔 ID: " + r.getRecipeId());
                System.out.println("📝 Tiêu đề: " + r.getTitle());
                System.out.println("📄 Mô tả: " + r.getDescription());
                System.out.println("🥘 Nguyên liệu: " + r.getIngredients());
                System.out.println("📋 Hướng dẫn: " + r.getInstructions());
                System.out.println("🖼️  Hình ảnh: " + r.getImagePath());
                System.out.println("👤 Tạo bởi: " + r.getCreatedBy());
                System.out.println("📅 Ngày tạo: " + r.getCreatedAt());
                System.out.println("==========================================");
            }
        }
    }
}
