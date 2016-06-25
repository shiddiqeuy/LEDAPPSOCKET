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
<title>Form Server to Client</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
  		var myip;
	</script>
	<script type="text/javascript" src="https://www.l2.io/ip.js?var=myip"></script>
    <script>
    function init() {
    	
    	var id = "${lampObject.id}";
    	 	if(id!=""){
    	 	document.getElementById("lampcontrol").value="0b1";
    	 	//var hexid = parseInt("${lampObject.id}");
    	 	//hexid=hexid.toString(16);
    	 	document.getElementById("id").value=id;
    		var tc = parseInt("${lampObject.temperature}");
    		var inttc = ( tc + 30 ) * 255/80;
    		//inttc=inttc.toString(16);
    		document.getElementById("temperature").value=inttc;
    		var hum = parseInt("${lampObject.humidity}");       	
        	//hum=hum.toString(16);
        			document.getElementById("humidity").value=hum;
    	 	}
    }
    
    function updateData(){
    	var sel = document.getElementById("selection");
    	var selected = sel.options[sel.selectedIndex];
    	document.getElementById("ledtype").value=sel.value;  
    	alert ("LED Control = "+document.getElementById("ledtype").value);
    	var dc =  document.getElementById("dustconcentration").value;
    	var lc = document.getElementById("lampcontrol").value;
		    	//alert (dc);
		    	//alert (lc);
	
			document.getElementById("dustconcentration").value="0";		
	    	document.getElementById("id").value="${lampObject.id}";
	    	document.getElementById("temperature").value="${lampObject.temperature}";
	    	document.getElementById("humidity").value="${lampObject.humidity}";
	    	document.getElementById("ledid").value="${lampObject.ledid}";
	    	document.getElementById("groupid").value="${lampObject.groupid}";
	    	document.getElementById("dimming").value="${lampObject.dimming}";
	    	alert(myip);
	    	document.getElementById("server_ip").value=myip;
	    	document.getElementById("server_port").value="${lampObject.server_port}";
	    	document.getElementById("lat").value="${lampObject.lat}";
	    	document.getElementById("lng").value="${lampObject.lng}";
	    	document.getElementById("voltage").value ="${lampObject.voltage}" ;
	    	document.getElementById("current").value ="${lampObject.current}" ;  
	    	var v = document.getElementById("voltage").value;
	    	var c = document.getElementById("voltage").value;
	    		if(v==""||v==null||v=='undefined'||v==NaN){
	    			document.getElementById("voltage").value="0";
	    	}
				if(c==""||c==null||c=='undefined'||c==NaN){
					document.getElementById("current").value="0";
	    	}


    	
    	var asciiled = document.getElementById("ledtype").value;
    	var asciilednew="";
    	
		 var id = '<c:out value="${lampObject.id}"/>'; 
		 //alert(id.charAt(0));
		 //alert(id.charAt(1));
		 var hex1=id.charAt(0);
		 var hex2=id.charAt(1);
		 var ledidascii="";
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
		 
		 ledidascii=hex1+" "+hex2;
		 		 
		 	//"LEDCONTROLON"
		    //"LEDCONTROLOFF"
		    //"LEDREQTH"
		    //"LEDREQVC"
		    //"LEDREQGPS"
		    //"LEDREQDC"
		 
    	if (asciiled=="LEDCONTROLON"){
    		asciilednew="0x02 "+ledidascii+" 0x3a 0x4f 0x4e 0x33 0x4b 0x03";
    	}
    	
    	else if (asciiled=="LEDCONTROLOFF"){
    		asciilednew="0x02 "+ledidascii+" 0x3a 0x4f 0x46 0x46 0x33 0x4b 0x03";
    	}
    	
    	else if (asciiled=="LEDREQTH"){
    		asciilednew="0x02 "+ledidascii+" 0x3a 0x54 0x48 0x03";
    	}
    	
    	else if (asciiled=="LEDREQVC"){
    		asciilednew="0x02 "+ledidascii+" 0x3a 0x56 0x49 0x03";
    	}
    	
    	else if (asciiled=="LEDREQGPS"){
    		asciilednew="0x02 "+ledidascii+" 0x3a 0x47 0x50 0x53 0x03";
    	}
    	
    	else if (asciiled=="LEDREQDC"){
    		asciilednew="0x02 "+ledidascii+" 0x3a 0x44 0x03";
    	}
    	
    	
    	
    	document.getElementById("ledtype").value=asciilednew;
		 alert (document.getElementById("ledtype").value);
		 
    	 document.getElementById('hardwareclientForm').submit();
    	
    }
    
    function Redirect (){
    	var id = document.getElementById("id").value;
    	var url= "editServerclient?id=";
    	alert(url+id);
    	window.location= url+id;
    	
    }
    
  
	//alert('<c:out value="${lampObject.ledid}"/>')


 
 
    </script>
</head>
<body onload="init()">
<br>
<div class="container col-xs-12 ">
   
          <form id="hardwareclientForm" class="form-horizontal" action="saveLampHardware" method="post">
    
                    <div class="form-group">
                    <div class="control-label col-xs-3"> <label for="id">ID</label></div>
                        <div class="col-xs-3">
                            <input id="id" name="id" class="form-control" type="text" disabled="true" />
                        </div>
                        <div class="col-xs-3">   
                            &nbsp;&nbsp;&nbsp;                        
                        </div>
                    </div>
    
                    <div class="form-group">
                        <label for="ledtype" class="control-label col-xs-3">Type</label>
                        <div class="col-xs-6">                       
                            <select id="selection" name="selection" class="form-control" >
                            <option value=" "> Please Choose </option>
							  <option value="LEDCONTROLON">LED CONTROL ON</option>
							  <option value="LEDCONTROLOFF">LED CONTROL OFF</option>
							  <option value="LEDREQTH">Request Temperature & Humidity</option>
							  <option value="LEDREQVC">Request Voltage & Current</option>
							  <option value="LEDREQGPS">Request GPS </option>
							  <option value="LEDREQDC">Request Dust Concentration</option>
							</select>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="control-label col-xs-3"><label for="lampcontrol">LED Status</label></div>
                        <div class="col-xs-3">
                            <input id="lampcontrol" name="lampcontrol" class="form-control" type="text" disabled="true"/>
                        </div>
                    </div>
      
                           
                            	 	<input type="hidden" id="dustconcentration" name="dustconcentration"  />                                                             
	                            	<input type="hidden" id="temperature" name="temperature"  />  
	                            	<input type="hidden" id="ledtype" name="ledtype"  />                                   
	                            	<input type="hidden" id="humidity" name="humidity" />                                       
	                            	<input type="hidden" id="voltage" name="voltage"  />                                 
	                            	<input type="hidden" id="current" name="current"  />               				
	                				<input type="hidden" id="ledid" name="ledid" />
	                				<input type="hidden" id="groupid" name="groupid" />
	                				<input type="hidden" id="dimming" name="dimming" />
	                				<input type="hidden" id="server_ip" name="server_ip" />
	                				<input type="hidden" id="server_port" name="server_port" />
	                				<input type="hidden" id="lat" name="lat" />
	                				<input type="hidden" id="lng" name="lng" /> 
	                				<input type="hidden" id="stationname" name="stationname" />   
	                				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />              		
                                <!--  <input type="button" class="btn btn-success" onclick="updateData()" value="Submit form">  -->

                <div>
     


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	


</body>
</html>