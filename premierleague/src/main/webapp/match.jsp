<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premier League Matches</title>
    <link rel="stylesheet" href="match.css">
</head>
<body>
    <!-- Header -->
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
                    <button style="font-weight: bold;" class="dropbtn">Welcome, <%= username %></button>
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

    <!-- Navigation -->
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

    <!-- Main Content -->
    <main>
        <div class="container">
        	<div class="matches-section">
                <h1>Trận đấu</h1>
                <div class="match">
                    <div class="team">
                        <img src="img/ars.png" alt="Arsenal">
                        <span>Arsenal</span>
                    </div>
                    <div class="info">
                        <span>Th 7, 14/12</span>
                        <span>22:00</span>
                    </div>
                    <div class="team">
                        <img src="img/evt.png" alt="Everton">
                        <span>Everton</span>
                    </div>
                </div>
        		<hr style="border: 1px solid black; margin: 20px 0;">
                <div class="match">
                    <div class="team">
                        <img src="img/wol.png" alt="Wolves">
                        <span>Wolves</span>
                    </div>
                    <div class="info">
                        <span>Th 7, 14/12</span>
                        <span>22:00</span>
                    </div>
                    <div class="team">
                        <img src="img/ips.png" alt="IpswichTown">
                        <span>Ipswich Town</span>
                    </div>
                </div>
                
                </div>
                <!-- Các trận đấu khác -->
            <div class="ranking-section">
                <h1>Bảng xếp hạng</h1>
                <table>
                    <thead>
                        <tr>
                            <th>Câu lạc bộ</th>
                            <th>ĐĐ</th>
                            <th>Thắng</th>
                            <th>H</th>
                            <th>Thua</th>
                            <th>BT</th>
                            <th>SBT</th>
                            <th>HS</th>
                            <th>Đ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span>1</span><img src="img/liv.png" alt="Liverpool"> Liverpool</td>
                            <td>14</td>
                            <td>11</td>
                            <td>2</td>
                            <td>1</td>
                            <td>29</td>
                            <td>11</td>
                            <td>18</td>
                            <td>35</td>
                        </tr>
                        <tr>
                            <td><span>2</span><img src="img/chel.png" alt="Liverpool"> Chelsea</td>
                            <td>15</td>
                            <td>9</td>
                            <td>4</td>
                            <td>2</td>
                            <td>35</td>
                            <td>18</td>
                            <td>17</td>
                            <td>31</td>
                        </tr>
                        <!-- Các đội khác -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Premier League Management</p>
    </footer>
</body>
</html>
