<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team Information</title>
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
                    <button class="dropbtn">Welcome, <%= username %></button>
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
        <h1>Team Information</h1>
        <div class="player-list">
            <div class="player-card">
                <img src="player/mu/hojlund.png" alt="hojlund">
                <div class="dropdown-info">
                    <h3>Rasmus Højlund</h3>
                    <p>Position: ST</p>
                    <p>Number: 9</p>
                    <p>Nationality: Denmark</p>
                </div>
            </div>
            <div class="player-card">
                <img src="player/mu/marguire.png" alt="Harry Maguire">
                <div class="dropdown-info">
                    <h3>Harry Maguire</h3>
                    <p>Position: Defender</p>
                    <p>Number: 5</p>
                    <p>Nationality: England</p>
                </div>
            </div>
            <div class="player-card">
                <img src="img/player3.jpg" alt="Bruno Fernandes">
                <div class="dropdown-info">
                    <h3>Bruno Fernandes</h3>
                    <p>Position: Midfielder</p>
                    <p>Number: 8</p>
                    <p>Nationality: Portugal</p>
                </div>
            </div>
            <div class="player-card">
                <img src="img/player4.jpg" alt="Marcus Rashford">
                <div class="dropdown-info">
                    <h3>Marcus Rashford</h3>
                    <p>Position: Forward</p>
                    <p>Number: 10</p>
                    <p>Nationality: England</p>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Premier League Management</p>
    </footer>
</body>
</html>
