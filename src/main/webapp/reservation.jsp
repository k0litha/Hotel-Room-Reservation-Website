<!DOCTYPE html>
<html lang="en-US">

<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>
    <meta charset="UTF-8"/>


    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/gh/BMSVieira/BVSelect-VanillaJS@1fbb755/css/bvselect.css'>

    <!--datepicker calender styles// -->
    <link rel="stylesheet" type="text/css" href="https://unpkg.com/lightpick@latest/css/lightpick.css">
    <!--//datepicker calender styles -->

    <!--reservation tabs styles and script files// -->
    <link rel="stylesheet" href="style/css/styleReservationtabs.css">

    <!--///reservation tabs styles and script files -->

    <style>


        @media only screen and (min-width: 1200px) {
            footer.footer-site .footer .footer-bottom .site-map {
                text-align: left;
            }

            footer.footer-site .footer .footer-bottom .copy-rights {
                text-align: right;
            }

            footer.footer-site .footer .footer-bottom .site-map ul li:first-child a {
                padding-left: 0;
            }
        }


        #start, #end {
            width: 30%;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;

            background-position: 10px 10px;
            background-repeat: no-repeat;
            padding: 12px 20px 12px 40px;
        }

        table {
            width: 100%;
            margin: auto;
        }

        table.tablermbtn, table.tablerm {
            height: 50px;
            width: 50%;
            margin: auto;
        }

        table.tablerm tr th, table.tablermbtn tr th {
            text-align: center;
        }

        table.tableac th, td {
            text-align: center;
        }

        table.tableac td {
            height: 100px;
        }

        table.tableac th {
            vertical-align: top;
            height: 60px;
        }

        table.tableds th, td {
            text-align: center;
        }

        table.tableds th {
            vertical-align: top;
            height: 100px;
        }

        table.tableds td {
            height: 50px;
        }



        table.tabledsbtn tr th {
            text-align: center;

        }


        .tab-pane {
            border-bottom: 1px solid #ddd;
            min-height: 600px;
        }

        #nav {
            height: 50px;
            background: black;
            display: block;
            position: fixed;
            padding: 8px;
            width: 100%;
            z-index: 99999;
        }

        #logo {
            color: #fff;
            padding: 6px;
            font-size: 18px;
        }
        #footer {
            height: 70px;
            background: black;
            display: block;
            position: sticky;
            padding:15px;
            display: flex;
            justify-content: center;
            width: 100%;
            z-index: 99999;
        }
        #find {
            color: #fff;
            padding: 6px;
            font-size: 14px;
        }



        .personselect {
            position: relative;
            margin: auto;
            top: 80px;
        }

        .dateselect {
            position: relative;
            display: flex;
            justify-content: center;
            top: 80px;
        }

        .dateselect #start, .dateselect #end {
            margin: 10px;
        }

        .titlename {
            position: relative;
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        #result-3 {
            position: relative;
            display: flex;
            justify-content: center;
            top: 120px;
        }

        .buttonsubmit {
            background-color: white;
            color: black;
            border: 2px solid #555555;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            transition-duration: 0.4s;
            cursor: pointer;
            display: inline-block;
            position: relative;
            display: flex;
            margin: 0 auto;
            top: 130px;

        }

        .back {
            top: 270px;
        }

        .undotopbtn {
            top: -10px;
        }


        .buttonsubmit:hover {
            background-color: #555555;
            color: white;
        }


    </style>


</head>
<body>
<div id="nav">
    <div id="logo">Xyz Resort - <%= session.getAttribute("hotel") %>
    </div>
</div>


<div  id="displaysuccess" class="container">
    <div class="row">
        <section>
            <div class="wizard">
                <div class="wizard-inner">
                    <div class="connecting-line"></div>
                    <ul class="nav nav-tabs" role="tablist">

                        <li role="presentation" class="active">
                            <a href="#AdultsChildren" data-toggle="tab" aria-controls="AdultsChildren" role="tab"
                               title="Adults & Children">
								<span class="round-tab">
									<span>1</span>
								</span>
                            </a>
                        </li>

                        <li role="presentation" class="disabled">
                            <a href="#DatesofStay" data-toggle="tab" aria-controls="DatesofStay" role="tab"
                               title="Dates of Stay">
								<span class="round-tab">
									<span>2</span>
								</span>
                            </a>
                        </li>
                        <li role="presentation" class="disabled">

                            <a href="#Accomadations" id="accomadation_tab" data-toggle="tab"
                               aria-controls="Accomadations" role="tab" title="Accomadations">

								<span class="round-tab">
									<span>3</span>
								</span>
                            </a>
                        </li>

                        <li role="presentation" class="disabled">
                            <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
								<span class="round-tab">
									<span>4</span>
								</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <form role="form">
                    <div class="tab-content">
                        <div class="tab-pane active" role="tabpanel" id="AdultsChildren">
                            <h3 class="titlename">Occupants Selction</h3>
                            <div class="personselect ">

                                <div class=" adult">
                                    <select id="adultselect">

                                        <option value="1" selected>1 Adult</option>
                                        <option value="2">2 Adults</option>
                                        <option value="3">3 Adults</option>
                                    </select>
                                </div>
                                <div class=" child">
                                    <select id="childselect">
                                        <option value="0" selected>- No children -</option>
                                        <option value="1">1 Child</option>
                                        <option value="2">2 Children</option>
                                    </select>
                                </div>
                            </div>


                            <button type="button" id="personsubmit" class="buttonsubmit next-step">Update and continue
                            </button>


                        </div>
                        <div class="tab-pane" role="tabpanel" id="DatesofStay">
                            <h3 class="titlename">Dates of Stay</h3>


                            <div class="dateselect">
                                <input type="text" id="start" value="<%= session.getAttribute("datein") %>"
                                       placeholder="Check in" readonly>

                                <input type="text" id="end" value="<%= session.getAttribute("dateout") %>"
                                       placeholder="Check out" readonly>

                            </div>
                            <h4 id="result-3">&nbsp;</h4>

                            <button type="button" class="buttonsubmit back prev-step">Previous</button>

                            <button type="button" id="datesubmit" class="buttonsubmit next-step">Update and continue
                            </button>


                        </div>
                        <div class="tab-pane" role="tabpanel" id="Accomadations">
                            <h3 class="titlename">Accomadations</h3>

                            <div id="roomslist">

                            </div>

                            <table class="tablermbtn">
                                <tr>
                                    <th>
                                        <button type="button" class="buttonsubmit undotopbtn prev-step">Previous
                                        </button>
                                    </th>


                                </tr>


                            </table>


                        </div>
                        <div class="tab-pane" role="tabpanel" id="complete">
                            <h3 class="titlename">Payment</h3>
                            <div class="container">

                                <form class="card p-2">
                                <div class="row">
                                    <div class="col-md-4 order-md-2 mb-4">
                                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="text-muted">Your Reservation</span>
                                        </h4>

                                        <div id="cartlist"></div>



                                    </div>
                                    <div class="col-md-8 order-md-1">
                                        <h4 class="mb-3">Guest Information</h4>

                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="firstName">First name</label>
                                                    <input type="text" class="form-control" id="firstName" placeholder="" value="" required>

                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label for="lastName">Last name</label>
                                                    <input type="text" class="form-control" id="lastName" placeholder="" value="" required>

                                                </div>
                                            </div>


                                        <br>
                                            <div class="mb-3">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" placeholder="you@example.com">

                                            </div>
                                        <br>
                                            <div class="mb-3">
                                                <label for="address">Address</label>
                                                <input type="text" class="form-control" id="address" placeholder="1234 Main St" required>

                                            </div>
                                        <br>
                                            <div class="mb-3">
                                                <label for="phone">Phone Number <span class="text-muted"></span></label>
                                                <input type="text" class="form-control" id="phone" placeholder="Apartment or suite">
                                            </div>

                                            <div class="row">
                                                <br>
                                                <div class="col-md-5 mb-3">
                                                    <label for="country">Country</label>
                                                    <select style="z-index: 99;"class="custom-select d-block w-100" id="country" required>
                                                        <option value="">Choose...</option>
                                                        <option>United States</option>
                                                        <option>Sri Lanka</option>
                                                        <option>United Kingdom</option>
                                                        <option>India</option>
                                                        <option>Singapore</option>
                                                        <option>Canada</option>
                                                    </select>

                                                </div>


                                                <div class="col-md-3 mb-3">
                                                    <label for="zip">Zip</label>
                                                    <input type="text" class="form-control" id="zip" placeholder="" required>

                                                </div>
                                            </div>
                                            <hr class="mb-4">



                                            <h4 class="mb-3">Payment</h4>


                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <div id="paypal-payment-button"></div>
                                                </div>

                                            </div>

                                            <hr class="mb-4">


                                    </div>
                                </div>
                </form>

                            </div>


                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </section>

    </div>
</div>

<div id="footer">

    <a id="find" href="findbooking">Find my Reservations</a>


</div>












<!--adult and child auto selector script/// -->
<script>
    function autoselector() {
        document.getElementById("adultselect").value = "<%= session.getAttribute("adults") %>";
        document.getElementById("childselect").value = "<%= session.getAttribute("children") %>";
    }

    if ("<%= session.getAttribute("adults") %>" != "null") {
        autoselector();
    }
</script>


<!--datepicker script files/// -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/lightpick@latest/lightpick.js"></script>
<script type="text/javascript" src="js/datepicker.js"></script>


<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\RoomsLister, ajax postings and tabs functions //////////////////////////////////////////////////////////-->
<!--start-->
<script type="text/javascript">
    $(document).ready(function () {

        // reservation page input data validater
        if ($('#start').val() != "" && $('#end').val() != "" && $('#adultselect').val() != "") {
            for (i = 0; i < 2; i++) {
                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);

                // roomlister load
                $("#roomslist").load("roomLister.jsp");
            }
        }


//  roomlister loadwhen clicked the accomadation tab
        $("#accomadation_tab").click(function (e) {
            $("#roomslist").load("roomLister.jsp");
        });

// date submit ajax function
        $('#datesubmit').click(function () {

            if ($('#start').val() == "" || $('#end').val() == "") {
                alert("Please select check in and check out dates. ");
            } else {
                var dates = "new_datein=" + $('#start').val() + "&new_dateout=" + $('#end').val() + "";
                $.ajax({
                    url: 'reservation',
                    type: 'POST',
                    data: dates,
                    success: function (response) {
                        $("#roomslist").load("roomLister.jsp");
                        var $active = $('.wizard .nav-tabs li.active');
                        $active.next().removeClass('disabled');
                        nextTab($active);
                    }
                });
            }
        });


// adults and child submit ajax function....
        $('#personsubmit').click(function () {
            if ($('#adultselect').val() == "" || $('#childselect').val() == "") {
                alert("Please select adults and children count.");
            } else {
                var adultChild = "new_adults=" + $('#adultselect').val() + "&new_children=" + $('#childselect').val() + "";
                $.ajax({
                    url: 'reservation',
                    type: 'POST',
                    data: adultChild,
                    success: function (response) {
                        var $active = $('.wizard .nav-tabs li.active');
                        $active.next().removeClass('disabled');
                        nextTab($active);
                    }
                });
            }
        });


// cart and rooms submit ajax function....
        $('#roomsubmit').click(function () {
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);
        });


// add to cart  ajax function....
        $(document).on("click", '#bookroom', function (event) {
            $("form").submit(function (event) {
                event.preventDefault(); //prevent default action
                var form_data = $(this).serialize(); //Encode form elements for submission
                $.ajax({
                    url: 'addtoCart',
                    type: 'POST',
                    data: form_data,
                    success: (function (response) {
                        $("#cartlist").load("cartLister.jsp");
                        var $active = $('.wizard .nav-tabs li.active');
                        $active.next().removeClass('disabled');
                        nextTab($active);
                    })
                });

            });
        });


// more info  function....
        $(document).on("click", '.js-room_moreinfo_btn', function (event) {
            $(this).closest(".room_information").next().toggle();
        });


//tabs selector events

        $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
            var $target = $(e.target);
            if ($target.parent().hasClass('disabled')) {
                return false;
            }
        });

        $(".prev-step").click(function (e) {
            var $active = $('.wizard .nav-tabs li.active');
            prevTab($active);

        });
    });

</script>


<script>
    //tabs selector events
    function nextTab(elem) {
        $(elem).next().find('a[data-toggle="tab"]').click();
    }

    function prevTab(elem) {
        $(elem).prev().find('a[data-toggle="tab"]').click();
    }
</script>
<!--end-->
<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\RoomsLister, ajax postings and tabs functions //////////////////////////////////////////////////////////-->


<!--selct box//////////////////-->
<script src='https://cdn.jsdelivr.net/gh/BMSVieira/BVSelect-VanillaJS@1fbb755/js/bvselect.js'></script>
<script> document.addEventListener("DOMContentLoaded", function () {
    var adult = new BVSelect({
        selector: "#adultselect",
        searchbox: false,
        offset: false
    });
    var child = new BVSelect({
        selector: "#childselect",
        searchbox: false,
        offset: false
    });
    var country = new BVSelect({
        selector: "#country",
        searchbox: false,
        offset: false
    });

});
</script>


<!--\\\\\\\\\\\\\\\\\\\\\\\Paypal//////////////////////////////////////-->
<!--start-->
<script src="https://www.paypal.com/sdk/js?client-id=AaOEe9Q0Pk5BuqOY7NxumVTHVRTzoEIppj5k7a-klqVHQfqQfHSJJciRYyWL6hHWuFBpJe8mCacELwE3"></script>
<script>paypal.Buttons({
    createOrder: function (data, actions) {
        if(validate()){
        var Total = document.getElementById("Total").value;
        return actions.order.create({
            purchase_units: [{
                amount: {
                    value: ''+Total+''
                }
            }]
        });}
    },
    onApprove: function (data, actions) {
        return actions.order.capture().then(function (details) {
            console.log(details)
                var form = "fname=" + $('#firstName').val() + "&lname=" + $('#lastName').val() + "&email="+ $('#email').val() + "&phone="+ $('#phone').val() + "&address="+ $('#address').val() + "&country="+ $('#country').val() + "&zip="+ $('#zip').val() + "&room_id="+ $('#room_id').val() + "&price="+ $('#Total').val() + "&price_option="+ $('#option').val() + "&check_in="+ $('#check_in').val() +"&check_out="+ $('#check_out').val() +"&occupants="+ $('#occupants').val() +"&hotel_location="+ $('#hotel_location').val() +"";

                $.ajax({
                    url: 'success',
                    type: 'POST',
                    data: form,
                    success: function () {
                        $("#displaysuccess").load("success.jsp");
                    }
                });

        });

    },
    onCancel: function (data) {
       // window.location.replace("")
    }
}).render('#paypal-payment-button');

















//form validations
   function validate() {

      if( $('#firstName').val()== "" || $('#lastName').val() == "")  {
         alert( "Please provide your name!" );
         return false;

      }

       else if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test( $('#email').val())) || $('#email').val()== "")
       {
           alert( "Please provide a valid  email!" );
           return false;
       }
       else if( $('#phone').val() == "" || isNaN( $('#phone').val()  ) ||
           $('#phone').val().length != 10)  {
           alert( "Please provide your valid phone number" );
          return false;
       }
       else if( $('#address').val()== "" || $('#address').val().length <= 12)  {
           alert( "Please provide your valid address" );

       }

      else if( $('#zip').val() == "" || isNaN( $('#zip').val()  ) ||
          $('#zip').val().length != 5 ) {
         alert( "Please provide a valid zip number." );
          return false;
      }

      else if( $('#country').val() < "1" ) {
         alert( "Please provide your country!" );
          return false;
      }
       return true;
   }

</script>












</script>
<!--end-->


</body>


</html>
