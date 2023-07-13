package lk.epic.spring.controller;

import lk.epic.spring.model.User;
import lk.epic.spring.repo.UserRepo;
import lk.epic.spring.util.ResponseUtil;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@Component
@RequestMapping("/user")
@EnableTransactionManagement
@Transactional
public class UserController {

    @Autowired
    HibernateTemplate template;

    @GetMapping()
    public String get(){
        return "userForm";
    }
    @PostMapping
    public String addUser(User model){
        System.out.println(model.toString());

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd  HH:mm");
        LocalDateTime currentDateAndTime = LocalDateTime.now();
        String formattedDateAndTime = currentDateAndTime.format(formatter);
        model.setCreateDate(formattedDateAndTime);
        template.saveOrUpdate(model);



       return "userForm";
    }
//    @PostMapping
//    public ResponseUtil saveUser(@RequestBody User model){
//        if (repo.existsById(model.getId())) {
//            throw new RuntimeException("Customer "+model.getId()+" Already Exist..!");
//        }
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd  HH:mm");
//        LocalDateTime currentDateAndTime = LocalDateTime.now();
//        String formattedDateAndTime = currentDateAndTime.format(formatter);
//        model.setCreateDate(formattedDateAndTime);
//        repo.save(model);
//        return new ResponseUtil("200",model.getId()+ " Added.!",null);
//    }

//    @Autowired
//    UserRepo repo;
//    @Autowired
//    private ModelMapper mapper;
//
//    @GetMapping
//    public ResponseUtil getAllUser(){
//
//        ArrayList<User> arrayList= mapper.map(repo.findAll(), new TypeToken<ArrayList<User>>() {
//        }.getType());
//        return new ResponseUtil("200"," Success.!",arrayList);
//    }
//
//    @PostMapping
//    public ResponseUtil saveUser(@RequestBody User model){
//        if (repo.existsById(model.getId())) {
//            throw new RuntimeException("Customer "+model.getId()+" Already Exist..!");
//        }
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd  HH:mm");
//        LocalDateTime currentDateAndTime = LocalDateTime.now();
//        String formattedDateAndTime = currentDateAndTime.format(formatter);
//        model.setCreateDate(formattedDateAndTime);
//        repo.save(mapper.map(model, User.class));
//        return new ResponseUtil("200",model.getId()+ " Added.!",null);
//    }
//
//
//    @DeleteMapping(params = "id")
//    public ResponseUtil deleteUser(String id){
//
//        if (!repo.existsById(id)){
//            throw new RuntimeException("Customer "+id+" Not Available to Delete..!");
//        }
//        repo.deleteById(id);
//
//        return new ResponseUtil("200",id+ " Deleted.!",null);
//
//    }
//
//    @PutMapping
//    public ResponseUtil updateUser(@RequestBody User model){
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd  HH:mm");
//        Optional<User> byId = repo.findById(model.getId());
//        if (!repo.existsById(model.getId())){
//            throw new RuntimeException("Customer "+model.getId()+" Not Available to Update..!");
//        }
//        model.setCreateDate(byId.get().getCreateDate());
//        LocalDateTime currentDateAndTime = LocalDateTime.now();
//        String formattedDateAndTime = currentDateAndTime.format(formatter);
//        model.setUpdateDate(formattedDateAndTime);
//        repo.save( mapper.map(model, User.class));
//        return new ResponseUtil("200",model.getId()+": Updated.!",null);
//
//    }
//
//    @GetMapping (params = "id")
//    public ResponseUtil existUSer(String id){
//        boolean b = repo.existsById(id);
//        if (b){
//            return new ResponseUtil("200",id+ " UserExist.!",true);
//        }else {
//            return new ResponseUtil("200",id+ " UserExist.!",false);
//        }
//
//    }

//    @GetMapping(path = "login")
//    public ResponseUtil checkLogUser(String id,String password) {
//
//        boolean userUsingIdAndPassword = service.findUserUsingIdAndPassword(id, password);
//        return new ResponseUtil("200", "Login Success", userUsingIdAndPassword);
//
//
//
//    }

//    @GetMapping(path = "uSet")
//    public ResponseUtil getCustomer(String id){
//
//        UserDTO customer = service.getCustomer(id);
//        return new ResponseUtil("200"," Success.!",customer);
//    }
}
