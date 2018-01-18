package com.animo.utils;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by 7025 on 2018/1/15.
 */
public class HttpSendUtils {

    public static String sendPost(String url, String params) {
        try {
            URL realUrl = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
            conn.setDoInput(true);
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");
            PrintWriter printWriter = new PrintWriter(conn.getOutputStream());
            printWriter.write(params);
            printWriter.flush();
            InputStream inputStream = conn.getInputStream();
            byte[] bytes = new byte[1024];
            int len = -1;
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            while ((len = inputStream.read(bytes)) > 0) {
                baos.write(bytes, 0, len);
            }
            return baos.toString("utf-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
