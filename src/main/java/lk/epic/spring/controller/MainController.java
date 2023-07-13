package lk.epic.spring.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Component
@RequestMapping("/")
public class MainController {
    @GetMapping()
    public String get(){
        return "index";
    }
}
