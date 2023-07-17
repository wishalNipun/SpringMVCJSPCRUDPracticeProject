package lk.epic.spring.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {

    @RequestMapping(value = "/")
    @GetMapping
    public String get(){
        return "index";
    }

    @RequestMapping(value = "signIn")
    @GetMapping
    public String signIn(){
        return "userForm";
    }

    @RequestMapping(value = "signUp")
    @GetMapping
    public String signUp(){
        return "userForm";
    }

    @RequestMapping(value = "logout")
    @GetMapping
    public String logOut(){
        return "index";
    }
}
