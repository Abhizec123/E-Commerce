
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        
        <%@include file="components/css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row  mt-4">
            <div class="col-md-4 offset-md-4"> 
                <div class="card">
                
                <div class="card-header custom-bg text-black">
                       
                        <h3 class="text-center my-3">Sign up here !!</h3>

                </div>             
                    
                    <div class="card-body" px-5>
                        
                        <%@include file="components/message.jsp" %>                      
                        <form action="register" method="post">
                            <div class="form-group">
                                <label for="username">Name</label>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Enter here" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter here" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter here" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="phone">Phone:</label>
                                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter here" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <textarea style="height: 50px;" class="form-control" id="address" name="address" placeholder="Enter here" required></textarea>
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button> 
                                <button class="btn btn-outline-warning">Reset</button>
                            </div>
                        </form>
                        
                    </div>            
                </div>
            </div>
            </div>
        </div>
        
    </body>
</html>
