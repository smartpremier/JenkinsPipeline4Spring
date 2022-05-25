package kr.trycatch.jenkinspipeline4spring;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class ConfigProperties {

    @Value("${server.port}")
    private int serverPort;

    @PostConstruct
    void checking() {
        System.out.println("server.port=" + serverPort);
    }
}
