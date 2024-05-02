package model;

public class Gift {
    private int giftId;
    private int accountId;
    private String gname;
    private String gpostnum;
    private String gaddress;

    public Gift(int giftId, int accountId, String gname, String gpostnum, String gaddress) {
        this.giftId = giftId;
        this.accountId = accountId;
        this.gname = gname;
        this.gpostnum = gpostnum;
        this.gaddress = gaddress;
    }

    public int getGiftId() {
        return giftId;
    }

    public void setGiftId(int giftId) {
        this.giftId = giftId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGpostnum() {
        return gpostnum;
    }

    public void setGpostnum(String gpostnum) {
        this.gpostnum = gpostnum;
    }

    public String getGaddress() {
        return gaddress;
    }

    public void setGaddress(String gaddress) {
        this.gaddress = gaddress;
    }
}
