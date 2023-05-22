package vn.com.ibss.au;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync
public class AuServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuServiceApplication.class, args);
    }

}
