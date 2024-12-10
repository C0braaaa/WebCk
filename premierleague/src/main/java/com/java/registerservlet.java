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

import com.java.DatabaseConnection;

@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username"); // Get the username from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Kết nối CSDL thông qua lớp DatabaseConnection
            Connection conn = DatabaseConnection.initializeDatabase();

            // Câu lệnh SQL để chèn dữ liệu vào bảng user (đã thêm username)
            String sql = "INSERT INTO user (username, email, password) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);  // Set the username first
            stmt.setString(2, email);     // Set the email second
            stmt.setString(3, password);  // Set the password third
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script>alert('Đăng ký thành công!');</script>");
                out.println("<script>window.location='login.jsp';</script>"); // Redirect to login after successful registration
            } else {
                out.println("<script>alert('Đăng ký thất bại. Vui lòng thử lại.');</script>");
                out.println("<script>history.back();</script>");
            }

            conn.close();
        } catch (Exception e) {
            out.println("<script>alert('Đã xảy ra lỗi: " + e.getMessage() + "');</script>");
            out.println("<script>history.back();</script>");
        }
    }
}
