
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.mycart.helper.Helper"%>
<%@page import="com.mycompany.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mycart.helper.FactoryProvider"%>
<%@page import="com.mycompany.mycart.dao.CategoryDao"%>
<%@page import="com.mycompany.mycart.entities.User"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%
    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory()); 
    List<Category> list=cdao.getCategories();
    
    //getting user and product count
    Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/css_js.jsp" %>
        
        <style>
            .card{
                border:1px solid #673ab7;
            }
            .card:hover{
                background:#e2e2e2;
                cursor:pointer;
            }
        </style>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>

        <div class="container admin2">
            
            <div class="container-fluid" style="margin-top: 10px;">
                <%@include file="components/message.jsp"%>
            </div>
            
            <!--first row-->
            <div class="row mt-3">
                <!--1st row - 1st Column-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/man.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>

                </div>
                <!--1st row - 2nd Column-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/checklist.png" alt="user_icon">
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>

                </div>
                <!--1st row - 3rd Column-->
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/delivery-box.png" alt="user_icon">
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>

                </div>
            </div>
            <!--second row-->
            <div class="row mt-3">
                <!--second row - 1st Column-->
                <div class="col-md-6">



                    <div class="card" data-toggle="modal" data-target="#exampleModal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/calculator.png" alt="user_icon">
                            </div>
                            <p class="mt-4">Click Here to add new Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>

                </div>
                <!--second row - 2nd Column-->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#productModal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid" src="img/add.png" alt="user_icon">
                            </div>
                            <p class="mt-4">Click Here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <!--Add Category Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductCategoryServlet" method="post">
                            
                            <input type="hidden" name="operation" value="addcategory">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height:200px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                &nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>  
                    </div>
                  
                </div>
            </div>
        </div>
        
        
        
        <!--Add Product Modal -->
        <div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        
                        <form action="ProductCategoryServlet" method="post" enctype="multipart/form-data">
                            
                            <input type="hidden" name="operation" value="addproduct">
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter product title" required/>
                            </div>
                            
                            <div class="form-group">
                                <textarea style="height:150px" class="form-control" placeholder="Enter product description" name="pDesc" required></textarea>
                            </div>
                            
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter price of the product" required/>
                            </div>
                            
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required/>
                            </div>
                            
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required/>
                            </div>
                            
                            <!--dropdown: selecting category-->
                            
                            
                            
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                <%
                                for (Category c :list) {
                                %>
                                
                                <option value="<%= c.getCategoryId() %>"> <%= c.getCategoryTitle()%></option>
                                
                                <%} %>
                                </select>
                            </div>
                            
                            <!--adding pic-->
                             <div class="form-group">
                                &nbsp;<label for="pPic">Upload image of Product</label>
                                <br>
                                &nbsp;<input type="file" name="pPic" required/>
                            </div>
                            
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <!--&nbsp;<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    <%@include file="components/common_modals.jsp" %>
    </body>
</html>
