package com.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Kết nối CSDL
            Connection conn = DatabaseConnection.initializeDatabase();

            // Kiểm tra thông tin người dùng
            String sql = "SELECT username FROM user WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String username = rs.getString("username");
                out.println("<script>alert('Đăng nhập thành công! Chào mừng " + username + "');</script>");
                out.println("<script>window.location='home.jsp';</script>");
            } else {
                out.println("<script>alert('Sai email hoặc mật khẩu. Vui lòng thử lại.');</script>");
                out.println("<script>history.back();</script>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<script>alert('Đã xảy ra lỗi: " + e.getMessage() + "');</script>");
            out.println("<script>history.back();</script>");
        }
    }
} 
