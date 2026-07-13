package edu.poly.service;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public interface ImageRecognitionService {
    List<String> recognize(MultipartFile file) throws Exception;
}