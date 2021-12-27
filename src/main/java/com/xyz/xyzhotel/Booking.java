package com.xyz.xyzhotel;

public class Booking {


    private String hotel_location;
    private String fname;
    private String lname;
    private String email;
    private String phone;
    private String address;
    private String country;
    private String zip;
    private String room_id;
    private double price;
    private String price_option;
    private String check_in;
    private String check_out;
    private String occupants;



    public Booking(String hotel_location,
                   String fname,
                   String lname,
                   String email,
                   String phone,
                   String address,
                   String country,
                   String zip,
                   String room_id,
                   double price,
                   String price_option,
                   String check_in,
                   String check_out,
                   String occupants) {
        this.hotel_location=hotel_location;
        this.fname=fname;
        this.email=email;
        this.lname=lname;
        this.phone=phone;
        this.address=address;
        this.country=country;
        this.zip=zip;
        this.room_id=room_id;
        this.price=price;
        this.price_option=price_option;
        this.check_in=check_in;
        this.check_out=check_out;
        this.occupants=occupants;

    }


    public String getHotellocation(){ return hotel_location;}
    public void setHotellocation(String hotel_location){
        this.hotel_location = hotel_location;
    }

    public String getFname(){ return fname;}
    public void setFname(String fname){
        this.fname = fname;
    }

    public String getLname(){ return lname;}
    public void setLname(String lname){
        this.lname = lname;
    }

    public String getEmail(){ return fname;}
    public void setEmail(String email){
        this.email = email;
    }

    public String getPhone(){ return phone;}
    public void setPhone(String phone){
        this.phone = phone;
    }

    public String getAddress(){ return address;}
    public void setAddress(String address){
        this.address = address;
    }

    public String getCcountry(){ return country;}
    public void setCountry(String country){
        this.country = country;
    }

    public String getZip(){ return zip;}
    public void setZip(String zip){
        this.zip = zip;
    }

    public String getRoomid(){ return room_id;}
    public void setRoomid(String room_id){
        this.room_id = room_id;
    }

    public double getPrice(){ return price;}
    public void setPrice(double price){
        this.price = price;
    }

    public String getPriceOption(){ return price_option;}
    public void setPriceOption(String price_option){this.price_option = price_option;}

    public String getCheckin(){ return check_in;}
    public void setCheckin(String check_in){this.check_in = check_in;}

    public String getCheckout(){ return check_out;}
    public void setCheckout(String check_out){this.check_out = check_out;}

    public String getOccupants(){ return occupants;}
    public void setOccupants(String occupants){this.occupants = occupants;}







}
