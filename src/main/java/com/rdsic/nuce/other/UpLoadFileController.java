package com.rdsic.nuce.other;

import com.rdsic.nuce.entity.json.JsonResult;
import com.rdsic.nuce.entity.other.FolderImage;
import com.rdsic.nuce.entity.other.Image;
import com.rdsic.nuce.service.FolderImageService;
import com.rdsic.nuce.service.ImageService;
import io.swagger.v3.core.util.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping("api/v1/public/upload")
public class UpLoadFileController {
    private final static Logger LOGGER = Logger.getLogger(UpLoadFileController.class.getName());

    //    tự động lấy đường dẫn của tomcat
    private final String UPLOAD_DIRECTORY = System.getProperty("catalina.base") + "/webapps/uploadfileimage/spec";
//    private final String UPLOAD_DIRECTORY = "E:\\RDSIC\\1.Spec WebApps\\BackEnd_Admin_Rdsic_Course\\test";

    // url này chính là url của cái folder ngang cấp với file war trong apache trên là cho web dưới là localhost
    private static final String URL_UPLOAD_FILE = "https://spec.edu.vn/uploadfileimage/spec/";
//    private static final String URL_UPLOAD_FILE = "E:\\RDSIC\\1.Spec WebApps\\BackEnd_Admin_Rdsic_Course\\test\\";


//    private static final String UPLOAD_DIRECTORY = "C:\\dev";

    // khai báo biến toàn cục
    private String fileName;

    @Autowired
    private ImageService imageService;
    @Autowired
    private FolderImageService folderImageService;

    @PostMapping(value = "/upload-image/{nameFolder}")
    public ResponseEntity<JsonResult> uploadFile(@RequestParam("file") MultipartFile file,
                                                 @PathVariable("nameFolder") String nameFolder) {
        System.out.println("hahahahahaah");
        File file1 = new File(UPLOAD_DIRECTORY, nameFolder);
        if (file1.mkdir()) {
            System.out.println("Create success");
        }
        if (multiPartFile(file, nameFolder)) {
            System.out.println(file);
//            sau khi up load 1 file lên thì sẽ trả về tên file +với url gốc mình đã có
//            mình chỉ cần lấy url rs đã đc trả về để lưu vào db thôi
            String rs = URL_UPLOAD_FILE + nameFolder + "/" + fileName;
            Image image = new Image();
            image.setName(fileName);
            image.setSrc(rs);
            image.setStatus(true);
            image.setFolderImage(folderImageService.findByValueAndDeletedTrue(nameFolder));
            imageService.save(image);
// trả về url tải lên
            System.out.println(rs);
            return JsonResult.success(rs);
        }
        return JsonResult.badRequest("Thât bại");
    }

    private boolean multiPartFile(@RequestParam("file") MultipartFile file, String nameFolder) {
        System.out.println("jdjdjdjdjdjdd");
        if (file.isEmpty()) {
            return false;
        }
        try {
            // lấy ra tên file
            // đề phòng 2 người cùng sử dụng gửi lên cùng 1 tên file sẽ công thêm ngày giờ
            // vào tên file để phân biệt
            fileName = LocalDateTime.now().getNano() + file.getOriginalFilename();
            fileName = fileName.replace(" ","xs");
            System.out.println(file);
            // khởi tạo url file với url của folder với tên file
            File uploadedFile = new File(UPLOAD_DIRECTORY + "\\" + nameFolder, fileName);
//            System.out.println(uploadedFile.getParentFile());
//            System.out.println(uploadedFile.getName());
//            System.out.println(uploadedFile.getPath());

            OutputStream stream;
            // tiến hành tạo file
            uploadedFile.createNewFile();
            // ghi file
            stream = new BufferedOutputStream(new FileOutputStream(uploadedFile));
            stream.write(file.getBytes());
            stream.flush();
            stream.close();
            return true;

        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "upload-file-error : {0}", e.getMessage());
            return false;
        }
    }

    @GetMapping("/deleted/{namefolder}/{nameFile}/{idImage}")
    public ResponseEntity<JsonResult> deleteFile(@PathVariable("namefolder") String nameFolder,
                                                 @PathVariable("nameFile") String fileName,
                                                 @PathVariable("idImage") int idImage) {
        System.out.println("aaaaaaaaaaaaa");
        Image image = imageService.findById(idImage);
        image.setStatus(false);
        imageService.save(image);

        File file = new File(UPLOAD_DIRECTORY +"/"+nameFolder, fileName);
        if (file.delete()) {
            return JsonResult.success("okk");
        } else {
            return JsonResult.badRequest("errr");
        }
    }

//    //method for uploading multiple files
//    @PostMapping(value = "/upload-multi-image", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public ResponseEntity<List<String>> uploadMultiFile(@RequestParam("files") MultipartFile[] files) {
//        List<String> nameImageNews = new ArrayList<>();
//        for (MultipartFile multipartFile : files) {
//            multiPartFile(multipartFile);
//            if (Objects.requireNonNull(multipartFile.getOriginalFilename()).isEmpty()) {
//                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//            }
//            String rs = URL_UPLOAD_FILE + multipartFile.getOriginalFilename();
//            System.out.println(rs);
//            nameImageNews.add(rs);
//        }
//        return new ResponseEntity<>(nameImageNews, HttpStatus.OK);
//    }

}
