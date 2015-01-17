package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Annotation {
    private int annotation_id;
    private long user_id;
    private int paper_id;
    private String content;

    public Annotation(int annotation_id, long user_id, int paper_id, String content) {
        this.annotation_id = annotation_id;
        this.user_id = user_id;
        this.paper_id = paper_id;
        this.content = content;
    }

    public int getAnnotation_id() {
        return annotation_id;
    }

    public void setAnnotation_id(int annotation_id) {
        this.annotation_id = annotation_id;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
    public static int push(String content) throws ClassNotFoundException, SQLException {
        String cmd = "INSERT INTO annotation (content) VALUES (?)";
        Connection con = ConnectionAgent.getInstance();
        PreparedStatement ps = con.prepareStatement(cmd);
        ps.setString(1, content);
        return ps.executeUpdate();
    }
}
