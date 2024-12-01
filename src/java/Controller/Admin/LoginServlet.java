package Controller.Admin;

import DAL.UsersDAO;
import Model.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    
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
        String password = request.getParameter("password");

        UsersDAO usersDAO = new UsersDAO();

        try {
            Users user = usersDAO.getUserByUsername(username);
            if (user != null && verifyPassword(password, user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", user);           // Lưu đối tượng user vào session
                session.setAttribute("userId", user.getId()); // Lưu userId vào session

                if ("ADMIN".equals(user.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/homesevlet"); // Redirect đến trang admin
                } else {
                    response.sendRedirect(request.getContextPath() + "/listhome"); // Redirect đến trang người dùng
                }
            } else {
                request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không chính xác!");
                request.getRequestDispatcher("Home/Login_Regisster.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi khi đăng nhập!");
            request.getRequestDispatcher("Home/Login_Regisster.jsp").forward(request, response);
        }
    }

    private boolean verifyPassword(String rawPassword, String hashedPassword) {
        return rawPassword.equals(hashedPassword); 
    }
}
