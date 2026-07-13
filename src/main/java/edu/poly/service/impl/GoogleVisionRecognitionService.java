package edu.poly.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import edu.poly.service.ImageRecognitionService;

@Service
public class GoogleVisionRecognitionService implements ImageRecognitionService {

    @Value("${google.vision.api.key}")
    private String apiKey;

    @Override
    @SuppressWarnings("unchecked")
    public List<String> recognize(MultipartFile file) throws Exception {
        String base64Image = Base64.getEncoder().encodeToString(file.getBytes());
        String url = "https://vision.googleapis.com/v1/images:annotate?key=" + apiKey;

        Map<String, Object> body = Map.of(
                "requests", List.of(Map.of(
                        "image", Map.of("content", base64Image),
                        "features", List.of(Map.of(
                                "type", "LABEL_DETECTION",
                                "maxResults", 5)))));

        RestTemplate rest = new RestTemplate();
        Map<String, Object> response = rest.postForObject(url, body, Map.class);

        List<String> labels = new ArrayList<>();
        List<Map<String, Object>> responses = (List<Map<String, Object>>) response.get("responses");
        List<Map<String, Object>> annotations =
                (List<Map<String, Object>>) responses.get(0).get("labelAnnotations");

        if (annotations != null) {
            for (Map<String, Object> ann : annotations) {
                labels.add((String) ann.get("description"));
            }
        }
        return labels;
    }
}