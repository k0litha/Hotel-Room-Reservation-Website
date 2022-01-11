
<style>



    #logoutbtn {
        background: none !important;
        border: none;
        padding: 0 !important;
        margin-top: 2px;
        color: #d9534f;
        text-decoration: underline;
        cursor: pointer;
    }
</style>

<div id="sidebar">
    <header>
        <a href="#">Heritage Hotels</a>
    </header>
    <ul class="nav">
        <li>
            <a href="bookings" >
                Bookings
            </a>
        </li>
        <li>
            <a href="rooms" >
                Rooms
            </a>
        </li>
        <li>
            <a href="feedback" >
                Customer Feedback
            </a>
        </li>

    </ul>
</div>
<!-- Content -->
<div id="content">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container-fluid">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="logout" onclick="return confirm('You are about to log out, Are you sure?');"><button id="logoutbtn" >Logout</button></a>
                </li>

                <li><a >Admin(<%= session.getAttribute("username")%>)</a></li>
            </ul>
        </div>

    </nav>