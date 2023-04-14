<!DOCTYPE html>
<html>
    <head>
    	<title>Triplan</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
       </head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <img src="img/logo.svg" alt="" id="logo" class="logo">
        <a class="navbar-brand" href="#">Triplan</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
         
          </ul>
        </div>
      </nav>
    <section class="banner" id="top">
        <div class="container">
            <div class="row">
               
                <div class="col-md-5 col-md-offset-1">
                    <section id="first-tab-group" class="tabgroup">
                        <div id="tab1">
                            <div class="submit-form">
                                <h4>Enter Details <em></em></h4>
                                <form id="form-submit" action="handler.jsp" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <fieldset>
                                                <label for="from">From:</label>
                                                <select required name='startingCity' id="startingCity">
                                                    <option value="">Select a location...</option>
                                                    <option value="chennai">chennai</option>
                                                    <option value="coimbatore">coimbatore</option>
                                                    <option value="madurai">madurai</option>
                                                    <option value="trichy">trichy</option>
                                                    <option value="salem">salem</option>
                                                    <option value="tirunelveli">tirunelveli</option>
                                                    <option value="tirupur">tirupur</option>
                                                    <option value="vellore">vellore</option>
                                                    <option value="erode">erode</option>
                                                    <option value="thoothukudi">thoothukudi</option>
                                                    <option value="dindigul">dindigul</option>
                                                    <option value="thanjavur">thanjavur</option>
                                                    <option value="ranipet">ranipet</option>
                                                    <option value="sivakasi">sivakasi</option>
                                                    <option value="karur">karur</option>
                                                    <option value="ooty">ooty</option>
                                                    <option value="hosur">hosur</option>
                                                    <option value="nagercoil">nagercoil</option>
                                                    <option value="kanchipuram">kanchipuram</option>
                                                    <option value="kumarapalayam">kumarapalayam</option>
                                                    <option value="karaikudi">karaikudi</option>
                                                    <option value="neyveli">neyveli</option>
                                                    <option value="cuddalore">cuddalore</option>
                                                    <option value="kumbakonam">kumbakonam</option>
                                                    <option value="tiruvannamalai">tiruvannamalai</option>
                                                    <option value="pollachi">pollachi</option>
                                                    <option value="rajapalayam">rajapalayam</option>
                                                    <option value="gudiyatham">gudiyatham</option>
                                                    <option value="pudukottai">pudukottai</option>
                                                    <option value="vaniyambadi">vaniyambadi</option>
                                                    <option value="ambur">ambur</option>
                                                    <option value="nagapattinam">nagapattinam</option>
                                                    <option value="kanyakumari">kanyakumari</option>
                                                    <option value="virudhunagar">virudhunagar</option>
                                                </select>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-6">
                                            <fieldset>
                                                <label for="to">To:</label>
                                                <div >
                                                    <button >Destinations</button>
                                                     <ul >
                                                      <li  ><input type='checkbox' id='1'  value="chennai" name="destinations"><label class="option-label" tabindex='-1' for='1'>chennai</label></li>
                                                      <li  ><input type='checkbox' id='2'  value="coimbatore" name="destinations"><label class="option-label" tabindex='-1' for='2'>coimbatore</label></li>
                                                      <li  ><input type='checkbox' id='3'  value="madurai" name="destinations"><label class="option-label" tabindex='-1' for='3'>madurai</label></li>
                                                      <li  ><input type='checkbox' id='4'  value="trichy" name="destinations"><label class="option-label" tabindex='-1' for='4'>trichy</label></li>
                                                      <li  ><input type='checkbox' id='5'  value="salem" name="destinations"><label class="option-label" tabindex='-1' for='5'>salem</label></li>
                                                      <li  ><input type='checkbox' id='6'  value="tirunelveli" name="destinations"><label class="option-label" tabindex='-1' for='6'>tirunelveli</label></li>
                                                      <li  ><input type='checkbox'id='7'  value="tirupur" name="destinations"><label class="option-label"  tabindex='-1' for='7'>tirupur</label></li>
                                                      <li  ><input type='checkbox' id='8'  value="vellore" name="destinations"><label class="option-label" tabindex='-1' for='8'>vellore</label></li>
                                                      <li  ><input type='checkbox' id='9'  value="erode" name="destinations"><label class="option-label" tabindex='-1' for='9'>erode</label></li>
                                                      <li  ><input type='checkbox' id='10' value="thoothukudi" name="destinations"><label class="option-label" tabindex='-1' for='10'>thoothukudi</label></li>
                                                      <li  ><input type='checkbox' id='11' value="dindigul" name="destinations"><label class="option-label" tabindex='-1' for='11'>dindigul</label></li>
                                                      <li  ><input type='checkbox' id='12' value="thanjavur" name="destinations"><label class="option-label" tabindex='-1' for='12'>thanjavur</label></li>
                                                      <li  ><input type='checkbox' id='13' value="ranipet" name="destinations"><label class="option-label" tabindex='-1' for='13'>ranipet</label></li>
                                                      <li  ><input type='checkbox' id='14' value="sivakasi" name="destinations"><label class="option-label" tabindex='-1' for='14'>sivakasi</label></li>
                                                      <li  ><input type='checkbox' id='15' value="karur" name="destinations"><label class="option-label" tabindex='-1' for='15'>karur</label></li>
                                                      <li  ><input type='checkbox' id='16' value="ooty" name="destinations"><label class="option-label" tabindex='-1' for='16'>ooty</label></li>
                                                      <li  ><input type='checkbox' id='17' value="hosur" name="destinations"><label class="option-label" tabindex='-1' for='17'>hosur</label></li>
                                                      <li  ><input type='checkbox' id='18' value="nagercoil" name="destinations"><label class="option-label" tabindex='-1' for='18'>nagercoil</label></li>
                                                      <li  ><input type='checkbox' id='19' value="kanchipuram" name="destinations"><label class="option-label" tabindex='-1' for='19'>kanchipuram</label></li>
                                                      <li  ><input type='checkbox' id='20' value="kumarapalayam" name="destinations"><label class="option-label" tabindex='-1' for='20'>kumarapalayam</label></li>
                                                      <li  ><input type='checkbox' id='21' value="karaikudi" name="destinations"><label class="option-label" tabindex='-1' for='21'>karaikudi</label></li>
                                                      <li  ><input type='checkbox' id='22' value="neyveli" name="destinations"><label class="option-label" tabindex='-1' for='22'>neyveli</label></li>
                                                      <li  ><input type='checkbox' id='23' value="cuddalore" name="destinations"><label class="option-label" tabindex='-1' for='23'>cuddalore</label></li>
                                                      <li  ><input type='checkbox' id='24' value="kumbakonam" name="destinations"><label class="option-label" tabindex='-1' for='24'>kumbakonam</label></li>
                                                      <li  ><input type='checkbox' id='25' value="tiruvannamalai" name="destinations"><label class="option-label" tabindex='-1' for='25'>tiruvannamalai</label></li>
                                                      <li  ><input type='checkbox' id='26' value="pollachi" name="destinations"><label class="option-label" tabindex='-1' for='26'>pollachi</label></li>
                                                      <li  ><input type='checkbox' id='27' value="rajapalayam" name="destinations"><label class="option-label" tabindex='-1' for='27'>rajapalayam</label></li>
                                                      <li  ><input type='checkbox' id='28' value="gudiyatham" name="destinations"><label class="option-label" tabindex='-1' for='28'>gudiyatham</label></li>
                                                      <li  ><input type='checkbox' id='29' value="pudukottai" name="destinations"><label class="option-label" tabindex='-1' for='29'>pudukottai</label></li>
                                                      <li  ><input type='checkbox' id='30' value="vaniyambadi" name="destinations"><label class="option-label" tabindex='-1' for='30'>vaniyambadi</label></li>
                                                      <li  ><input type='checkbox' id='31' value="ambur" name="destinations"><label class="option-label" tabindex='-1' for='31'>ambur</label></li>
                                                      <li  ><input type='checkbox' id='32' value="nagapattinam" name="destinations"><label class="option-label" tabindex='-1' for='32'>nagapattinam</label></li>
                                                      <li  ><input type='checkbox' id='33' value="kanyakumari" name="destinations"><label class="option-label" tabindex='-1' for='33'>kanyakumari</label></li>
                                                      <li  ><input type='checkbox' id='34' value="virudhunagar" name="destinations"><label class="option-label" tabindex='-1' for='34'>virudhunagar</label></li>

                                                    </ul>                                                    
                                                  </div>
                                               
                                            </fieldset>
                                        </div>
                                        </div>
                                        <div class="row">
                                        <div class="col-md-6">
                                            <fieldset>
                                                <label for="departureDate">Departure date:</label>
                                                  <input type="date" name="departureDate" class="form-control date" id="departureDate">
                                               
                                            </fieldset>
                                        </div>
                                        <div class="col-md-6">
                                            <fieldset>
                                                <label for="returnDate">Return date:</label>
                                                <input name="returnDate" type="date" class="form-control date" id="returnDate">
                                               
                                            </fieldset>
                                        </div>
                                        </div>
                                        <div class="row">
                                        <div class="col-md-6">
                                            <fieldset>
                                                <label for="Budget">Budget:</label>
                                                <input name="Budget" class="input-box" type="number" id="budget" placeholder="   Rs. enter buget" required onchange='this.form.()'>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-6">
                                            <fieldset>
                                                <label for="hotelfare">Hotel Fare:</label>
                                                <input name="hotelFare" class="input-box" type="number" id="hotelFare" placeholder="   Rs. hotel fare" required >
                                            </fieldset>
                                        </div>
                                        </div>
                                        <div class="row">
                                        <div class="col-md-6">
                                            <fieldset>
                                                <button type="submit" class="planBtn" >Plan my trip</button>
                                            </fieldset>
                                        </div>
                                        </div>	
                                	</form>
                                    </div>
                                
                            </div>
                            </section>
                        </div>
                        </div>
                        </div>
                    </section>


        <script src="js/main.js"></script>
</body>
</html>