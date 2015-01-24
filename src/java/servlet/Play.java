/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

public class Play extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession hs = request.getSession();
            String temp = request.getParameter("id");
            String temp_ans = request.getParameter("answer");

            long user_id = Long.parseLong(temp);
            User user = User.find(user_id);
            if (user.getUser_id() == 0) {
                // register for new user
                User.addUser(user_id);
                User.find(user_id);
                hs.setAttribute("score", user.getScore());
                getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
            } else {
                // login for current user
                int score = user.getScore();
                // if user come from the question answer
                if (temp_ans != null) {
                    int ans = Integer.parseInt(temp_ans);
                    if (user.getScore() * 2 == ans) {
                        request.setAttribute("msg", "<div style='width: auto; background-color: green; text-align: center; padding: 5px; margin: 3px 0;'>Congratulations! Your answer is correct!</div>");
                        User.changeScore(user.getUser_id(), "up");
                        score += 1;
                    } else {
                        request.setAttribute("msg", "<div style='width: auto; background-color: orange; text-align: center; padding: 5px; margin: 3px 0;'>Try again, Your answer is incorrect.</div>");
                    }
                }
                hs.setAttribute("score", score);
                getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Play.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Play.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Play.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Play.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
