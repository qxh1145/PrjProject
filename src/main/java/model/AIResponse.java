package model;

public class AIResponse {
    private String prompt;
    private String response;
    private String error;
    
    public AIResponse() {
    }
    
    public AIResponse(String prompt, String response) {
        this.prompt = prompt;
        this.response = response;
    }
    
    public AIResponse(String prompt, String response, String error) {
        this.prompt = prompt;
        this.response = response;
        this.error = error;
    }
    
    // Getters and Setters
    public String getPrompt() {
        return prompt;
    }
    
    public void setPrompt(String prompt) {
        this.prompt = prompt;
    }
    
    public String getResponse() {
        return response;
    }
    
    public void setResponse(String response) {
        this.response = response;
    }
    
    public String getError() {
        return error;
    }
    
    public void setError(String error) {
        this.error = error;
    }
} 