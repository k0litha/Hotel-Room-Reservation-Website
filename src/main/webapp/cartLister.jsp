<%--
  Created by IntelliJ IDEA.
  User: Koli
  Date: 12/25/2021
  Time: 10:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xyz Hotels Sri Lanka | Official Site</title>
</head>
<body>
<ul class="list-group mb-3">
    <li class="list-group-item d-flex justify-content-between lh-condensed">
        <div>
            <h5 class="my-0"><%=session.getAttribute("room_name")%></h5>
            <small class="text-muted">Option : <%=session.getAttribute("option")%></small><br>
            <small class="text-muted">Check in : <%=session.getAttribute("check_in")%></small><br>
            <small class="text-muted">Check out : <%=session.getAttribute("check_out")%></small><br>
            <small class="text-muted">Occupants : <%=session.getAttribute("occupants")%></small><br>

        </div>
        <br>
        <span class="text-muted"><%=session.getAttribute("price")%> $</span>
    </li>


    <li class="list-group-item d-flex justify-content-between">
        <span>Total (USD)</span>
        <strong>$<%=session.getAttribute("price")%></strong>
        <input type="hidden" id="Total" value="<%=session.getAttribute("price")%>">
        <input type="hidden" id="option" value="<%=session.getAttribute("option")%>">
        <input type="hidden" id="check_in" value="<%=session.getAttribute("check_in")%>">
        <input type="hidden" id="check_out" value="<%=session.getAttribute("check_out")%>">
        <input type="hidden" id="occupants" value="<%=session.getAttribute("occupants")%>">
        <input type="hidden" id="room_id" value="<%=session.getAttribute("room_id")%>">
        <input type="hidden" id="hotel_location" value="<%=session.getAttribute("hotel")%>">


    </li>
</ul>
</body>
</html>
