<%-- 
    Document   : AppointmentDetails
    Created on : Sep 29, 2014, 12:01:50 PM
    Author     : Melissa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment Created</title>
        <% int rank = 2;
            int sessionid = 2;%>
    </head>
    <body>
        
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
        <div id="accordion" class="centerthis">
            <h3>Success</h3>
            <div>
                <p>Appointment has been created.</p>
                <p>Mail Sent Successfully.</p>
            </div>
        </div>                   
        </div>
        
    </body>
    <jsp:include page="footer.jsp" />
    <jsp:include page="/EmailServlet1"/>
    <script type="text/javascript" src="js/AppointmentDetails.js"></script>
</html>
