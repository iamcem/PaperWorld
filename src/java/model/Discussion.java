/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nakin
 */
public class Discussion {
    private int discussion_id;
    private long user_id;
    private int paper_id;
    private String summary;
    private int vote;

    public Discussion(int discussion_id, long user_id, int paper_id, String summary, int vote) {
        this.discussion_id = discussion_id;
        this.user_id = user_id;
        this.paper_id = paper_id;
        this.summary = summary;
        this.vote = vote;
    }

    public int getDiscussion_id() {
        return discussion_id;
    }

    public void setDiscussion_id(int discussion_id) {
        this.discussion_id = discussion_id;
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

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public int getVote() {
        return vote;
    }

    public void setVote(int vote) {
        this.vote = vote;
    }
    
    
}
