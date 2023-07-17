package lk.epic.spring.controller;

import lk.epic.spring.model.User;
import lk.epic.spring.repo.UserRepo;

import lk.epic.spring.util.ResponseUtil;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/user")
@EnableTransactionManagement
@Transactional
public class UserController {

    @Autowired
    private UserRepo repo;
    @Autowired
    private ModelMapper mapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping()
    public String get(){
        return "userForm";
    }

    @PostMapping
    @ResponseBody
    public ResponseUtil addUser( User model){
        String encode = passwordEncoder.encode(model.getPassword());
        model.setPassword(encode);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd  HH:mm");
        LocalDateTime currentDateAndTime = LocalDateTime.now();
        String formattedDateAndTime = currentDateAndTime.format(formatter);
        model.setCreateDate(formattedDateAndTime);
        model.setUpdateDate("");
        repo.save(mapper.map(model, User.class));



        return new ResponseUtil("200",model.getId()+ " Added.!",null);
    }

    @GetMapping(path = "/data")
    public @ResponseBody List<User> getAllUser(){

    List<User> all = repo.findAll();
    return all;
    }

    @DeleteMapping(params = "id")
    @ResponseBody
    public ResponseUtil deleteUser(String id){
        repo.deleteById(id);

        return new ResponseUtil("200",id+ " Deleted.!",false);

    }


    @PutMapping
    @ResponseBody
    public ResponseUtil updateUser(@RequestBody User model){
        String encode = passwordEncoder.encode(model.getPassword());
        model.setPassword(encode);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd  HH:mm");
        Optional<User> byId = repo.findById(model.getId());
        if (!repo.existsById(model.getId())){
            throw new RuntimeException("Customer "+model.getId()+" Not Available to Update..!");
        }
        model.setCreateDate(byId.get().getCreateDate());
        LocalDateTime currentDateAndTime = LocalDateTime.now();
        String formattedDateAndTime = currentDateAndTime.format(formatter);
        model.setUpdateDate(formattedDateAndTime);
        repo.save( mapper.map(model, User.class));
        return new ResponseUtil("200",model.getId()+": Updated.!",null);

    }
    @GetMapping (params = "id")
    @ResponseBody
    public ResponseUtil existUSer(String id){
        boolean b = repo.existsById(id);
        if (b){
            return new ResponseUtil("200",id+ " UserExist.!",true);
        }else {
            return new ResponseUtil("200",id+ " UserExist.!",false);
        }

    }

    @GetMapping(path = "uSet")
    @ResponseBody
    public ResponseUtil geUser(String id){

        Optional<User> byId = repo.findById(id);
        User user = mapper.map(byId, User.class);

        if (!repo.existsById(id)){
            throw new RuntimeException("User "+id+" Not Exist!");
        }

        return new ResponseUtil("200"," Success.!",user);
    }





//    @GetMapping(path = "login")
//    public ResponseUtil checkLogUser(String id,String password) {
//
//        boolean userUsingIdAndPassword = service.findUserUsingIdAndPassword(id, password);
//        return new ResponseUtil("200", "Login Success", userUsingIdAndPassword);
//
//
//
//    }


}
