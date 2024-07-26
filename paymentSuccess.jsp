<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="paymentfiles.*" %> <!-- Import your helper class -->

<%
    // Retrieve parameters from the request
    String razorpayPaymentId = request.getParameter("razorpay_payment_id");
    String razorpayOrderId = request.getParameter("razorpay_order_id");
    String razorpaySignature = request.getParameter("razorpay_signature");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/ultras";
    String dbUser = "root";
    String dbPassword = "";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Initialize database connection
        Class.forName("com.mysql.jdbc.Driver"); // Use "com.mysql.cj.jdbc.Driver" for MySQL Connector/J 8.x
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // Initialize Razorpay client with key ID and secret
        RazorpayClient razorpay = new RazorpayClient("rzp_test_3FiYqdcHdWq0a2", "RcMQb17f3vVdGHUbm7i4eRzS");

        // Validate the payment signature
        String payload = razorpayOrderId + "|" + razorpayPaymentId;
        String secret = "RcMQb17f3vVdGHUbm7i4eRzS"; // Use your Razorpay secret key
        String generatedSignature = SignatureUtils.generateSignature(payload, secret);

        if (razorpaySignature.equals(generatedSignature)) {
            // Insert order details into the database
            String sql = "INSERT INTO orders (order_id, payment_id, payment_status, userEmail) VALUES (?, ?, 'completed', ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, razorpayOrderId);
            pstmt.setString(2, razorpayPaymentId);
            pstmt.setString(3, (String) request.getSession().getAttribute("user")); // Assuming user email is stored in session
            pstmt.executeUpdate();

            out.println("Payment successful! Your order is confirmed.");
        } else {
            out.println("Payment verification failed!");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
