package org.ssssssss.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
//import springfox.documentation.swagger2.annotations.EnableSwagger2;


@RestController
@SpringBootApplication
//@EnableSwagger2	// 配置swagger 文档
public class MagicAPIExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(MagicAPIExampleApplication.class, args);
	}
	
	@PostMapping("/stream")
	public Object stream(@RequestBody byte[] body) {
	    System.out.println("body --> " + (body != null ? body.length : 0));
	    return body;
	}
}

