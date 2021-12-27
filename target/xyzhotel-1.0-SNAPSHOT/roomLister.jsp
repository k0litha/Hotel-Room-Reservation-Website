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
        background-color: #fff;
        -webkit-box-shadow: 1px 1px 1px 1px #ccc;
        -moz-box-shadow: 1px 1px 1px 1px #ccc;
        box-shadow: 1px 1px 1px 1px #ccc;
    }

    .room_img {
        width: 40%;
        float: left;
        max-height: 280px;
        overflow: hidden;
    }
    .room_img img {
        height: 100%;
        max-height: 280px;
        opacity: 0.69;
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
        color: #ccc;
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
        border-top: 1px solid #e5e5e5;
        color: #e5e5e5;
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
        color: #5fb2cf;
        text-decoration: none;
        text-transform: uppercase;
        font-size: 20px;
        font-size: 2rem;
    }
    .room_features .room_features--book-btn:hover {
        font-size: 21.1px;
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
        background: #F87DA9;
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

<%@ page import=" com.xyz.xyzhotel.Rooms,com.xyz.xyzhotel.AppDao,java.util.List,java.io.*,javax.servlet.ServletException,javax.servlet.http.*,javax.servlet.annotation.*,java.sql.*,java.util.List" %>

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
                <img src="https://theasiacollective.com/wp-content/uploads/2020/02/Mandarin-Oriental-Jumeira-2.jpg"/>
            </div>
            <!-- Room Information -->
            <div class="room_information">
                <h3 class="room_information--heading"><%=rooms.get(i).getRoomName()%></h3>
                <p>1 king sized bed and style all the way to italy, floor-to-ceiling windows.  sleep 2 people, are 340 square feet, and are on floors 4-8</p>
                <a  class="room_information--moreinfo-btn js-room_moreinfo_btn">+ more information</a>
                <p>
                    <input type="radio" id="<%=rooms.get(i).getRoomId()%>1" value="Breakfast only,<%=rooms.get(i).getbfPrice()%>" name="price_and_option" checked>
                    <label for="<%=rooms.get(i).getRoomId()%>1">Breakfast only - <%=rooms.get(i).getbfPrice()%></label>
                </p>
                <p>
                    <input type="radio" id="<%=rooms.get(i).getRoomId()%>2" value="Half board,<%=rooms.get(i).gethbPrice()%>" name="price_and_option">
                    <label for="<%=rooms.get(i).getRoomId()%>2">Half board - <%=rooms.get(i).gethbPrice()%></label>
                </p>
                <p>
                    <input type="radio" id="<%=rooms.get(i).getRoomId()%>3" value="Full board,<%=rooms.get(i).getfbPrice()%>" name="price_and_option">
                    <label for="<%=rooms.get(i).getRoomId()%>3">Full borad - <%=rooms.get(i).getfbPrice()%></label>
                </p>
            </div>
            <div  class="room_moreinfo" style="display: none;">
                <p id="quote">
                    Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles. Ma quande lingues coalesce, li grammatica del resultant lingue es plu simplic e regulari quam ti del coalescent lingues.
                </p>

                <p>
                    Li nov lingua franca va esser plu simplic e regulari quam li existent Europan lingues. It va esser tam simplic quam Occidental in fact, it va esser Occidental. A un Angleso it va semblar un simplificat Angles, quam un skeptic Cambridge amico dit me que Occidental es.Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles.
                </p>
            </div> <!-- /Room more information section-->


            <div class="room_features">
                <ul>
                    <li><i class="fa fa-bath"></i>&nbsp;WC</li> <!-- Bath Icon -->
                    <li><i class="fa fa-male"></i>1-<%=rooms.get(i).getMaxOccupants()%></li> <!-- People Icon -->
                    <li><span class="room_features--price">170.-</span><small class="room_features--currency">CHF</small></li> <!-- Price -->
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
           <h3> Sorry, We can't find any availabilty.</h3>
       </div>
<br><br><br><br><br>
<%  }%>



