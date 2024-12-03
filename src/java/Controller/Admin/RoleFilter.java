package Controller.Admin;

import Model.Users;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;  
import java.io.IOException;

@WebFilter(filterName = "RoleFilter", urlPatterns = {"/homesevlet/*"})
public class RoleFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);

        if (session != null) {
            Users user = (Users) session.getAttribute("user");
            String requestURI = req.getRequestURI();

            if (user != null) {               
                if (requestURI.startsWith(req.getContextPath() + "/homesevlet") && "ADMIN".equals(user.getRole())) {
                    // Nếu người dùng có quyền truy cập (admin), tiếp tục xử lý request
                    chain.doFilter(request, response);
                } else {
                    // Nếu người dùng không có quyền truy cập, chuyển hướng đến trang AccessDenied.jsp
                    res.sendRedirect(req.getContextPath() + "/AccessDenied.jsp");
                }
            } else {
                // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
                res.sendRedirect(req.getContextPath() + "/login");
            }
        } else {
            // Nếu không có session (nghĩa là chưa đăng nhập), chuyển hướng đến trang đăng nhập
            res.sendRedirect(req.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {}
}
