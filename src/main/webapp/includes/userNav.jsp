<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap');

        body{
            margin: 0;
            padding: 0;
            font-family: "Roboto", sans-serif;
        }

        header{
            z-index: 1;
            position: fixed;
            background: #00b4d8;
            padding: 20px;
            width: calc(100% - 0%);
            top: 0;
            height: 30px;
        }

        .left_area h3{
            color: #fff;
            margin: 0;
            font-family: 'Dancing Script', cursive;
            font-size: 30px;
            font-weight: 900;
        }
        
        .logout_btn{
            padding: 10px 20px;
            background-color: #2667ff;
            text-decoration: none;
            float: right;
            margin-top: -40px;
            margin-right: 70px;
            border-radius: 20px;
            font-size: 15px;
            font-weight: 600;
            color: #fff;
            border: none;
        }

            .logout_btn:hover{
            background-color: #ff8500;
            color: #2667ff;
            cursor: pointer;
        }

            .logout_btn:active {
            background-color: #ff5400;
        }

        .sidebar{
            z-index: 1;
            top: 0;
            background: #10204d;
            margin-top: 70px;
            padding-top: 30px;
            position: fixed;
            left: 0;
            width: 250px;
            height: calc(100% - 9%);
            transition: 0.5s;
            transition-property: left;
            overflow-y: auto;
            overflow: hidden;
        }

        .profile_info{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
            background: #e44c06;
        }
        
        .sidebar .profile_info .profile_image{
            width: 100px;
            height: 100px;
            border-radius: 100px;
            margin-bottom: 10px;
        }
        
        .sidebar .profile_info h4{
            color: #000000;
            margin: 20px 0;
            font-size: 20px;
           
        }
        
        .sidebar a{
            color: #fff;
            display: block;
            width: 100%;
            line-height: 60px;
            text-decoration: none;
            padding-left: 40px;
            box-sizing: border-box;
            transition: 0.5s;
            transition-property: background;
        }
        
        .sidebar a:hover{
            background: #19B3D3;
        }
        
        .sidebar i{
            padding-right: 10px;
        }

        .links-content {
            margin: 40px 0;
        }

        .links-content a {
            margin: 20px 0;
        }

        .content{
            width: (100% - 250px);
            margin-top: 60px;
            padding: 20px;
            margin-left: 250px;
            background: url(background.png) no-repeat;
            background-position: center;
            background-size: cover;
            height: 100vh;
        }
    </style>
</head>
<body>
    
    <header>
      <div class="left_area">
        <h3><span>The Scenic Ridge</span></h3>
      </div>
      <div class="right_area">
        <form action="signout">
          <button class="logout_btn" type="submit">Logout</button>
        </form>
      </div>
    </header>
    
    <div class="sidebar">
      <div class="profile_info">
        <h4>Welcome!</h4>
      </div >

      <div class="links">
        <div class="links-content">
            <a href="#"><i class="fas fa-cogs"></i><span>Overview</span></a>
            <a href="Room.html"><i class="fas fa-table"></i><span>Manage Account</span></a>
            <a href="#"><i class="fas fa-th"></i><span>Personal Info</span></a>
            <a href="#"><i class="fas fa-info-circle"></i><span>My Bookings</span></a>
            <a href="#"><i class="fas fa-sliders-h"></i><span>Home</span></a>
        </div>
        
      </div>
    </div>

    <div class="content">

    </div>

  </body>
</html>
