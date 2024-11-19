package Controller.Admin;

import DAL.UsersDAO;
import Model.Users;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/adduser"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("Home/Login_Regisster.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");  
        if (role == null || role.isEmpty()) {
            role = "USER";  // Gán giá trị mặc định nếu role không được chỉ định
        }

        Timestamp created_at = new Timestamp(new Date().getTime());

        UsersDAO usersDAO = new UsersDAO();

        try {
            String hashedPassword = hashPassword(password);
            Users newUser = new Users(0, username, hashedPassword, email, created_at, role);
            usersDAO.insert(newUser);
            response.sendRedirect("Home/Login_Regisster.jsp"); 
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi khi đăng ký người dùng!");
            request.getRequestDispatcher("Home/Login_Regisster.jsp").forward(request, response);
        }
    }

    private String hashPassword(String password) {
        return password; 
    }
}
