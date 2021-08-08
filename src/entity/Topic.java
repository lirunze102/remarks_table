package entity;

import java.util.Date;

public class Topic {
    private int tId;
    private int tsId;
    private int tuId;
    private String tTopic;
    private String tContents;
    private Integer tReplycount;
    private Integer tClickcount;
    private Date tPublishtime;
    private Date tModifytime;

    public Topic() {
    }

    public Topic(int tId, int tsId, int tuId, String tTopic, String tContents, Integer tReplycount, Integer tClickcount, Date tPublishtime, Date tModifytime) {
        this.tId = tId;
        this.tsId = tsId;
        this.tuId = tuId;
        this.tTopic = tTopic;
        this.tContents = tContents;
        this.tReplycount = tReplycount;
        this.tClickcount = tClickcount;
        this.tPublishtime = tPublishtime;
        this.tModifytime = tModifytime;
    }

    public Topic(int tsId, int tuId, String tTopic, String tContents, Integer tReplycount, Integer tClickcount, Date tPublishtime, Date tModifytime) {
        this.tsId = tsId;
        this.tuId = tuId;
        this.tTopic = tTopic;
        this.tContents = tContents;
        this.tReplycount = tReplycount;
        this.tClickcount = tClickcount;
        this.tPublishtime = tPublishtime;
        this.tModifytime = tModifytime;
    }

    public Topic(int tsId, int tuId, String tTopic, String tContents) {
        this.tsId = tsId;
        this.tuId = tuId;
        this.tTopic = tTopic;
        this.tContents = tContents;
    }

    public int gettId() {
        return tId;
    }

    public void settId(int tId) {
        this.tId = tId;
    }

    public int getTsId() {
        return tsId;
    }

    public void setTsId(int tsId) {
        this.tsId = tsId;
    }

    public int getTuId() {
        return tuId;
    }

    public void setTuId(int tuId) {
        this.tuId = tuId;
    }

    public String gettTopic() {
        return tTopic;
    }

    public void settTopic(String tTopic) {
        this.tTopic = tTopic;
    }

    public String gettContents() {
        return tContents;
    }

    public void settContents(String tContents) {
        this.tContents = tContents;
    }

    public Integer gettReplycount() {
        return tReplycount;
    }

    public void settReplycount(Integer tReplycount) {
        this.tReplycount = tReplycount;
    }

    public Integer gettClickcount() {
        return tClickcount;
    }

    public void settClickcount(Integer tClickcount) {
        this.tClickcount = tClickcount;
    }

    public Date gettPublishtime() {
        return tPublishtime;
    }

    public void settPublishtime(Date tPublishtime) {
        this.tPublishtime = tPublishtime;
    }

    public Date gettModifytime() {
        return tModifytime;
    }

    public void settModifytime(Date tModifytime) {
        this.tModifytime = tModifytime;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "tId=" + tId +
                ", tsId=" + tsId +
                ", tuId=" + tuId +
                ", tTopic='" + tTopic + '\'' +
                ", tContents='" + tContents + '\'' +
                ", tReplycount=" + tReplycount +
                ", tClickcount=" + tClickcount +
                ", tPublishtime=" + tPublishtime +
                ", tModifytime=" + tModifytime +
                '}';
    }
}
