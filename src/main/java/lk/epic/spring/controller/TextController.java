package lk.epic.spring.controller;

import lk.epic.spring.model.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Component
@RequestMapping("/text")
public class TextController {

    @GetMapping
    public String eee(){
        return "signUp";
    }

    @GetMapping("/test")
    public User getAllUser() {
        User user = new User();
        user.setId("test");
        user.setName("Test");
        user.setAddress("hello");
        user.setPassword("1243");
        return user;
    }

}
