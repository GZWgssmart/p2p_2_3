package com.animo.utils;


import org.springframework.web.context.ContextLoader;

import java.io.File;

/**
 * Created by Animo on 2017-12-01.
 */
public class PathUtils {

    public static String mkUploads() {
        String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
        File file = new File(path, "static/uploads");
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.getAbsolutePath();
    }

    public static String mkUploads1() {
        String path = ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/");
        File file = new File(path, "/static/uploads");
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.getAbsolutePath();
    }

}
