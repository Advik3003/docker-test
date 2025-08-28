package com.docker.test.repository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping()
public class DemoRepository {

    @GetMapping("/test")
    public String demo() {
        return "demo cache test";
    }
}
