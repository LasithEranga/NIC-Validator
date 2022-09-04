package com.mobios.assestment.Controller;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mobios.assestment.Database.Database;
import com.mobios.assestment.Model.Car;
import com.mobios.assestment.Model.User;

@Controller
public class UserController {

    @GetMapping("/add")
    public String newUserModel(Model model){
        List<String> nationalityList = Arrays.asList("Sinhalese", "Hindu", "Islamic");
        User user = new User();
        user.setAddress("address");
        model.addAttribute("user", user);
        model.addAttribute("nationalityList", nationalityList);
        return "AddUser";
    }

    @GetMapping("/edit")
    public String editUserModel(Model model){
        List<String> nationalityList = Arrays.asList("Sinhalese", "Hindu", "Islamic");
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("nationalityList", nationalityList);
        return "AddUser";
    }

    @PostMapping("/register")
    public void newcar(@ModelAttribute("user") User user){
        System.out.println(user.getFullName());
    }

    @PostMapping("/saveUser")
    public int saveUser(@ModelAttribute("user") User user ){

        int count = 0;
        // String query = "INSERT INTO `user`(`nic`, `full_name`, `address`, `dob`, `nationality`, `gender`) VALUES ('"+user.getNic()+"','"+user.getFullName()+"','"+user.getAddress()+"','"+user.getDob()+"','"+user.getNationality()+"','"+user.getGender()+"')";
        // try(Connection conn = Database.getConnection()){

        //     Statement statement = conn.createStatement();
        //     count = statement.executeUpdate(query);

        // }
        // catch(SQLException e){

        //     e.printStackTrace();

        // }
        System.out.println(user);
        return count;
    }

    @PostMapping("/editUser")
    public int editUser(@ModelAttribute("user") User user ){

        int count = 0;
        String query = "UPDATE `user` SET `nic`='"+user.getNic()+"',`full_name`='"+user.getFullName()+"',`address`='"+user.getAddress()+"',`dob`='"+user.getDob()+"',`nationality`='"+user.getNationality()+"',`gender`='"+user.getGender()+"' WHERE nic='"+user.getNic()+"'";
        
        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            count = statement.executeUpdate(query);

        }
        catch(SQLException e){

            e.printStackTrace();

        }
        return count;
    }

    @PostMapping("/deleteUser")
    public int deleteUser(@ModelAttribute("user") User user ){

        int count = 0;
        String query = "DELETE FROM `user` WHERE nic='"+user.getNic()+"'";
        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            count = statement.executeUpdate(query);

        }
        catch(SQLException e){

            e.printStackTrace();

        }
        return count;
    }


    @GetMapping("/getUser")
    public ResultSet getUsers(){

        String query = "SELECT * FROM `user`";
        ResultSet resultSet = null;

        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery(query);

        }
        catch(SQLException e){

            e.printStackTrace();

        }

        return resultSet;
    }
}
