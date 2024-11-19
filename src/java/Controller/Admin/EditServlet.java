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
@WebServlet(name = "EditServlet", urlPatterns = {"/edit"})
public class EditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        int id;
        CategoryDAO categoryDAO = new CategoryDAO();
        try {
            id = Integer.parseInt(id_raw);
            Category c = categoryDAO.getCategoryByID(id);
            request.setAttribute("category", c);
            request.getRequestDispatcher("Admin/Update.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }

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
            Category cnew = new Category(id, name, describe);
            categoryDAO.update(cnew);
            response.sendRedirect("list");
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

}
