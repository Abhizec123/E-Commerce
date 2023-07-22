<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
    
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        
        <div class="container"> 
            <div class="row mt-5">
                <div class="col-md-6">
                    
                    <!--card-->
                    <div class="card"> 
                        <div class="card-body">
                            
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">
                                
                            </div>  
                        </div>  
                    </div>
                </div>
                
                <div class="col-md-6"> 
                    <!--form details-->
                    <div class="card"> 
                        <div class="card-body">
                            
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form action="#!">
                                
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                
                                <div class="form-group">
                                    <label for="name">Contact Number</label>
                                    <input value="<%= user.getUserPhone() %>" type="number" class="form-control" id="contact" aria-describedby="emailHelp" placeholder="Enter phone number">
                                </div>
                                
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Shipping Address</label>
                                    <textarea class="form-control" id="Textarea1" rows="3" placeholder="Enter address"></textarea>
                                </div>
                                
                                <div class="container text-center"> 
                                    <button type="button" class="btn btn-primary checkout-btn" onclick="emptyCart()">Order Now</button>
                                    <button class="btn btn-outline-primary"><a href="index.jsp">Continue Shopping</a></button>
                                </div>
                                
                            </form>                                
                        </div>  
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
