<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premier League Management</title>
    <link rel="stylesheet" href="home.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="home.jsp">
                <img src="img/pllogo.png" alt="Sportz">
            </a>
        </div>
        <div class="lo-reg">
            <%
                String username = (String) request.getSession().getAttribute("username");
                if (username != null) {
            %>
                <div class="dropdown">
                    <button style="font-weight: bold;"class="dropbtn">Welcome, <%= username %></button>
                    <div class="dropdown-content">
                        <a href="logout.jsp">Logout</a>
                    </div>
                </div>
            <% } else { %>
                <a href="login.jsp" class="signI">
                    <p>Sign In</p>
                </a>
            <% } %>
        </div>
    </header>
    <nav>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="#">News</a></li>
            <li><a href="match.jsp">Matches</a></li>
            <li><a href="team.jsp">Team</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </nav>
    <main>
        <div class="carousel">
            <div class="carousel-images">
                <img src="https://e0.365dm.com/24/05/2048x1152/skysports-premier-league-fixtures_6569272.jpg?20240530084519" alt="Image 1" class="carousel-item">
                <img src="https://e0.365dm.com/24/05/1600x900/skysports-fixtures-premier-league_6567187.jpg?20240527152945" alt="Image 2" class="carousel-item">
                <img src="https://e0.365dm.com/24/05/2048x1152/skysports-premier-league-fixtures_6569288.jpg?20240530090601" alt="Image 3" class="carousel-item">
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Premier League Management</p>
    </footer>
</body>
</html>
