<%@ page import="com.xyz.xyzhotel.beans.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.xyz.xyzhotel.beans.Booking" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin | Heritage Hotels</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <link href='https://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'>
    <link rel="stylesheet" href="admin/css/style.css">
    <link rel="stylesheet" href="admin/css/styleform.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="admin/css/stylescrollable.css">

</head>
<body>

<div id="viewport">
    <!-- Sidebar -->
    <%@ include file="sidebar_navbar.jsp" %>

    <div class="container1">
        <h2 class="heading">Bookings List</h2>
        <div class="scrollable">
            <div>
                <table cellpadding="1" cellspacing="1">
                    <tr>
                        <th>Booking Id</th>
                        <th>Status</th>
                        <th>Full name</th>
                        <th>Check in</th>
                        <th>Check out</th>
                        <th>Hotel</th>
                        <th>Room id</th>
                        <th>Occupants</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Country</th>
                        <th>Zip</th>
                        <th>Option</th>
                        <th>Price</th>

                    </tr>

                    <%
                        List<Booking> books = (ArrayList) request.getAttribute("books");
                        if (books.size() != 0) {
                            for (int i = 0; i < books.size(); i++) {

                    %>
                    <tr>
                        <td><%=books.get(i).getBookingId()%> </td>
                        <td ><%=books.get(i).getStatus()%> </td>
                        <td><%=books.get(i).getFname()%> <%=books.get(i).getLname()%></td>
                        <td><%=books.get(i).getCheckin()%> </td>
                        <td><%=books.get(i).getCheckout()%> </td>
                        <td><%=books.get(i).getHotellocation()%> </td>
                        <td><%=books.get(i).getRoomid()%> </td>
                        <td><%=books.get(i).getOccupants()%> </td>
                        <td><%=books.get(i).getEmail()%> </td>
                        <td><%=books.get(i).getPhone()%> </td>
                        <td><%=books.get(i).getAddress()%> </td>
                        <td><%=books.get(i).getCountry()%> </td>
                        <td><%=books.get(i).getZip()%> </td>
                        <td><%=books.get(i).getPriceOption()%> </td>
                        <td><%=books.get(i).getPrice()%> </td>

                    </tr>

                    <%
                            }
                        }%>


                </table>

            </div>
        </div>

    </div>
</div>
</div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="admin/css/scriptcrollable.js"></script>

</body>
</html>
