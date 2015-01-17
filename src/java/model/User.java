/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nakin
 */
public class User {

    private long user_id;
    private int score;

    public User() {
    }

    public User(long user_id, int score) {
        this.user_id = user_id;
        this.score = score;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public static User find(long user_id) throws ClassNotFoundException, SQLException {

        String cmd = "SELECT * FROM user where user_id = " + user_id;

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ResultSet rs = ps.executeQuery();

        User user = new User();
        
        while (rs.next()) {
            user.setUser_id(rs.getLong(1));
            user.setScore(rs.getInt(2));
        }
        
        return (User) user;
    }

    public static int addUser(long user_id) throws ClassNotFoundException, SQLException {
        String cmd = "INSERT INTO user (user_id) VALUES (?)";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setLong(1, user_id);
        return ps.executeUpdate();
    }
    
    public static int changeScore(long user_id, String mode) throws ClassNotFoundException, SQLException {
        
        User user = User.find(user_id);
        int score = user.getScore();
        
        if (mode.equals("up")) {
            score += 1;
        } else if (mode.equals("down")) {
            score -= 1;
        }
        
        String cmd = "UPDATE user SET score = " + score + " where user_id = " + user_id;

        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        int rs = ps.executeUpdate();
        return rs;
    }
}