package service;

import model.AIResponse;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Properties;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

public class GeminiService {
    private static final String MODEL_NAME = "gemini-2.0-flash";
    private static final String API_URL = "https://generativelanguage.googleapis.com/v1beta/models/";
    private final String apiKey;
    private final HttpClient httpClient;
    private final Gson gson;
    
    public GeminiService() {
        this.apiKey = loadApiKey();
        this.httpClient = HttpClient.newHttpClient();
        this.gson = new Gson();
    }
    
    // Đọc API key từ file config.properties
    private String loadApiKey() {
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                throw new RuntimeException("Không tìm thấy file config.properties");
            }
            Properties prop = new Properties();
            prop.load(input);
            String apiKey = prop.getProperty("gemini.api.key");
            if (apiKey == null || apiKey.trim().isEmpty()) {
                throw new RuntimeException("Vui lòng cấu hình API key trong file config.properties");
            }
            return apiKey;
        } catch (IOException e) {
            throw new RuntimeException("Lỗi khi đọc API key: " + e.getMessage());
        }
    }
    
    // Gửi câu hỏi đến Gemini API và nhận câu trả lời
    public AIResponse generateResponse(String prompt) {
    try {
        // Tạo request body đơn giản
        JsonObject requestBody = new JsonObject();
        JsonArray contents = new JsonArray();
        JsonObject content = new JsonObject();

        JsonArray parts = new JsonArray();
        JsonObject part = new JsonObject();
        part.addProperty("text", prompt);
        parts.add(part);

        content.add("parts", parts);
        contents.add(content);
        requestBody.add("contents", contents);

        // Thêm các tham số cấu hình
        JsonObject generationConfig = new JsonObject();
        generationConfig.addProperty("temperature", 0.3);
        generationConfig.addProperty("maxOutputTokens", 256);
        requestBody.add("generationConfig", generationConfig);

        // Tạo URL
        String url = API_URL + MODEL_NAME + ":generateContent?key=" + apiKey;

        // Gửi request
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Content-Type", "application/json")
                .POST(HttpRequest.BodyPublishers.ofString(gson.toJson(requestBody)))
                .build();

        HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

        // In log để debug
        System.out.println("Raw response body: " + response.body());

        if (response.statusCode() == 200) {
            JsonElement element = gson.fromJson(response.body(), JsonElement.class);

            if (element.isJsonObject()) {
                JsonObject jsonResponse = element.getAsJsonObject();

                JsonArray candidates = jsonResponse.getAsJsonArray("candidates");
                if (candidates != null && !candidates.isEmpty()) {
                    JsonObject candidate = candidates.get(0).getAsJsonObject();
                    JsonObject contentObj = candidate.getAsJsonObject("content");
                    JsonArray partsArray = contentObj.getAsJsonArray("parts");
                    if (partsArray != null && !partsArray.isEmpty()) {
                        String responseText = partsArray.get(0).getAsJsonObject().get("text").getAsString();
                        return new AIResponse(prompt, responseText);
                    }
                }
                return new AIResponse(prompt, null, "Không nhận được câu trả lời hợp lệ từ AI.");
            } else {
                return new AIResponse(prompt, null, "Phản hồi từ AI không phải dạng JSON object: " + element.toString());
            }
        } else {
            return new AIResponse(prompt, null, "Lỗi HTTP " + response.statusCode() + ": " + response.body());
        }

    } catch (IOException | InterruptedException e) {
        return new AIResponse(prompt, null, "Lỗi: " + e.getMessage());
    }
}

} 