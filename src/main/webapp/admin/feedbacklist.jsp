<%@ page import="com.xyz.xyzhotel.beans.Rooms" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.xyz.xyzhotel.beans.Feedbacks" %>


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




    <form class="form">

        <h2 class="heading">Room List</h2>



        <div class="table">

            <div class="row header green">
                <div class="cell">
                    Full name
                </div>
                <div class="cell">
                    Phone
                </div>
                <div class="cell">
                    Email
                </div>
                <div class="cell">
                    Country
                </div>
                <div class="cell">
                    Comment
                </div>

            </div>
            <%
                List<Feedbacks> feedbacks = (ArrayList) request.getAttribute("feedbacks");
                if (feedbacks.size() != 0) {
                    for (int i = 0; i < feedbacks.size(); i++) {
            %>
            <div class="row">
                <div class="cell" data-title="Full name">
                    <%=feedbacks.get(i).getFullname()%>
                </div>
                <div class="cell" data-title="Phone Id">
                    <%=feedbacks.get(i).getPhone()%>
                </div>
                <div class="cell" data-title="Email">
                    <%=feedbacks.get(i).getEmail()%>
                </div>
                <div class="cell" data-title="Country">
                    <%=feedbacks.get(i).getCountry()%>
                </div>
                <div class="cell" data-title="Comment">
                    <%=feedbacks.get(i).getComments()%>
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
