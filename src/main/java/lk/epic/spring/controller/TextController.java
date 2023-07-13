package lk.epic.spring.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/text")
public class TextController {

    @GetMapping
    public String eee(){
        return "signUp";
    }
}
