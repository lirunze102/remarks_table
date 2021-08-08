package entity;

import java.util.Date;

public class Reply {
    private Integer rId;
    private Integer rtId;
    private Integer rsId;
    private Integer ruId;
    private String rTopic;
    private String rContents;
    private Date rPublishtime;
    private Date rModifytime;

    public Reply() {
    }

    public Reply(Integer rtId, Integer rsId, Integer ruId, String rTopic, String rContents) {
        this.rtId = rtId;
        this.rsId = rsId;
        this.ruId = ruId;
        this.rTopic = rTopic;
        this.rContents = rContents;
    }

    public Reply(Integer rId, Integer rtId, Integer rsId, Integer ruId, String rTopic, String rContents, Date rPublishtime, Date rModifytime) {
        this.rId = rId;
        this.rtId = rtId;
        this.rsId = rsId;
        this.ruId = ruId;
        this.rTopic = rTopic;
        this.rContents = rContents;
        this.rPublishtime = rPublishtime;
        this.rModifytime = rModifytime;
    }

    public Reply(Integer rtId, Integer rsId, Integer ruId, String rTopic, String rContents, Date rPublishtime, Date rModifytime) {
        this.rtId = rtId;
        this.rsId = rsId;
        this.ruId = ruId;
        this.rTopic = rTopic;
        this.rContents = rContents;
        this.rPublishtime = rPublishtime;
        this.rModifytime = rModifytime;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer getRtId() {
        return rtId;
    }

    public void setRtId(Integer rtId) {
        this.rtId = rtId;
    }

    public Integer getRsId() {
        return rsId;
    }

    public void setRsId(Integer rsId) {
        this.rsId = rsId;
    }

    public Integer getRuId() {
        return ruId;
    }

    public void setRuId(Integer ruId) {
        this.ruId = ruId;
    }

    public String getrTopic() {
        return rTopic;
    }

    public void setrTopic(String rTopic) {
        this.rTopic = rTopic;
    }

    public String getrContents() {
        return rContents;
    }

    public void setrContents(String rContents) {
        this.rContents = rContents;
    }

    public Date getrPublishtime() {
        return rPublishtime;
    }

    public void setrPublishtime(Date rPublishtime) {
        this.rPublishtime = rPublishtime;
    }

    public Date getrModifytime() {
        return rModifytime;
    }

    public void setrModifytime(Date rModifytime) {
        this.rModifytime = rModifytime;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "rId=" + rId +
                ", rtId=" + rtId +
                ", rsId=" + rsId +
                ", ruId=" + ruId +
                ", rTopic='" + rTopic + '\'' +
                ", rContents='" + rContents + '\'' +
                ", rPublishtime=" + rPublishtime +
                ", rModifytime=" + rModifytime +
                '}';
    }
}
