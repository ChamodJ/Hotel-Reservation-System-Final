<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-US-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width , initial-scale=1.0">

        <link rel="stylesheet" href="styles/login.css">
        <link rel="iocn" type="image" href="#">

        <title>Sign-In</title>

    </head>

    <body>
    	<div class="back-btn">
        	<a class="btn" href="pages/landingPages/Home.jsp">Home</a>
      	</div>
    
        <div class="signup-form" >
          <h1>Sign-In</h1>


          <form onSubmit="return loginValidateForm()" action="SignIn" method="post">



            <div class="data-field">
              <input required="" name="email" name="email" type="email" placeholder="Enter E-mail">
            </div>

            <div >
              <div class="data-field">
                <input required="" id="pass" name="password" type="password" placeholder="Enter Password">
              </div>

            </div>            

          <div class="submit-btn-div">
            <button id="submit-btn" type="submit">Submit</button>
          </div>

          <div class="login-reg-div">
            <p>Don't have an Account? <a class="login-link" href="SignUp.html">SignUp</a></p>
          </div>
          </form>

        </div>
        
        <script src="js/validation.js"></script>
    </body>
</html>