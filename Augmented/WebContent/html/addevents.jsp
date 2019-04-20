<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<script type='text/javascript' src='/Augmented/js/jquery.js'></script>
	<link href='/Augmented/css/calendar.css' rel='stylesheet' type='text/css'>
	<!--  <link href='/Augmented/css/external.css' rel='stylesheet' type='text/css'> -->
	<link href="/Augmented/css/style1.css" rel="stylesheet" type="text/css" media="all"/>
	       <script type='text/javascript'>
            var getDatee = new Date();
            var monthe = getDatee.getMonth();
            var yeare = getDatee.getFullYear();
            var day = getDatee.getDate(); 
            function isEmpty(val){
               return (val === undefined || val == null || val.length <= 0) ? true : false;
            }
            
            function prev()
            {
            	monthe = monthe-1;
                if(monthe < 0)
        	{
        	    yeare = yeare-1;	
                    monthe = 11;
                }
                dispCal(monthe, yeare);
                return false;
            }
            
            function next()
            {
            	monthe = monthe+1;
                if(monthe > 11)
        	{
        	    yeare = yeare+1;	
                    monthe = 0;
                }
                dispCal(monthe, yeare);
                return false;
            }
            
            function daysInMonth(monthe, yeare)
            {
                return 32 - new Date(yeare, monthe, 32).getDate();
            }

            function getElementPosition(arrName,arrItem){
                for(var pos=0; pos<arrName.length; pos++ ){
                    if(arrName[pos]==arrItem){
                        return pos;
                    }
                }
            }
            
            function setVal(getDat){
                $('#sel').val(getDat);
                $('#calendar').hide();
            }
            
            function dispCal(mon,yea){
		var ar = new Array('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
                var chkEmpty = isEmpty(mon);
                var n,days,calendar,startDate,newYea,setvale,i;
                if(chkEmpty != true){
                    mon = mon+1;
                    n = ar[mon-1];
                    n += " "+yea;
                    newYea = yea;
                    days = daysInMonth((mon-1),yea);
                    startDate = new Date(ar[mon-1]+" 1"+","+parseInt(yea));
                }else{
                    mon = getElementPosition(ar,ar[getDatee.getMonth()]);
                    n = ar[getDatee.getMonth()];
                    n += " "+yeare;
                    newYea = yeare;
                    days = daysInMonth(mon,yeare);
                    startDate = new Date(ar[mon]+" 1"+","+parseInt(yeare));
                }
                
                var startDay = startDate.getDay();
                var startDay1 = startDay;
                while(startDay> 0){
                   calendar += "<td></td>";  
                   startDay--;
                }                
                i = 1;
                while (i <= days){
                  if(startDay1 > 6){
                      startDay1 = 0;  
                      calendar += "</tr><tr>";  
                  }  
                  mon = monthe+1;
                  setvale = i+","+n;
		  if(i == day && newYea==yeare && mon==monthe){
		    calendar +="<td class='thisday' onclick='setVal(\""+i+"-"+mon+"-"+newYea+"\")'>"+i+"</td>";
                  }else{  
                    calendar +="<td class='thismon' onclick='setVal(\""+i+"-"+mon+"-"+newYea+"\")'>"+i+"</td>";   
                  }
		  startDay1++;  
                  i++;  
                }
		    calendar +="<td><a style='font-size: 9px; color: #efefef;font-family: arial; text-decoration: none;' href=''>&copy;h</a></td>";   
		
                $('#calendar').css('display','block');
                $('#month').html(n);
                var test = "<tr class='weekdays'><td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td><td>Thu</td><td>Fri</td><td>Sat</td></tr>";  
                test += calendar;
		$('#dispDays').html(test);
            }
        </script>
        </head>
        <body style="background-image: url('/Augmented/images/header.jpg');"> 
         <%
         String info=request.getParameter("msg");
        HttpSession hs=request.getSession(false);
        String path = request.getContextPath();
        String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
        String uid=(String)hs.getAttribute("userinfo");
        if(uid==null)
        {
        	response.sendRedirect("/Augmented/jsp/index.jsp?msg=Invalid Login");
        }
        else
        {
        %>  -
        <div id="divmenu" style="position:absolute;top:5%;left:2%;width:100%;height:100%;">
<div class="wrap">
			<!---start-top-nav---->
	<div class="top-nav">
		<div class="menu1">
			 <ul class="menu2">
		<li>
			<a  class="nav-icon" href=""> </a>
			<ul>
				<li>
					<a class="root-nav1" href="/Augmented/Logout">LOGOUT</a>
							</li>
				
			</ul>
		</li>
	</ul>
		 </div>
		 <div class="top-nav_right">
		 <div class="menu">
		 	<!-- start top-nav-->
			<div class="cssmenu">
					<ul>
					   <li><a href="/Augmented/jsp/adminprofile.jsp"><span>HOME</span></a></li>
					    <li  class="has-sub"><a href=""><span></span>EVENTS</a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/html/addevents.jsp"><span>ADD</span></a></li>
					       
					         <li class="has-sub"><a href="#"><span>DELETE</span></a></li>
					         
					      </ul>
					   </li>
					   <!-- <li  class="has-sub"><a href="#"><span>VIEW</span></a>
					   	<ul>
					         <li class="has-sub"><a href="#"><span>GALLERY</span></a></li>
					         <li class="has-sub"><a href="#"><span>AUDIO</span></a></li>
					         <li class="has-sub"><a href="#"><span>VIDEO</span></a></li>
					      </ul>
					   </li> -->
					   <li  class="has-sub"><a href="#"><span>MESSAGING</span></a>
					   	<ul>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/composeadmin.jsp"><span>COMPOSE</span></a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/inboxadmin.jsp"><span></span>INBOX</a></li>
					         <li class="has-sub"><a href="/Augmented/jsp/adminitems/sentitemadmin.jsp"><span>SENTBOX</span></a></li>
					      </ul>
					   </li>
					   </ul>
				</div>
			<div class="clear"></div>
		</div>
		<!-- start search-->
		<!-- start social icons -->
		<div class="soc_right">
	   	
	          </div>
	          	</div>
	          	<div class="web_search">
				 	<form>
				 		<input type="text" value="Search.." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search..';}">
				 		<input type="submit" value="">
				 	</form>
	    		</div>
			
 		<div class="clear"></div>
	</div>
</div>
</div>








<div class="logo">
					 <a href="/Augmented/jsp/adminprofile.jsp"><img src="/Augmented/images/logo.png" alt="" /></a>
					 </div>










        
                 <div  style="position: absolute;top:30%;left:20%">
           <form action="/Augmented/AddEventsRandom" method="post">
<table cellspacing="10%">
<tr><td>EVENTNAME&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
	 <div class="input-box-grid input-box-grid-white">					
<input type="text"  id="txtename" name="txtename">
						
				</div></td></tr>
	
<tr><td>DETAILS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
<textarea rows=10 cols=22 id="details" name="details"></textarea>
</td></tr>
       <tr><td>SELECT DATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
<div class="input-box-grid input-box-grid-white">
       <input type='text' class="focused-input-white" id='sel' name="sel" onclick='dispCal()' size=10 readonly='readonly' />
       <span><img src='/Augmented/images/calendar.png' onclick='dispCal()' style='cursor: pointer;position: absolute;left: 87%;top:70%' /></span>
        <div style="position: absolute;left:75%;top:60%;">
        <table class='calendar' id='calendar' border=0 cellpadding=0 cellspacing=0>
       
            <tr class='monthdisp'>
                <td class='navigate' align='left'><img src='/Augmented/images/previous.png' onclick='return prev()' /></td>
                <td align='center' id='month'></td>
                <td class='navigate' align='right'><img src='/Augmented/images/next.png' onclick='return next()' /></td>
                </tr>
            <tr>
                <td colspan=3>
                    <table id='dispDays' border=0 cellpadding=4 cellspacing=4>                        
                    </table>                    
                </td>
            </tr>
        </table>
           </div>
      </div>
     </td></tr>
      <tr><td>EVENT TYPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><div class="input-box-grid input-box-grid-white">
         <select name="type" id="type" tabindex="1" class="focused-input-white">
				<option value="comedy">COMEDY</option>
				<option value="devotional">DEVOTIONAL</option>
				<option value="punjabi">PUNJABI</option>
				<option value="hollywood">HOLLYWOOD</option>
		</select></div></td></tr>
 <!-- <tr><td>SNAPSHOT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><div class="input-box-grid input-box-grid-white">
 	
						<input type="file" class="focused-input-white">
	</div></td></tr> -->
 	 <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
       <div class="big-buttons-col1">
						<ul>
							<li><input class="b-btnblue" type="submit" value="ADD EVENT" /></li>
							
						</ul>
					</div></td></tr>
				      
        </table>
</form>
        </div>
     <%} %>
        </body>
        </html>
 
       