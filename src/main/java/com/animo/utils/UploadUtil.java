package com.animo.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

public class UploadUtil {
    public static String uploadFile(MultipartFile file, String path) throws IOException {
        String name = file.getOriginalFilename();
        String fileName = name;
        File tempFile = new File(path, fileName);
        if (!tempFile.getParentFile().exists()){
            tempFile.getParentFile().mkdir();
        }
        if (tempFile.exists()){
            tempFile.delete();
        }
        tempFile.createNewFile();
        file.transferTo(tempFile);
        return tempFile.getName();
    }
}
