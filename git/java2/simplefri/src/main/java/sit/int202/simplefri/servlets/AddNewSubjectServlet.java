package sit.int202.simplefri.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.simplefri.entities.Subject;

import java.io.IOException;

@WebServlet(name = "AddNewSubjectServlet", value = "/AddNewSubject")
public class AddNewSubjectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String credit = request.getParameter("credit");
        Subject subject = new Subject(id, title, Double.valueOf(credit));
        //subject.save();
        request.setAttribute("s",subject);
        request.getRequestDispatcher("/subject_info.jsp").forward(request,response);
    }
}
