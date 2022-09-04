package com.mobios.assestment.Model;

import java.util.Date;

public class User {
    
    private String nic;
    private String fullName;
    private String address;
    private Date dob;
    private String nationality;
    private String gender;


    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }



    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }



    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }



    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }



    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


}
