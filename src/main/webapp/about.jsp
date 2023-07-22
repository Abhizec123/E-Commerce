<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>About - E-commerce Project</title>
        <%@include file="components/css_js.jsp" %>
        <link rel="stylesheet" href="styles.css">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
                margin: 0;
            }

            html {
                box-sizing: border-box;
            }

            *, *:before, *:after {
                box-sizing: inherit;
            }

            .column {
                float: left;
                width: 33.3%;
                margin-bottom: 16px;
                padding: 0 8px;
            }

            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                margin: 8px;
            }

            .about-section {
                padding: 50px;
                text-align: center;
                background-color: #474e5d;
                color: white;
            }

            .container {
                padding: 0 16px;
            }

            .container::after, .row::after {
                content: "";
                clear: both;
                display: table;
            }

            .title {
                color: grey;
            }

            .button {
                border: none;
                outline: 0;
                display: inline-block;
                padding: 8px;
                color: white;
                background-color: #000;
                text-align: center;
                cursor: pointer;
                width: 100%;
            }

            .button:hover {
                background-color: #555;
            }

            @media screen and (max-width: 650px) {
                .column {
                    width: 100%;
                    display: block;
                }
            }
            .row {
                display: flex;
                justify-content: center;
                align-items: center;
            }
           
            .about-section {
                margin-top: 20px;
            }
             

        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container-fluid">
            
        
        <div class="about-section">
            <h1>About Us Page</h1>
            <br>
            <p>Hello! My name is Abhishek Das, and I am a CS'24 undergrad. I am excited to kickstart my career in the tech industry. 
               <br>I am a dedicated individual with a passion for problem-solving, a strong communicator and collaborator, and am able to work effectively in a team environment.</p>
        </div>

        <h2 style="text-align:center; margin-top: 20px; margin-bottom: 20px;">Our Team</h2>
        
        <div class="row">
            <div class="column">
                <div class="card">
                    <div class="container">
                        <img style="width:100%" class="img-fluid" src="img/Abhishek.png" alt="user_icon">
                    </div>
                    <br>
                     <div class="container">
                        <h2>Abhishek Das</h2>
                        <p class="title">Backend (Java)</p>
                        <p>Hello! My name is Abhishek Das, and I am a Backend Java Developer.</p>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <div class="container">
                        <img class="img-fluid" src="img/Debajyoti.png" alt="user_icon" style="width:100%">
                    </div>
                    <br>
                    <div class="container">
                        <h2>Debajyoti Jana</h2>
                        <p class="title">DBMS Specialist</p>
                        <p>Hello! My name is Debajyoti Jana, and I am currently working on a Full Stack MERN Project.</p>
                    </div>
                </div>
            </div>           
        </div>
        </div>
    </body>
</html>

