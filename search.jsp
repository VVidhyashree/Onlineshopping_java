<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Guard Bookings</title>
    <style>
        body {
            background-image: url('https://www.twincitysecurityal.com/images/AdobeStock_297026455_1.jpeg');
            background-repeat: no-repeat;
            background-size: cover;
            font-family: Arial, sans-serif;
            color: white;
        }
        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            margin: auto;
            margin-top: 50px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            background-color: #ffffcc;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: Black;
            color: white;
        }
        input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            border: none;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            text-align: center;
            font-size: 1.2em;
            background-color: #E3E4FA;
            color: black;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <center><h2>Search Guard Bookings</h2></center>
    <%
    String booking_no = request.getParameter("booking_no");
    if (booking_no != null && !booking_no.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/today?characterEncoding=latin1", "root", "Vidhya@123");
            PreparedStatement st = con.prepareStatement("SELECT * FROM ORDERS WHERE Order_No = ?");
            st.setInt(1, Integer.parseInt(booking_no));
            ResultSet rs = st.executeQuery();
    %>
    <TABLE>
    <tr><th>Order No</th><th>Customer Name</th><th>Gender</th><th>Shipping Address</th><th>Product</th><th>Total Cost</th></tr>
    <%
    if (rs.next()) {
        do {
    %>
    <TR>
    <TR style="color: black;">
    
    <TD><%=rs.getInt("Order_No")%></TD>
    <TD><%=rs.getString("Customer_Name")%></TD>
    <TD><%=rs.getString("Gender")%></TD>
    <TD><%=rs.getString("Shipping_Address")%></TD>
    <TD><%=rs.getString("Product")%></TD>
    <TD><%=rs.getFloat("Total_Cost")%></TD>
    </TR>
    <%
        } while (rs.next());
    } else {
    %>
    <tr><td colspan="6" style="text-align: center;">Guard not found</td></tr>
    <%
    }
    rs.close();
    st.close();
    con.close();
    } catch (Exception ex) {
        out.println("<font color='red'>Unable to connect to database.</font>");
        ex.printStackTrace();
    }
    } else {
    %>
    <center>
    <form action="search.jsp" method="get">
        <span style="color: white;">Enter Order Number:</span> <input type="text" name="booking_no">
        <input type="submit" value="Search">
    </form>
    </center>
    <%
    }
    %>
</div>
<div class="container">
    <form action="bank.html" method="get">
        <button type="submit"><-- Back</button>
    </form>
</div>
</body>
</html>





