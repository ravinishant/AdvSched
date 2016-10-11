<%-- 
    Document   : appointmentEdit
    Created on : Oct 27, 2014, 11:02:21 PM
    Author     : Melissa
--%>

<%@page import="uta.cse4361.businessobjects.AdvisorAccount"%>
<%@page import="uta.cse4361.businessobjects.Appointment"%>
<%@page import="uta.cse4361.databases.DatabaseManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Appointment</title>
    </head>
<%
            int rank = -1;
            int sessionid = -1;
            String s="";
            if ((session.getAttribute("id") == null) || (session.getAttribute("rank") == null)) {
               response.sendRedirect("index.jsp");
            }
            if (!(session.getAttribute("id") == null)) {
                    sessionid = Integer.parseInt((String) session.getAttribute("id"));
                }
                if (!(session.getAttribute("rank") == null)) {
                    rank = Integer.parseInt((String) session.getAttribute("rank"));
                    System.out.println(rank);
            }
                if(!(session.getAttribute("email")==null))
                {
                    s=(String)session.getAttribute("email");
                }
            if(rank != 0 && rank != 1&& rank!= 2)
                {
                    response.sendRedirect("index.jsp");
                    
                    
                }
      %>
    <body>
        <jsp:include page="navigationbar.jsp" />
        <div id="wrapper">
            <jsp:include page="header.jsp" />
            <div id="appointmentAccordion" class="centerthis" >

                <h3>Account Edit</h3>
                <div>
                    <%

                        DatabaseManager dm = new DatabaseManager();
                        System.out.println(session.getAttribute("email"));
                        if (session.getAttribute("email") == null || session.getAttribute("email") == "" || session.getAttribute("email").equals("")) {
                            response.sendRedirect("AccountModifyConfirmation.jsp"); 
                        }
                        else 
                        {
                            s=(String)session.getAttribute("email");
                           // String emailParam = request.getParameter("email");
                            AdvisorAccount appt = dm.getAccount(s);
                            String name = appt.getName();
                            String email = appt.getEmail();
                            String department = appt.getDepartment();
                            int userRank = appt.getRank();
                             int adviserid=appt.getID();
                        
                    %>
 <form role="form" id="create"  onSubmit="return validate();" action="StudentAccountModifyConfirmation.jsp" method="POST">
     <div class="form-group">
                            <label for="userName" ID</label>
                            <input class="form-control"  type="hidden" name="advisorid" size="50" id="userid" value = "<%=adviserid%>" readonly>
                        </div>                  
     <div class="form-group">
                            <label for="userName">Name</label>
                            <input class="form-control" type="text" name="advisorName" size="50" id="advisorName" value = "<%=name%>">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input class="form-control" type="text" name="email" size="50" id="email" value = "<%=email%>">
                        </div>
                        <div class="form-group">
                            <label for="studentName">Department</label>
                            <input class="form-control" type="text" name="dept" size="50" id="dept" value = "<%=department%>">
                        </div>
                        <div class="form-group">
                            <label for="userRank">Rank</label>
                            <input class="form-control" type="text" name="rank" size="50" id="rank" value = "<%=userRank%>">
                        </div>
                        <div class="form-group">
                         <input type="submit" value="Modify Account" id="submitBtn" class="btn btn-default" class="btn btn-default">
                        </div>
                        <%
                        	}
                        %>
                        
                </div>

            </div> 
        </div>
    </body>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="js/appointmentEdit.js"></script>
</html>
