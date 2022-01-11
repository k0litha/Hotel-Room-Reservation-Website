<%@ page import="com.xyz.xyzhotel.beans.Rooms" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin | Heritage Hotels</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link href='https://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="admin/css/styleform.css">
    <link rel='stylesheet'
          href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'>
    <link rel="stylesheet" href="admin/css/style.css">

    <link rel="stylesheet" href="admin/css/styletable.css">


    <style>

        .formadd {
            height: 0;
            top: 30px;
            margin-right:150px ;
        }

        #editbtn, #addbtn {
            background: none !important;
            border: none;
            padding: 0 !important;
            margin-top: 2px;
            color: #069;
            text-decoration: underline;
            cursor: pointer;
        }

        #delbtn {
            background: none !important;
            border: none;
            padding: 0 !important;
            margin-top: 2px;
            color: #d9534f;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div id="viewport">
    <!-- Sidebar -->
    <%@ include file="sidebar_navbar.jsp" %>


    <form class="formadd">
        <input type="hidden" value="1" name="addroom">
        <button id="addbtn" type="submit">Add Room</button>
    </form>

    <form class="form">

        <h2 class="heading">Room List</h2>



        <div class="table">

            <div class="row header green">
                <div class="cell">
                    Hotel Location
                </div>
                <div class="cell">
                    Room Id
                </div>
                <div class="cell">
                    Room name
                </div>
                <div class="cell">
                    Occupants
                </div>
                <div class="cell">

                </div>
                <div class="cell">

                </div>
            </div>
            <%
                List<Rooms> rooms = (ArrayList) request.getAttribute("rooms");
                if (rooms.size() != 0) {
                    for (int i = 0; i < rooms.size(); i++) {
            %>
            <div class="row">
                <div class="cell" data-title="Hotel Location">
                    <%=rooms.get(i).getHotelId()%>
                </div>
                <div class="cell" data-title="Room Id">
                    <%=rooms.get(i).getRoomId()%>
                </div>
                <div class="cell" data-title="Room name">
                    <%=rooms.get(i).getRoomName()%>
                </div>
                <div class="cell" data-title="Occupants">
                    <%=rooms.get(i).getMaxOccupants()%>
                </div>
                <div class="cell" data-title="Room name">
                    <form id="formedit" action="rooms" method="get">
                        <input type="hidden" value="<%=rooms.get(i).getHotelId()%>" name="hotel_location">
                        <input type="hidden" value="<%=rooms.get(i).getMaxOccupants()%>" name="max_occupants">
                        <input type="hidden" value="<%=rooms.get(i).getRoomName()%>" name="room_name">
                        <input type="hidden" value="<%=rooms.get(i).getRoomId()%>" name="room_id">
                        <input type="hidden" value="<%=rooms.get(i).getRoomImg()%>" name="room_img">
                        <input type="hidden" value="<%=rooms.get(i).getRoomInfo()%>" name="room_info">
                        <input type="hidden" value="<%=rooms.get(i).getRoommoreInfo()%>" name="room_moreinfo">
                        <input type="hidden" value="<%=rooms.get(i).getbfPrice()%>" name="bfprice">
                        <input type="hidden" value="<%=rooms.get(i).gethbPrice()%>" name="hbprice">
                        <input type="hidden" value="<%=rooms.get(i).getfbPrice()%>" name="fbprice">
                        <input type="hidden" value="1" name="editroom">
                        <button id="editbtn" type="submit" value="Submit">Edit</button>


                    </form>
                </div>
                <div class="cell" data-title="Room name">
                    <form id="formdelete" onsubmit="return confirm('You are about to remove a room, Are you sure?');" action="rooms" method="get">
                        <input type="hidden" value="<%=rooms.get(i).getHotelId()%>" name="hotel_location">
                        <input type="hidden" value="<%=rooms.get(i).getRoomId()%>" name="room_id">
                        <input type="hidden" value="1" name="deleteroom">
                        <button id="delbtn"  type="submit" value="Submit">Delete</button>
                    </form>
                </div>
            </div>

            <%
                    }
                }%>
        </div>


    </form>

</div>
</div>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="admin/js/scriptform.js"></script>

</body>
</html>
