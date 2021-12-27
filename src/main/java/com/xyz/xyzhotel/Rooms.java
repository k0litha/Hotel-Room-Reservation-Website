package com.xyz.xyzhotel;

public class Rooms {


    private String room_name;
    private String hotel_id;
    private String room_id;
    private String max_occupants;
    private String bf_price;
    private String hb_price;
    private String fb_price;


    public String getRoomName(){ return room_name;}
    public void setRoomName(String room_name){
        this.room_name = room_name;
    }

    public String getHotelId(){ return hotel_id;}
    public void setHotelId(String hotel_id){
        this.hotel_id = hotel_id;
    }

    public String getRoomId(){ return room_id;}
    public void setRoomId(String room_id){
        this.room_id = room_id;
    }

    public String getMaxOccupants(){ return max_occupants;}
    public void setMaxOccupants(String max_occupants){
        this.max_occupants = max_occupants;
    }

    public String getbfPrice(){ return bf_price;}
    public void setbfPrice(String bf_price){
        this.bf_price = bf_price;
    }

    public String gethbPrice(){ return hb_price;}
    public void sethbPrice(String hb_price){
        this.hb_price = hb_price;
    }

    public String getfbPrice(){ return fb_price;}
    public void setfbPrice(String fb_price){
        this.fb_price = fb_price;
    }

}
