/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author nakin
 */
public class Paper {
    private int paper_id;
    private String title;
    private String author;

    public Paper(int paper_id, String title, String author) {
        this.paper_id = paper_id;
        this.title = title;
        this.author = author;
    }

    public int getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(int paper_id) {
        this.paper_id = paper_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
    
    public static int addPaper(String title, String author) throws ClassNotFoundException, SQLException {
        String cmd = "INSERT INTO paper (title, author) VALUES (?, ?)";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, title);
        ps.setString(1, author);
        return ps.executeUpdate();
    }
}
