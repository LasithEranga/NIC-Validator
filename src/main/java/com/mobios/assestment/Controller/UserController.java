package com.mobios.assestment.Controller;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import com.mobios.assestment.Database.Database;
import com.mobios.assestment.Model.User;

@Controller
public class UserController {

    @GetMapping("/")
    public String getUsers(Model model){

        List<User> users = new ArrayList<User>();
        String query = "SELECT * FROM user";
        ResultSet resultSet = null;
        User user = null;
        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                //String nic, String fullName, String address, Date dob, String nationality, String gender
                user = new User(
                    resultSet.getString("nic"),
                    resultSet.getString("full_name"),
                    resultSet.getString("address"),
                    resultSet.getDate("dob"),
                    resultSet.getString("nationality"),
                    resultSet.getString("gender")                    
                    );
                users.add(user);
            }

        }
        catch(SQLException e){

            e.printStackTrace();

        }

        model.addAttribute("users", users);

        return "index";
    }

    @GetMapping("/add-new")
    public String newUserModel(Model model){
        List<String> nationalityList = Arrays.asList("Sinhalese", "Hindu", "Islamic");
        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("nationalityList", nationalityList);
        return "AddUser";
    }

    @GetMapping("/edit-user")
    public String editUserModel(Model model,@RequestParam("nic") String nic ){
        List<String> nationalityList = Arrays.asList("Sinhalese", "Hindu", "Islamic");
        String query = "SELECT * FROM user WHERE nic='"+ nic +"'";
        ResultSet resultSet = null;
        User user = null;
        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            resultSet = statement.executeQuery(query);
            while(resultSet.next()){
                user = new User(
                    resultSet.getString("nic"),
                    resultSet.getString("full_name"),
                    resultSet.getString("address"),
                    resultSet.getDate("dob"),
                    resultSet.getString("nationality"),
                    resultSet.getString("gender")                    
                    );
            }

        }
        catch(SQLException e){

            e.printStackTrace();

        }
        model.addAttribute("user", user);
        model.addAttribute("nationalityList", nationalityList);
        return "EditUser";
    }


    @PostMapping("/add-new")
    public RedirectView saveUser(@ModelAttribute("user") User user ){

        String query = "INSERT INTO `user`(`nic`, `full_name`, `address`, `dob`, `nationality`, `gender`) VALUES ('"+user.getNic()+"','"+user.getFullName()+"','"+user.getAddress()+"','"+user.getDob()+"','"+user.getNationality()+"','"+user.getGender()+"')";
        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            statement.executeUpdate(query);

        }
        catch(SQLException e){

            e.printStackTrace();

        }
        return new RedirectView("/");
    }

    @PostMapping("/editUser")
    public RedirectView editUser(@ModelAttribute("user") User user ){

        String query = "UPDATE `user` SET `nic`='"+user.getNic()+"',`full_name`='"+user.getFullName()+"',`address`='"+user.getAddress()+"',`dob`='"+user.getDob()+"',`nationality`='"+user.getNationality()+"',`gender`='"+user.getGender()+"' WHERE nic='"+user.getNic()+"'";
        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            statement.executeUpdate(query);

        }
        catch(SQLException e){

            e.printStackTrace();

        }
        return new RedirectView("/");
    }

    @PostMapping("/delete-user")
    public RedirectView deleteUser(@RequestParam("nic") String nic  ){

        String query = "DELETE FROM `user` WHERE nic='"+nic+"'";
        try(Connection conn = Database.getConnection()){

            Statement statement = conn.createStatement();
            statement.executeUpdate(query);

        }
        catch(SQLException e){

            e.printStackTrace();

        }
        return new RedirectView("/");
    }


   
}
