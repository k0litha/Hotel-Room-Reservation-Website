package com.xyz.xyzhotel.beans;

public class Rooms {



    private String room_name;
    private String hotel_id;
    private String room_id;
    private String max_occupants;
    private String bf_price;
    private String hb_price;
    private String fb_price;
    private String room_img;
    private String room_info;
    private String room_moreinfo;

    private String tempory_roomid;
    private String tempory_hotleid;

    public String getTemphotelId(){ return tempory_hotleid;}
    public void setTemphotelId(String tempory_hotleid){this.tempory_hotleid = tempory_hotleid;}

    public String getTemproomId(){ return tempory_roomid;}
    public void setTemproomId(String tempory_roomid){this.tempory_roomid = tempory_roomid;}


    public String getHotelId(){ return hotel_id;}
    public void setHotelId(String hotel_id){this.hotel_id = hotel_id;}

    public String getRoomInfo(){ return room_info;}
    public void setRoomInfo(String room_info){this.room_info = room_info;}

    public String getRoommoreInfo(){ return room_moreinfo;}
    public void setRoommoreInfo(String room_moreinfo){this.room_moreinfo = room_moreinfo;}

    public String getRoomName(){ return room_name;}
    public void setRoomName(String room_name){
        this.room_name = room_name;
    }

    public String getRoomImg(){ return room_img;}
    public void setRoomImg(String room_img){this.room_img = room_img;}

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
