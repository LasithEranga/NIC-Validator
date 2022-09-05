package com.mobios.assestment.Controller;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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

    public boolean validateNicDobGender(String nic,String submittedDob, String submittedGender){

            int months [] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
            Pattern oldNicPattern = Pattern.compile("^\\d{9}[vxVX]{1}");
            Pattern newNicPattern = Pattern.compile("^\\d{12}");
            Matcher matcher = null;

            boolean validNic = false;
            boolean oldNIC = false;
          
            if (nic.length() == 0) {
          
              return false;
          
            } else {
              if (nic.length() == 12) {
                matcher = newNicPattern.matcher(nic);
                if(matcher.find()){
                    validNic = true;
                    oldNIC = false;
                }else{
                    return false;
                }
                
              } else if (nic.length() == 10) {
                matcher = oldNicPattern.matcher(nic);
                if(matcher.find()){

                    validNic = true;
                    oldNIC = true;
                }else{
                    return false;
                }
                
              }
          
              String gender = "";
              int year;
              int month = 0;
              int date;
              int monthDate;
              int yearDigits;
          
              if (validNic) {
          
                if (oldNIC) {
                  yearDigits =Integer.parseInt(nic.substring(0, 2));
                  monthDate = Integer.parseInt(nic.substring(2, 5));
                  year = 1900 + yearDigits;
                } else {
                  yearDigits = Integer.parseInt(nic.substring(0, 4));
                  monthDate = Integer.parseInt(nic.substring(4, 7));
                  year = yearDigits;
                }
          
                if (monthDate > 500) {
                  monthDate = monthDate - 500;
                  gender = "Female";
                } else {
                  gender = "Male";
                }
          
                int tempMd = monthDate;
          
                for (int i = 0; i < 12; i++) {
                  if (tempMd <= months[i]) {
                    month = i + 1;
                    break;
                  } else {
                    tempMd = tempMd - months[i];
                  }
                }
          
                // date
                for (int i = 0; i < month - 1; i++) {
                  monthDate = monthDate - months[i];
                }
                date = monthDate;
                String yearStr = Integer.toString(year);
                String monthStr = Integer.toString(month);
                if(monthStr.length() != 2){
                    monthStr = "0"+monthStr;
                }
                String dateStr = Integer.toString(date);
                String generatedDob = yearStr+"-"+monthStr+"-"+dateStr;
                //compare submitted values and return
                if(submittedDob.equals(generatedDob) && submittedGender.equals(gender)){
                    return true;
                }else{
                    return false;
                }
              } else {
                return false;
              }
            }
    }

    public boolean validName(String name){
        Pattern namePattern = Pattern.compile("^[a-zA-Z]");
        Matcher matcher = namePattern.matcher(name);
        if(matcher.find()){
            return true;
        }else{
            return false;
        }
    }

    public boolean validAddress(String address){
        Pattern addressPattern = Pattern.compile("^[a-zA-Z0-9/.,]");
        Matcher matcher = addressPattern.matcher(address);
        if(address.length() == 0){
            return false;
        }
        if(matcher.find()){
            return true;
        }else{
            return false;
        }
    }

    @PostMapping("/add-new")
    public RedirectView saveUser(@ModelAttribute("user") User user ){
        boolean isNicDobGenderValid = validateNicDobGender(user.getNic(),user.getDob().toString(),user.getGender());
        boolean isNameValid = validName(user.getFullName());
        boolean isAddressValid = validAddress(user.getAddress());

        if(isNicDobGenderValid && isNameValid && isAddressValid){
            String query = "INSERT INTO `user`(`nic`, `full_name`, `address`, `dob`, `nationality`, `gender`) VALUES ('"+user.getNic()+"','"+user.getFullName()+"','"+user.getAddress()+"','"+user.getDob()+"','"+user.getNationality()+"','"+user.getGender()+"')";
            try(Connection conn = Database.getConnection()){

                Statement statement = conn.createStatement();
                statement.executeUpdate(query);

            }
            catch(SQLException e){

                e.printStackTrace();

            }
        }
        return new RedirectView("/");

    }

    @PostMapping("/editUser")
    public RedirectView editUser(@ModelAttribute("user") User user,@RequestParam("old-nic") String oldNic ){

        boolean isNicDobGenderValid = validateNicDobGender(user.getNic(),user.getDob().toString(),user.getGender());
        boolean isNameValid = validName(user.getFullName());
        boolean isAddressValid = validAddress(user.getAddress());

        if(isNicDobGenderValid && isNameValid && isAddressValid){
            String query = "UPDATE `user` SET `nic`='"+user.getNic()+"',`full_name`='"+user.getFullName()+"',`address`='"+user.getAddress()+"',`dob`='"+user.getDob()+"',`nationality`='"+user.getNationality()+"',`gender`='"+user.getGender()+"' WHERE nic='"+oldNic+"'";
            try(Connection conn = Database.getConnection()){

                Statement statement = conn.createStatement();
                statement.executeUpdate(query);

            }
            catch(SQLException e){

                e.printStackTrace();

            }
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
