
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Admin | Heritage Hotels</title>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<link href='https://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'><link rel="stylesheet" href="admin/css/styleform.css">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'><link rel="stylesheet" href="admin/css/style.css">

<link rel="stylesheet" href="admin/css/styletable.css">

  <style>

    .formadd {
      height: 0;
      top: 30px;
      margin-right:150px ;
    }

    #backbtn{
    background: none !important;
      border: none;
      padding: 0 !important;
      margin-top: 2px;
      color: #069;
      text-decoration: underline;
      cursor: pointer;
    }
  </style>


</head>
<body>

<div id="viewport">
  <!-- Sidebar -->
  <%@ include file="sidebar_navbar.jsp"  %>

  <form class="formadd" action="rooms">
    <button id="backbtn" type="submit">Back</button>
  </form>

  <form class="form" action="rooms" method="post">

    <input type="hidden" id="Temproom_id" value="<%=request.getParameter("room_id")%>" class="floatLabel" name="Temproom_id">
    <input type="hidden" id="Temphotel_id" value="<%=request.getParameter("hotel_location")%>" class="floatLabel" name="Temphotel_id">
    <input type="hidden" id="editroomPost" value="1" class="floatLabel" name="editroomPost">
  <div class="form-group">
    <h2 class="heading">Edit Room</h2>

    <div class="grid">
    <div class="col-1-3 col-1-3-sm">
      <div class="controls">
        <i class="fa fa-sort"></i>
        <select id="hotel_location" name="hotel_location" class="floatLabel" disabled>
          
          <option  value="Kurunegala" >Kurunegala</option>
          <option value="Kandy">Kandy</option>
          <option value="Galle">Galle</option>
          <option value="Colombo">Colombo</option>
        </select>
        <label for="hotel_location">Hotel Location</label>
       </div>     
      </div>



      <div class="col-1-3 col-1-3-sm">
        <div class="controls">
          <i class="fa fa-sort"></i>
          <select id="max_occupants" name="max_occupants" class="floatLabel">
            <option value="2" >2</option>
            <option value="3">3</option>
            <option value="4" >4</option>
            <option value="5">5</option>
          </select>
          <label for="max_occupants"><i class="fa fa-male"></i>&nbsp;&nbsp;Max Occupants</label>
        </div>      
      </div>
  


    </div>


    
    <div class="controls">
      <input type="text" id="room_name" value="<%=request.getParameter("room_name")%>" class="floatLabel" name="room_name">
      <label for="room_name">Room Name</label>
    </div>
    <div class="controls">
      <input type="text" id="room_id" value="<%=request.getParameter("room_id")%>" class="floatLabel" name="room_id" disabled>
      <label for="room_id">Room Id</label>
    </div>  
    
    

    <div class="grid">
      <div class="col-1-3 col-1-3-sm">
        <div class="controls">
          <input type="text" id="bf_price"  value="<%=request.getParameter("bfprice")%>" class="floatLabel" name="bf_price">
      <label for="bf_price">Breakfast Price</label>
        </div>      
      </div>
    
  
      <div class="col-1-3 col-1-3-sm">
      <div class="controls">
        <input type="text" id="hb_price" value="<%=request.getParameter("hbprice")%>" class="floatLabel" name="hb_price">
      <label for="hb_price">Half Board Price</label>
       </div>     
      </div>
      <div class="col-1-3 col-1-3-sm">
        <div class="controls">
          <input type="text" id="fb_price" value="<%=request.getParameter("fbprice")%>" class="floatLabel" name="fb_price">
        <label for="fb_price">Full Board Price</label>
         </div>     
        </div>
       </div>


       <div class="grid">
        <br>
        <div class="controls">
          <input type="text" id="room_img" value="<%=request.getParameter("room_img")%>" class="floatLabel" name="room_img">
          <label for="room_img">Room image URL</label>
        </div>  

        <div class="controls">
          <input type="text" id="room_info" value="<%=request.getParameter("room_info")%>" class="floatLabel" name="room_info">
          <label for="room_info">Short info about the room</label>
        </div>  
        
        <div class="controls">
          <textarea name="room_moreinfo"  name="room_moreinfo" class="floatLabel" id="room_moreinfo"><%=request.getParameter("room_moreinfo")%></textarea>
          <label for="room_moreinfo">More info about the room</label>
          </div>
            <button type="submit" value="Submit" class="col-1-4">Update</button>
      </div>  

  </div>
</form>

</div>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript">
  $(document).ready(function () {
    var $this = $(".floatLabel");
    $this.next().addClass("active");

    document.getElementById("hotel_location").value = "<%=request.getParameter("hotel_location")%>";
    document.getElementById("max_occupants").value = "<%=request.getParameter("max_occupants")%>";
  });

</script>
</body>
</html>
