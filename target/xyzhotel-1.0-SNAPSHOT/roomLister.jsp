<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<style>

    *,
    *:after,
    *:before {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }



    .roomcontainer {
        width: 100%;
        max-width: 960px;
        margin: 50px auto;
        border-color: #b4975a;
        border: 2px;
    }

    .roomrow {
        padding: 0 15px;
        margin-top: 1em;
        display: inline-block;
    }


    .room {
        width: 100%;
        height: auto;
        display: block;
        float: left;
        background-color: #f3f6f4;
        -webkit-box-shadow: 1px 1px 1px 1px #8a8f93;
        -moz-box-shadow: 1px 1px 1px 1px #8a8f93;
        box-shadow: 1px 1px 1px 1px #8a8f93;
    }

    .room_img {
        width: 40%;
        float: left;
        max-height: 285px;
        overflow: hidden;
    }
    .room_img img {
        height: 100%;
        max-height: 285px;

    }

    .room_information {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        width: 60%;
        padding: 0px 20px 20px 20px;
        float: left;
        color: #495559;
        font-size: 15px;
        font-size: 1.5rem;
    }
    .room_information .room_information--heading {
        font-family: "Quicksand", sans-serif;
        font-weight: 300;
        font-size: 40px;
        margin: 0.4em 0em;
    }
    .room_information p {
        font-size: 16px;
        font-size: 1.6rem;
    }
    .room_information .room_information--moreinfo-btn {
        color: #464c50;
        text-transform: uppercase;
        text-decoration: none;
        font-size: 13px;
        font-size: 1.3rem;
    }
    .room_information .room_information--moreinfo-btn:hover {
        text-decoration: underline;
    }

    .room_moreinfo {
        padding: 20px;
        width: 100%;
        float: left;
        font-size: 16px;
        font-size: 1.6rem;
    }

    .room_features {
        float: left;
        width: 100%;
        border-top: 1px solid #999999;
        color: #999999;
    }
    .room_features ul {
        margin: 0;
        padding: 0;
        width: 40%;
        float: left;
    }
    .room_features li {
        display: inline-block;
        border-right: 1px solid #e5e5e5;
        text-align: center;
        padding: 0;
        margin: 0;
        float: left;
        height: 60px;
        line-height: 60px;
        width: calc(100% / 3);
        font-size: 20px;
        font-size: 2rem;
    }
    .room_features .room_features--book-btn {
        float: left;
        display: block;
        line-height: 60px;
        width: 60%;
        text-align: center;
        background-color:#b4975a ;
        color: white;
        border-color: #b4975a;
        text-decoration: none;
        text-transform: uppercase;
        font-size: 20px;
        font-size: 2rem;
    }
    .room_features .room_features--book-btn:hover {
        font-size: 23.1px;
        font-size: 2.11rem;
    }

    [type="radio"]:checked,
    [type="radio"]:not(:checked) {
        position: absolute;
        left: -9999px;
    }
    [type="radio"]:checked + label,
    [type="radio"]:not(:checked) + label
    {
        position: relative;
        padding-left: 28px;
        cursor: pointer;
        line-height: 20px;
        display: inline-block;
        color: #666;
    }
    [type="radio"]:checked + label:before,
    [type="radio"]:not(:checked) + label:before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        width: 18px;
        height: 18px;
        border: 1px solid #ddd;
        border-radius: 100%;
        background: #fff;
    }

    [type="radio"]:checked + label:after,
    [type="radio"]:not(:checked) + label:after {
        content: '';
        width: 12px;
        height: 12px;
        background: #b4975a;
        position: absolute;
        top: 4px;
        left: 4px;
        border-radius: 100%;
        -webkit-transition: all 0.2s ease;
        transition: all 0.2s ease;
    }
    [type="radio"]:not(:checked) + label:after {
        opacity: 0;
        -webkit-transform: scale(0);
        transform: scale(0);
    }
    [type="radio"]:checked + label:after {
        opacity: 1;
        -webkit-transform: scale(1);
        transform: scale(1);
    }

</style>

<%@ page import=" com.xyz.xyzhotel.beans.Rooms,com.xyz.xyzhotel.functions.AppDao,java.util.List,java.io.*,javax.servlet.ServletException,javax.servlet.http.*,javax.servlet.annotation.*,java.sql.*,java.util.List" %>

<%

    AppDao dao=new AppDao();
    List<Rooms> rooms = dao.listRooms(
            Integer.parseInt(session.getAttribute("adults").toString()),
            Integer.parseInt(session.getAttribute("children").toString()),
            session.getAttribute("datein").toString(),
            session.getAttribute("dateout").toString(),
            session.getAttribute("hotel").toString()
    );
    if(rooms.size()!=0){
        for (int i = 0; i < rooms.size(); i++)
        {
%>

<form id="form1">
    <div class="roomcontainer">
        <div class="roomrow">
            <input type="hidden"  value="<%=rooms.get(i).getRoomId()%>" name="room_id">
            <input type="hidden"  value="<%=rooms.get(i).getRoomName()%>" name="room_name">
            <section class="room">

                <!-- Room Image -->
                <div class="room_img">
                    <img src="<%=rooms.get(i).getRoomImg()%>"/>
                </div>
                <!-- Room Information -->
                <div class="room_information">
                    <h3 class="room_information--heading"><%=rooms.get(i).getRoomName()%></h3>
                    <p><%=rooms.get(i).getRoomInfo()%></p>
                    <a  class="room_information--moreinfo-btn js-room_moreinfo_btn">+ more information</a>
                    <br>
                    <p>
                        <input type="radio" id="<%=rooms.get(i).getRoomId()%>1" value="Breakfast only,<%=rooms.get(i).getbfPrice()%>" name="price_and_option" checked>
                        <label for="<%=rooms.get(i).getRoomId()%>1"><%=rooms.get(i).getbfPrice()%> $ - Breakfast Only</label>
                    </p>
                    <p>
                        <input type="radio" id="<%=rooms.get(i).getRoomId()%>2" value="Half board,<%=rooms.get(i).gethbPrice()%>" name="price_and_option">
                        <label for="<%=rooms.get(i).getRoomId()%>2"><%=rooms.get(i).gethbPrice()%> $ - Half borad</label>
                    </p>
                    <p>
                        <input type="radio" id="<%=rooms.get(i).getRoomId()%>3" value="Full board,<%=rooms.get(i).getfbPrice()%>" name="price_and_option">
                        <label for="<%=rooms.get(i).getRoomId()%>3"> <%=rooms.get(i).getfbPrice()%> $ - Full borad</label>
                    </p>
                </div>
                <div  class="room_moreinfo" style="display: none;">
                    <p id="quote">
                        <%=rooms.get(i).getRoommoreInfo()%>
                    </p>


                </div> <!-- /Room more information section-->


                <div class="room_features">
                    <ul>
                        <li><i class="fa fa-bath"></i>&nbsp;A/C</li>
                        <li><i class="fa fa-male"></i> 1-<%=rooms.get(i).getMaxOccupants()%></li>
                        <li> Wi-Fi</li>

                    </ul>


                    <button type="submit"  id="bookroom"  name="bookroom" class="room_features--book-btn">Book Now</button>

                </div>

            </section>
        </div>
    </div>
</form>
<%
    }}else{%>
<style>.nobooking-box {
    border-radius: 25px;
    border: 2px solid #a5b1b5;
    background-color: #ebf1f3;
    padding: 20px;
    width: 450px;
    height: 150px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
}


</style>
<br><br><br>
<div class="nobooking-box">
    <h3> Sorry, no accommodation available for your search criteria.</h3>
</div>
<br><br><br><br><br>
<%  }%>



