package com.example.fruitbasket;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EntryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        var writer = response.getWriter();
        var path = request.getPathInfo();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
