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
public class Readed {
    
    private int readed_id;
    private long user_id;
    private int paper_id;
    private String comment;
    private int vote;

    public Readed(int readed_id, long user_id, int paper_id, int vote) {
        this.readed_id = readed_id;
        this.user_id = user_id;
        this.paper_id = paper_id;
        this.vote = vote;
    }

    public int getReaded_id() {
        return readed_id;
    }

    public void setReaded_id(int readed_id) {
        this.readed_id = readed_id;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }
    
    public static int removeReaded(long user_id, int paper_id) throws ClassNotFoundException, SQLException {
        String cmd = "delete from readed where user_id = " + user_id + " and paper_id = " + paper_id;
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        return ps.executeUpdate();
    }
    
    public static int addReaded(String paper_id, String user_id, String content, String score) throws ClassNotFoundException, SQLException {
        String cmd = "INSERT INTO readed (user_id, paper_id, annotation, score) VALUES (" + paper_id + ", " + user_id + ", " + content + ", " +score + ")";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        return ps.executeUpdate();
    }

    public Readed(int readed_id, long user_id, int paper_id, String comment, int vote) {
        this.readed_id = readed_id;
        this.user_id = user_id;
        this.paper_id = paper_id;
        this.comment = comment;
        this.vote = vote;
    }
}
