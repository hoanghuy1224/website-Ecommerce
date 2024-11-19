package Controller.Admin;

import DAL.ProductDAO;
import Model.Product;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "EditProduct", urlPatterns = {"/editproduct"})

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class EditProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        int id;
        ProductDAO pdao = new ProductDAO();
        try {
            if (id_raw == null || id_raw.trim().isEmpty()) {
                throw new NumberFormatException("Product ID is missing.");
            }

            id = Integer.parseInt(id_raw);

            Product product = pdao.getProductByID(id);
            if (product == null) {
                request.setAttribute("error", "Product not found.");
            } else {
                request.setAttribute("product", product);
            }
            request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID format.");
            request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String raw_id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String categoryIdStr = request.getParameter("category_id");

        Part part = request.getPart("image");
        String filename = extractFileName(part);
        String saveDir = "C:\\TradingJDBC_demo\\web\\Admin\\image";
        File fileSaveDir = new File(saveDir);
        if (!fileSaveDir.exists()) {
            if (!fileSaveDir.mkdirs()) {
                throw new IOException("Failed to create directory: " + saveDir);
            }
        }

        if (filename != null && !filename.isEmpty()) {
            String savePath = saveDir + File.separator + filename;
            try {
                part.write(savePath);
            } catch (IOException e) {
                request.setAttribute("error", "Error writing file: " + e.getMessage());
                request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
                return;
            }
        }

        double price = 0.0;
        int categoryId = 0;

        try {
            if (priceStr != null && !priceStr.trim().isEmpty()) {
                price = Double.parseDouble(priceStr);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid price format: " + e.getMessage());
            request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
            return;
        }

        try {
            if (categoryIdStr != null && !categoryIdStr.trim().isEmpty()) {
                categoryId = Integer.parseInt(categoryIdStr);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid category ID format: " + e.getMessage());
            request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
            return;
        }

        ProductDAO productDAO = new ProductDAO();
        try {
            if (raw_id == null || raw_id.trim().isEmpty()) {
                throw new NumberFormatException("Product ID is missing.");
            }

            int id = Integer.parseInt(raw_id);

            Product product = productDAO.getProductByID(id);
            if (product == null) {
                request.setAttribute("error", "Product not found.");
                request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
                return;
            }

            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            
            if (filename != null && !filename.isEmpty()) {
                product.setImage(filename);
            }

            product.setCategoryId(categoryId);
            productDAO.update(product);

            response.sendRedirect("listproduct");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID format.");
            request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error updating product: " + e.getMessage());
            request.getRequestDispatcher("Admin/UpdateProduct.jsp").forward(request, response);
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1).replace("\"", "");
            }
        }
        return "";
    }
}
