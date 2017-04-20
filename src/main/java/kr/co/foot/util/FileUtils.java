package kr.co.foot.util;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
    
// private static final String filePath = "C:/Users/User/workspace/baljagook/src/main/webapp/resources/photo/";
// private static final String filePath = "/Users/mac/Documents/workspace/baljagook/src/main/webapp/resources/photo/";
   private static final String filePath = "/var/lib/tomcat8/webapps/baljagook/resources/photo/";
   public Map<String, String> saveFile(HttpServletRequest request) throws IllegalStateException, IOException{
      
      String oriFileName = null;
       String oriFileExtension = null;
       String newFileName = null;
       
       File file = new File(filePath);
       if(file.exists() == false){
            file.mkdirs();
        }
       
       MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
       MultipartFile multipartFile = null;
       
       Iterator<String> iter = multipartHttpServletRequest.getFileNames();
      
       while(iter.hasNext()){
          
          multipartFile = multipartHttpServletRequest.getFile(iter.next());
          
          if(multipartFile.isEmpty() == false){
             oriFileName = multipartFile.getOriginalFilename();
               oriFileExtension = oriFileName.substring(oriFileName.lastIndexOf("."));
               newFileName = CommonUtils.getRandomString()+oriFileExtension;
               
               file = new File(filePath+newFileName);
               multipartFile.transferTo(file);
          }
          
       }
       
       Enumeration<String> iterData = multipartHttpServletRequest.getParameterNames();
       
       while (iterData.hasMoreElements()) {
          String key = (String) iterData.nextElement();
          String value = multipartHttpServletRequest.getParameter(key);
          request.setAttribute(key, value);
       }
       
       String lat = (String)request.getAttribute("latitude");
        String lon = (String)request.getAttribute("longitude");
        String accuracy = (String)request.getAttribute("accuracy");
        String timestamp = (String)request.getAttribute("timestamp");
        String title = (String)request.getAttribute("title");
        String content = (String)request.getAttribute("content");
        title = URLDecoder.decode(title, "UTF-8");
        content = URLDecoder.decode(content, "UTF-8");

      Map<String, String> map = new HashMap<String, String>();
      map.put("oriFileName", oriFileName);
      map.put("oriFileExtension", oriFileExtension);
      map.put("newFileName", newFileName);
      map.put("lat", lat);
      map.put("lon", lon);
      map.put("accuracy", accuracy);
      map.put("timestamp", timestamp);
      map.put("title", title);
      map.put("content", content);
       
      return map;
   }
}
