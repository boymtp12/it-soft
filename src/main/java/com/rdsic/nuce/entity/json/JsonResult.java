package com.rdsic.nuce.entity.json;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import javax.persistence.Entity;
import java.io.Serializable;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class JsonResult implements Serializable {
    private static final long serialVersionUID = 1L;
    private boolean success;

    private Object data;
    private String message;

    public static JsonResult build(Object data, String message) {
        return new JsonResult(true, data, message);
    }

    public static ResponseEntity<JsonResult> success(Object data) {
        return ResponseEntity.ok(new JsonResult(true, data, "OK"));
    }

    public static ResponseEntity<JsonResult> uploaded(Object data) {
        return ResponseEntity.ok(new JsonResult(true, data, "uploaded"));
    }

    public static ResponseEntity<JsonResult> updated(Object data) {
        return ResponseEntity.ok(new JsonResult(true, data, "updated"));
    }

    public static ResponseEntity<JsonResult> deleted() {
        return ResponseEntity.ok(new JsonResult(true, null, "deleted"));
    }

    public static ResponseEntity<JsonResult> badRequest(String mess) {
        return ResponseEntity.badRequest().body(new JsonResult(false, null, mess));
    }

    public static ResponseEntity<JsonResult> error(Exception ex) {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(new JsonResult(false, null, ex.toString()));
    }
}
