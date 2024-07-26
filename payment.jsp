<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>

<%
    // Retrieve form parameters with validation
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zip = request.getParameter("zip");
    String totalPriceStr = request.getParameter("totalPrice");
    
    // Validate totalPrice
    double totalPrice = 0.0;
    if (totalPriceStr != null && !totalPriceStr.isEmpty()) {
        try {
            totalPrice = Double.parseDouble(totalPriceStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    // Get current logged-in user details from session
    HttpSession httpSession = request.getSession();
    String userEmail = (String) httpSession.getAttribute("user"); // Assuming user email is stored in session

    // Check if userEmail is available
    if (userEmail == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if userEmail is not available
        return;
    }

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/ultras";
    String dbUser = "root";
    String dbPassword = "";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Initialize database connection
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // Insert address into the database
        String sql = "INSERT INTO addresses (userEmail, name, address, city, state, zip) VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userEmail);
        pstmt.setString(2, name);
        pstmt.setString(3, address);
        pstmt.setString(4, city);
        pstmt.setString(5, state);
        pstmt.setString(6, zip);
        pstmt.executeUpdate();

        // Initialize Razorpay client with key ID and secret
        RazorpayClient razorpay = new RazorpayClient("rzp_test_3FiYqdcHdWq0a2", "RcMQb17f3vVdGHUbm7i4eRzS");

        // Create an order request
        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", (int)(totalPrice * 100)); // Amount in paise
        orderRequest.put("currency", "INR");
        orderRequest.put("receipt", "order_rcptid_11");

        // Create an order in Razorpay
        Order order = razorpay.Orders.create(orderRequest);

        // Set the order ID to be used in the Razorpay checkout form
        request.setAttribute("order_id", order.get("id"));
        request.setAttribute("totalPrice", (int)(totalPrice * 100));

    } catch (Exception e) {
        e.printStackTrace();
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <!-- Razorpay Checkout -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
<div class="container">
    <h2 class="mt-4 mb-4">Payment</h2>
    <form>
         <script
            src="https://checkout.razorpay.com/v1/checkout.js"
            data-key="rzp_test_3FiYqdcHdWq0a2" // Your Key ID
            data-amount="<%= request.getAttribute("totalPrice") %>" // Amount in paise
            data-currency="INR"
            data-order_id="<%= request.getAttribute("order_id") %>" // Razorpay Order ID
            data-buttontext="Pay with Razorpay"
            data-name="Acme Corp"
            data-description="Test Transaction"
            data-image="https://example.com/your_logo.jpg"
            data-prefill.name="<%= name %>"
            data-prefill.email="test@test.com"
            data-theme.color="#F37254"
            data-callback_url="paymentSuccess.jsp" // Redirect to this URL on payment success
        ></script>
        <input type="hidden" custom="Hidden Element" name="hidden">
    </form>
</div>
</body>
</html>
