package sit.int202.simplefri.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "TestRequestParameterServlet", value = "/TestReq")
public class TestRequestParameterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/favorite_subjects.jsp").forward(request,response);

//        Enumeration<String> params = request.getParameterNames();
//        while (params.hasMoreElements()) {
//            String paramName = params.nextElement();
//            String value = request.getParameter(paramName);
//            System.out.println(paramName + " = " + value);
//        }
//        System.out.println("------------------------");
//
//        String[] subjects = request.getParameterValues("fav_subjects");
//        System.out.println("Favorite Subjects::");
//        for (String subject : subjects) {
//            System.out.println("\t" + subject);
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] subjects = request.getParameterValues("fav_subjects");
//        if (subjects==null || subjects.length==0){
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
//            return;
//        }
        request.getRequestDispatcher("/favorite_subjects.jsp").forward(request,response);

    }
}
