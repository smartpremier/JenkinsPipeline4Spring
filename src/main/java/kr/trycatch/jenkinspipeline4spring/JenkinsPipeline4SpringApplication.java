package kr.trycatch.jenkinspipeline4spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan("kr.trycatch.jenkinspipeline4spring")
public class JenkinsPipeline4SpringApplication {


    public static void main(String[] args) {
        SpringApplication.run(JenkinsPipeline4SpringApplication.class, args);
    }

}
