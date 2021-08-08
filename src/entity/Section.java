package entity;

public class Section {
    private int sId;
    private String sName;
    private int sTopicCount;
    private int sMasterId;
    private int sParentId;

    public Section() {
    }

    public Section(int sId, String sName, int sTopicCount, int sMasterId, int sParentId) {
        this.sId = sId;
        this.sName = sName;
        this.sTopicCount = sTopicCount;
        this.sMasterId = sMasterId;
        this.sParentId = sParentId;
    }

    public Section(String sName, int sTopicCount, int sMasterId, int sParentId) {
        this.sName = sName;
        this.sTopicCount = sTopicCount;
        this.sMasterId = sMasterId;
        this.sParentId = sParentId;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public String getsName() {
        return sName;
    }

    public void setsNamme(String sName) {
        this.sName = sName;
    }

    public int getsTopicCount() {
        return sTopicCount;
    }

    public void setsTopicCount(int sTopicCount) {
        this.sTopicCount = sTopicCount;
    }

    public int getsMasterId() {
        return sMasterId;
    }

    public void setsMasterId(int sMasterId) {
        this.sMasterId = sMasterId;
    }

    public int getsParentId() {
        return sParentId;
    }

    public void setsParentId(int sParentId) {
        this.sParentId = sParentId;
    }

    @Override
    public String toString() {
        return "Section{" +
                "sId=" + sId +
                ", sNamme='" + sName + '\'' +
                ", sTopicCount=" + sTopicCount +
                ", sMasterId=" + sMasterId +
                ", sParentId=" + sParentId +
                '}';
    }
}
