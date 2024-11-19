/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAL.CategoryDAO;
import Model.Category;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoang quang huy
 */
@WebServlet(name = "AddServlet", urlPatterns = {"/add"})
public class AddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("Admin/Add.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String raw_id = request.getParameter("id");
        String name = request.getParameter("name");
        String describe = request.getParameter("describe");

        CategoryDAO categoryDAO = new CategoryDAO();
        try {
            int id = Integer.parseInt(raw_id);
            Category category = categoryDAO.getCategoryByID(id);
            if (category == null) {
                Category cnew = new Category(id, name, describe);
                categoryDAO.insert(cnew);
                response.sendRedirect("list");
            } else {
                request.setAttribute("erro", "trường có id là " + id + " đã tồn tại! ");
                request.getRequestDispatcher("Admin/Add.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

}
