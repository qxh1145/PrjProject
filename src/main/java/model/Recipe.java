package model;

import java.util.Date;

public class Recipe {

private int recipeId;        // recipe_id (Primary Key)
    private String title;        // title
    private String description;  // description
    private String instructions; // instructions (Premium content)
    private String ingredients;  // ingredients
    private String imagePath;    // image_path
    private String createdBy;    // created_by
    private Date createdAt;      // created_at

    public Recipe(int recipeId, String title, String description, String instructions, String ingredients, String imagePath, String createdBy, Date createdAt) {
        this.recipeId = recipeId;
        this.title = title;
        this.description = description;
        this.instructions = instructions;
        this.ingredients = ingredients;
        this.imagePath = imagePath;
        this.createdBy = createdBy;
        this.createdAt = createdAt;
    }

    public Recipe() {
    }
    

    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getInstructions() {
        return instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
      
}
