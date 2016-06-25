<%--
  User: Shiddiq
  Date: 17.03.2016
  Time: 00:01 AM
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Hardware as a Client</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
  		var myip;
	</script>
	<script type="text/javascript" src="https://www.l2.io/ip.js?var=myip"></script>
    <script>
    var hex="";
    var asciiid="";
    var sts="";
    function init() {
    	var id = "${lampObject.id}";
    	 	if(id!=""){
    	 	document.getElementById("lampcontrol").value="0b1";
    	 	document.getElementById("id").value="${lampObject.id}"
    		document.getElementById("temperature").value="${lampObject.temperature}";
        	document.getElementById("humidity").value="${lampObject.humidity}";
        	document.getElementById("dustconcentration").value="${lampObject.dustconcentration}";
    		document.getElementById("voltage").value="${lampObject.voltage}";
        	document.getElementById("current").value="${lampObject.current}";
    	 	}
    }
    
    function updateData(){
    	var ledtype = document.getElementById("ledtype").value;  	
    	var dc =  document.getElementById("dustconcentration").value;
    	var lc = document.getElementById("lampcontrol").value;
    	var hm = document.getElementById("humidity").value;
    	var tm = document.getElementById("temperature").value;
		    	//alert (dc);
		    	//alert (lc);
				if (dc==""||dc==null){
					document.getElementById("dustconcentration").value="0";	
				}
				if (lc==""||lc==null){
					document.getElementById("lampcontrol").value="0";	
				}
				if (ledtype==""||ledtype==null){
		    		document.getElementById("ledtype").value="0";
		    	}
				if (hm==""||hm==null){
					document.getElementById("humidity").value="0";	
				}
				if (tm==""||tm==null){
		    		document.getElementById("temperature").value="0";
		    	}
	    	document.getElementById("id").value="${lampObject.id}";    	
	    	document.getElementById("ledid").value="${lampObject.ledid}";
	    	document.getElementById("groupid").value="${lampObject.groupid}";
	    	document.getElementById("dimming").value="${lampObject.dimming}";
	    	alert(myip);
	    	document.getElementById("server_ip").value=myip;
	    	document.getElementById("server_port").value="${lampObject.server_port}";
	    	document.getElementById("lat").value="${lampObject.lat}";
	    	document.getElementById("lng").value="${lampObject.lng}";
	    	document.getElementById("stationname").value="${lampObject.stationname}";
	 
    	
    	//added by muhammad shiddiq azis 19.05.2016 jkt 
    	
    		 var id = '<c:out value="${lampObject.id}"/>'; 
    		 //alert(id.charAt(0));
    		 //alert(id.charAt(1));
    		 var hex1=id.charAt(0);
    		 var hex2=id.charAt(1);
    		 var ledidascii="";
    		 var temp;
    		 var hump;
    		 if (hex1=="0"){
    			 hex1= "0x30";
    		 } else if (hex1=="1"){
    			 hex1= "0x31"; 
    		 } else if (hex1=="2"){
    			 hex1= "0x32"; 
    		 } else if (hex1=="3"){
    			 hex1= "0x33"; 
    		 } else if (hex1=="4"){
    			 hex1= "0x34"; 
    		 }else if (hex1=="5"){
    			 hex1= "0x35"; 
    		 } else if (hex1=="6"){
    			 hex1= "0x36"; 
    		 } else if (hex1=="7"){
    			 hex1= "0x37"; 
    		 } else if (hex1=="8"){
    			 hex1= "0x38"; 
    		 } else if (hex1=="9"){
    			 hex1= "0x39"; 
    		 }
    		 
    		 if (hex2=="0"){
    			 hex2= "0x30";
    		 } else if (hex2=="1"){
    			 hex2= "0x31"; 
    		 } else if (hex2=="2"){
    			 hex2= "0x32"; 
    		 } else if (hex2=="3"){
    			 hex2= "0x33"; 
    		 } else if (hex2=="4"){
    			 hex2= "0x34"; 
    		 }else if (hex2=="5"){
    			 hex2= "0x35"; 
    		 } else if (hex2=="6"){
    			 hex2= "0x36"; 
    		 } else if (hex2=="7"){
    			 hex2= "0x37"; 
    		 } else if (hex2=="8"){
    			 hex2= "0x38"; 
    		 } else if (hex2=="9"){
    			 hex2= "0x39"; 
    		 }
    		 
    		var t =document.getElementById("temperature").value;
    		var l=parseFloat(t);
    		t=l.toFixed(1);
    		
    		
       		 if (l<10){
       				if (t.charAt(0)=="0"){
        			 	hext= "0x30";
		       		 } else if (t.charAt(0)=="1"){
		       			 hext= "0x31"; 
		       		 } else if (t.charAt(0)=="2"){
		       			 hext= "0x32"; 
		       		 } else if (t.charAt(0)=="3"){
		       			 hext= "0x33"; 
		       		 } else if (t.charAt(0)=="4"){
		       			 hext= "0x34"; 
		       		 }else if (t.charAt(0)=="5"){
		       			 hext= "0x35"; 
		       		 } else if (t.charAt(0)=="6"){
		       			 hext= "0x36"; 
		       		 } else if (t.charAt(0)=="7"){
		       			 hext= "0x37"; 
		       		 } else if (t.charAt(0)=="8"){
		       			 hext= "0x38"; 
		       		 } else if (t.charAt(0)=="9"){
		       			 hext= "0x39"; 
		       		 }
       				
       				if (t.charAt(2)=="0"){
        			 	hextd= "0x30";
		       		 } else if (t.charAt(2)=="1"){
		       			hextd= "0x31"; 
		       		 } else if (t.charAt(2)=="2"){
		       			hextd= "0x32"; 
		       		 } else if (t.charAt(2)=="3"){
		       			hextd= "0x33"; 
		       		 } else if (t.charAt(2)=="4"){
		       			hextd= "0x34"; 
		       		 }else if (t.charAt(2)=="5"){
		       			hextd= "0x35"; 
		       		 } else if (t.charAt(2)=="6"){
		       			hextd= "0x36"; 
		       		 } else if (t.charAt(2)=="7"){
		       			hextd= "0x37"; 
		       		 } else if (t.charAt(2)=="8"){
		       			hextd= "0x38"; 
		       		 } else if (t.charAt(2)=="9"){
		       			hextd= "0x39"; 
		       		 }
       				
		    			temp="0x30 "+hext+" 0x2E "+hextd;
		    		}else{
		    			if (t.charAt(0)=="0"){
	        			 	hext= "0x30";
			       		 } else if (t.charAt(0)=="1"){
			       			 hext= "0x31"; 
			       		 } else if (t.charAt(0)=="2"){
			       			 hext= "0x32"; 
			       		 } else if (t.charAt(0)=="3"){
			       			 hext= "0x33"; 
			       		 } else if (t.charAt(0)=="4"){
			       			 hext= "0x34"; 
			       		 }else if (t.charAt(0)=="5"){
			       			 hext= "0x35"; 
			       		 } else if (t.charAt(0)=="6"){
			       			 hext= "0x36"; 
			       		 } else if (t.charAt(0)=="7"){
			       			 hext= "0x37"; 
			       		 } else if (t.charAt(0)=="8"){
			       			 hext= "0x38"; 
			       		 } else if (t.charAt(0)=="9"){
			       			 hext= "0x39"; 
			       		 }
	       				
	       				if (t.charAt(2)=="0"){
	        			 	hextd= "0x30";
			       		 } else if (t.charAt(1)=="1"){
			       			hextd= "0x31"; 
			       		 } else if (t.charAt(1)=="2"){
			       			hextd= "0x32"; 
			       		 } else if (t.charAt(1)=="3"){
			       			hextd= "0x33"; 
			       		 } else if (t.charAt(1)=="4"){
			       			hextd= "0x34"; 
			       		 }else if (t.charAt(1)=="5"){
			       			hextd= "0x35"; 
			       		 } else if (t.charAt(1)=="6"){
			       			hextd= "0x36"; 
			       		 } else if (t.charAt(1)=="7"){
			       			hextd= "0x37"; 
			       		 } else if (t.charAt(1)=="8"){
			       			hextd= "0x38"; 
			       		 } else if (t.charAt(1)=="9"){
			       			hextd= "0x39"; 
			       		 }
	       				
	       				if (t.charAt(2)=="0"){
	        			 	hexte= "0x30";
			       		 } else if (t.charAt(3)=="1"){
			       			hexte= "0x31"; 
			       		 } else if (t.charAt(3)=="2"){
			       			hexte= "0x32"; 
			       		 } else if (t.charAt(3)=="3"){
			       			hexte= "0x33"; 
			       		 } else if (t.charAt(3)=="4"){
			       			hexte= "0x34"; 
			       		 }else if (t.charAt(3)=="5"){
			       			hexte= "0x35"; 
			       		 } else if (t.charAt(3)=="6"){
			       			hexte= "0x36"; 
			       		 } else if (t.charAt(3)=="7"){
			       			hexte= "0x37"; 
			       		 } else if (t.charAt(3)=="8"){
			       			hexte= "0x38"; 
			       		 } else if (t.charAt(3)=="9"){
			       			hexte= "0x39"; 
			       		 }
		    			
	       				temp=hext+" "+hextd+" 0x2E "+hexte;
		    		}
       		 
       		var h =document.getElementById("humidity").value;
    		var h1=parseFloat(h);
    		h=h1.toFixed(1);
    		
    		
       		 if (h1<10){
       				if (h.charAt(0)=="0"){
        			 	huext= "0x30";
		       		 } else if (h.charAt(0)=="1"){
		       			 huext= "0x31"; 
		       		 } else if (h.charAt(0)=="2"){
		       			 huext= "0x32"; 
		       		 } else if (h.charAt(0)=="3"){
		       			 huext= "0x33"; 
		       		 } else if (h.charAt(0)=="4"){
		       			 huext= "0x34"; 
		       		 }else if (h.charAt(0)=="5"){
		       			 huext= "0x35"; 
		       		 } else if (h.charAt(0)=="6"){
		       			 huext= "0x36"; 
		       		 } else if (h.charAt(0)=="7"){
		       			 huext= "0x37"; 
		       		 } else if (h.charAt(0)=="8"){
		       			 huext= "0x38"; 
		       		 } else if (h.charAt(0)=="9"){
		       			 huext= "0x39"; 
		       		 }
       				
       				if (h.charAt(2)=="0"){
        			 	huextd= "0x30";
		       		 } else if (h.charAt(2)=="1"){
		       			huextd= "0x31"; 
		       		 } else if (h.charAt(2)=="2"){
		       			huextd= "0x32"; 
		       		 } else if (h.charAt(2)=="3"){
		       			huextd= "0x33"; 
		       		 } else if (h.charAt(2)=="4"){
		       			huextd= "0x34"; 
		       		 }else if (h.charAt(2)=="5"){
		       			huextd= "0x35"; 
		       		 } else if (h.charAt(2)=="6"){
		       			huextd= "0x36"; 
		       		 } else if (h.charAt(2)=="7"){
		       			huextd= "0x37"; 
		       		 } else if (h.charAt(2)=="8"){
		       			huextd= "0x38"; 
		       		 } else if (h.charAt(2)=="9"){
		       			huextd= "0x39"; 
		       		 }
       				
		    			hump="0x30 "+huext+" 0x2E "+huextd;
		    		}else{
		    			if (h.charAt(0)=="0"){
	        			 	huext= "0x30";
			       		 } else if (h.charAt(0)=="1"){
			       			 huext= "0x31"; 
			       		 } else if (h.charAt(0)=="2"){
			       			 huext= "0x32"; 
			       		 } else if (h.charAt(0)=="3"){
			       			 huext= "0x33"; 
			       		 } else if (h.charAt(0)=="4"){
			       			 huext= "0x34"; 
			       		 }else if (h.charAt(0)=="5"){
			       			 huext= "0x35"; 
			       		 } else if (h.charAt(0)=="6"){
			       			 huext= "0x36"; 
			       		 } else if (h.charAt(0)=="7"){
			       			 huext= "0x37"; 
			       		 } else if (th.charAt(0)=="8"){
			       			 huext= "0x38"; 
			       		 } else if (h.charAt(0)=="9"){
			       			 huext= "0x39"; 
			       		 }
	       				
	       				if (h.charAt(2)=="0"){
	        			 	huextd= "0x30";
			       		 } else if (h.charAt(1)=="1"){
			       			huextd= "0x31"; 
			       		 } else if (h.charAt(1)=="2"){
			       			huextd= "0x32"; 
			       		 } else if (h.charAt(1)=="3"){
			       			huextd= "0x33"; 
			       		 } else if (h.charAt(1)=="4"){
			       			huextd= "0x34"; 
			       		 }else if (h.charAt(1)=="5"){
			       			huextd= "0x35"; 
			       		 } else if (h.charAt(1)=="6"){
			       			huextd= "0x36"; 
			       		 } else if (h.charAt(1)=="7"){
			       			huextd= "0x37"; 
			       		 } else if (h.charAt(1)=="8"){
			       			huextd= "0x38"; 
			       		 } else if (h.charAt(1)=="9"){
			       			huextd= "0x39"; 
			       		 }
	       				
	       				if (h.charAt(2)=="0"){
	        			 	huexte= "0x30";
			       		 } else if (h.charAt(3)=="1"){
			       			huexte= "0x31"; 
			       		 } else if (h.charAt(3)=="2"){
			       			huexte= "0x32"; 
			       		 } else if (h.charAt(3)=="3"){
			       			huexte= "0x33"; 
			       		 } else if (h.charAt(3)=="4"){
			       			huexte= "0x34"; 
			       		 }else if (h.charAt(3)=="5"){
			       			huexte= "0x35"; 
			       		 } else if (h.charAt(3)=="6"){
			       			huexte= "0x36"; 
			       		 } else if (h.charAt(3)=="7"){
			       			huexte= "0x37"; 
			       		 } else if (h.charAt(3)=="8"){
			       			huexte= "0x38"; 
			       		 } else if (h.charAt(3)=="9"){
			       			huexte= "0x39"; 
			       		 }
		    			
	       				hump=huext+" "+huextd+" 0x2E "+huexte;
		    		}
    		asciiid=hex1+" "+hex2;
    		sts="<STX>"+id+"T+15.5H50.53V100I.55V100I2.6D999<ETX><CR><LF>";
    		hex="0x02 "+asciiid+" 0x54 + "+temp+" 0x48 "+hump+" 0x33 0x56 V(3) 0x49 Curr(3) 0x35 0x56 V(3) 0x49 Curr(3) 0x44 DC(3) 0x03 0x0d 0x0a";
    		

	    	document.getElementById("STS").value = sts;
	    	document.getElementById("ATS").value = hex;  
	    	

    	 
    	
    }
    
    function Redirect (){
    	var id = document.getElementById("id").value;
    	var url= "editHardwareclient?id=";
    	alert(url+id);
    	window.location= url+id;
    	
    }
	
	function Submit () {
		document.getElementById('hardwareclientForm').submit();
	}
    
  
	//alert('<c:out value="${lampObject.ledid}"/>')


 
 
    </script>
</head>
<body onload="init()">
<br>
<div class="container">
   <h3>Please input decimal number </h3>
   <h4>Sensor Hardware Simulation for temperature,humidity,dust concentration,voltage,current </h4>
   <hr>
          <form id="hardwareclientForm" class="form-horizontal" action="saveLampHardware" method="post">
    
                    <div class="form-group">
                    <div class="control-label col-xs-3"> <label for="id">ID</label></div>
                        <div class="col-xs-3">
                            <input id="id" name="id" class="form-control" type="text" />
                        </div>
                        <div class="col-xs-3">   
                            <img src = '/SpringLedapp/resources/images/ledfind.png' onClick='Redirect()'  >                         
                        </div>
                    </div>
    
                    <div class="form-group">
                        <label for="ledtype" class="control-label col-xs-3">Type</label>
                        <div class="col-xs-6">
                            <input id="ledtype" name="ledtype" class="form-control" type="text" disabled />
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="lampcontrol">LED Status</label></div>
                        <div class="col-xs-6">
                            <input id="lampcontrol" name="lampcontrol" class="form-control" type="text" disabled />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="dustconcentration">Dust Concentration</label></div>
                        <div class="col-xs-6">
                            <input id="dustconcentration" name="dustconcentration" class="form-control" type="text" />
                        </div>
                    </div>
                    
                       <div class="form-group">
                        <div class="control-label col-xs-3"><label for="temperature">Temperature</label></div>
                        <div class="col-xs-6">
                            <input id="temperature" name="temperature" class="form-control" type="text" />  
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="humidity">Humidity</label></div>
                        <div class="col-xs-6">
                            <input id="humidity" name="humidity" class="form-control" type="text" "/>
                        </div>
                    </div>
                    

                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="voltage">Voltage</label></div>
                        <div class="col-xs-6">
                            <input id="voltage" name="voltage" class="form-control" type="text" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="current">Current</label></div>
                        <div class="col-xs-6">
                            <input id="current" name="current" class="form-control" type="text" />
                        </div>
                    </div>
                    
                    

                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-4">

                            </div>
                            <div class="col-xs-4">
                				
                				<input type="hidden" id="ledid" name="ledid" />
                				<input type="hidden" id="groupid" name="groupid" />
                				<input type="hidden" id="dimming" name="dimming" />
                				<input type="hidden" id="server_ip" name="server_ip" />
                				<input type="hidden" id="server_port" name="server_port" />
                				<input type="hidden" id="lat" name="lat" />
                				<input type="hidden" id="lng" name="lng" />
                				<input type="hidden" id="stationname" name="stationname" />   
                				
                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />              		
                                <input type="button" class="btn btn-success" onclick="updateData()" value="Generate">
                               
                            </div>
                            <div class="col-xs-4">
                            </div>
                        </div>
                    </div>
				
						  <fieldset>
							<legend>Hardware-Coordinator Module Form </legend>
							  <div class="form-group">
								<div class="control-label col-xs-3"><label for="STS">String to Server</label></div>
								<div class="col-xs-6">
									<textarea id="STS" rows="1" cols="70" disabled ></textarea>
								</div>
							</div>                    
							 <div class="form-group">
								<div class="control-label col-xs-3"><label for="STH">ASCII to Server</label></div>
								<div class="col-xs-6">
									<textarea id="ATS" rows="4" cols="50" disabled ></textarea>
								</div>
							 </div>
							 <div class="form-group">
								<div class="control-label col-xs-3"></div>
								<div class="col-xs-6">
									<input type="button" class="btn btn-success" onclick="submit()" value="Send">
								</div>
							 </div>
							 
							 
						  </fieldset>

					
   
                <div>
     
    </div>

	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	

</body>

</html>