package Controller.Admin;

import DAL.ProductDAO;
import Model.Product;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "AddProductServlet", urlPatterns = {"/addproductservlet"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.getRequestDispatcher("Admin/AddProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");

            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String categoryIdStr = request.getParameter("category_id");
            
            Part part = request.getPart("image");
            String filename = extractFileName(part);
            String SavePart = "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\TradingJDBC_demo\\web\\Admin\\image" + File.separator + filename;
            File fileSaveDir = new File(SavePart);
            
//            if (fileSaveDir.exists()) {
//                request.setAttribute("error", "File already exists: " + filename);
//                request.getRequestDispatcher("Admin/AddProduct.jsp").forward(request, response);
//                return;
//            }

            part.write(SavePart+File.separator);

            double price = 0.0;
            int categoryId = 0;

            if (priceStr != null && !priceStr.trim().isEmpty()) {
                try {
                    price = Double.parseDouble(priceStr);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid price format: " + e.getMessage());
                    request.getRequestDispatcher("Admin/AddProduct.jsp").forward(request, response);
                    return;
                }
            }

            if (categoryIdStr != null && !categoryIdStr.trim().isEmpty()) {
                try {
                    categoryId = Integer.parseInt(categoryIdStr);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid category ID format: " + e.getMessage());
                    request.getRequestDispatcher("Admin/AddProduct.jsp").forward(request, response);
                    return;
                }
            }


            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setImage(filename);
            product.setCategoryId(categoryId);

            ProductDAO productDAO = new ProductDAO();
            productDAO.insert(product);

            response.sendRedirect("listproduct");

        } catch (IOException | ServletException e) {
            request.setAttribute("error", "Error adding product: " + e.getMessage());
            request.getRequestDispatcher("Admin/AddProduct.jsp").forward(request, response);
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
