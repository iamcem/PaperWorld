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
public class Reading {
    
    private int reading_id;
    private long user_id;
    private int paper_id;

    public Reading(int readed_id, long user_id, int paper_id) {
        this.reading_id = readed_id;
        this.user_id = user_id;
        this.paper_id = paper_id;
    }

    public int getReading_id() {
        return reading_id;
    }

    public void setReading_id(int readed_id) {
        this.reading_id = readed_id;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public int getPaper_id() {
        return paper_id;
    }

    public void setPaper_id(int paper_id) {
        this.paper_id = paper_id;
    }
    
    public static int addReading(long user_id, int paper_id) throws ClassNotFoundException, SQLException {
        String cmd = "INSERT INTO reading (user_id, paper_id) VALUES (?,?)";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setLong(1, user_id);
        ps.setInt(2, paper_id);
        return ps.executeUpdate();
    }
    
    public static int removeReading(long user_id, int paper_id) throws ClassNotFoundException, SQLException {
        String cmd = "delete from reading where user_id = " + user_id + " and paper_id = " + paper_id;
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        return ps.executeUpdate();
    }
    
}
