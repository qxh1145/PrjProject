package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.BufferedReader;
import model.AIResponse;
import service.GeminiService;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AIController", urlPatterns = {"/ai/*"})
public class AIController extends HttpServlet {
    private final GeminiService geminiService;
    private final Gson gson;
    private static final Logger LOGGER = Logger.getLogger(AIController.class.getName());
    
    public AIController() {
        this.geminiService = new GeminiService();
        this.gson = new Gson();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Read JSON from request body
            BufferedReader reader = request.getReader();
            StringBuilder jsonBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
            
            String jsonString = jsonBuilder.toString();
            LOGGER.info("Received JSON: " + jsonString);
            
            // Parse JSON string using JsonParser
            JsonElement jsonElement = JsonParser.parseString(jsonString);
            if (!jsonElement.isJsonObject()) {
                Map<String, String> errorMap = new HashMap<>();
                errorMap.put("error", "Invalid JSON format: expected an object");
                response.getWriter().write(gson.toJson(errorMap));
                return;
            }
            
            // Get prompt from request
            String prompt = null;
            try {
                prompt = jsonElement.getAsJsonObject().get("prompt").getAsString();
            } catch (Exception e) {
                Map<String, String> errorMap = new HashMap<>();
                errorMap.put("error", "Missing or invalid prompt field");
                response.getWriter().write(gson.toJson(errorMap));
                return;
            }
            
            if (prompt == null || prompt.trim().isEmpty()) {
                Map<String, String> errorMap = new HashMap<>();
                errorMap.put("error", "Prompt is required");
                response.getWriter().write(gson.toJson(errorMap));
                return;
            }
            
            // Generate response
            AIResponse aiResponse = geminiService.generateResponse(prompt);
            
            // Create response map
            Map<String, String> responseMap = new HashMap<>();
            if (aiResponse.getError() != null) {
                responseMap.put("error", aiResponse.getError());
            } else {
                responseMap.put("response", aiResponse.getResponse());
            }
            
            // Send response
            String jsonResponse = gson.toJson(responseMap);
            LOGGER.info("Sending response: " + jsonResponse);
            response.getWriter().write(jsonResponse);
            
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error processing request", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            Map<String, String> errorMap = new HashMap<>();
            errorMap.put("error", "Error: " + e.getMessage());
            response.getWriter().write(gson.toJson(errorMap));
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path != null && path.equals("/chatbot")) {
            request.getRequestDispatcher("/view/chatbot.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/ai/chatbot");
        }
    }
} 