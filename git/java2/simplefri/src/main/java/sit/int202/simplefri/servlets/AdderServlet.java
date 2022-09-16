package sit.int202.simplefri.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import sit.int202.simplefri.models.SimpleCalc;

import java.io.IOException;

@WebServlet(name = "AdderServlet", value = "/Adder")
public class AdderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request,response);
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String x = request.getParameter("x");
        String y = request.getParameter("y");

        SimpleCalc simpleCalc = new SimpleCalc(Double.valueOf(x), Double.valueOf(y));
        //subject.save();
        request.setAttribute("simpleCalc", simpleCalc);
        request.setAttribute("result", simpleCalc.getAdd());
        request.getRequestDispatcher("/adder.jsp").forward(request,response);
    }
}
