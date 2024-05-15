package model;

import java.sql.Date;

public class Account {
    private int accountId;
    private String mailAddress;
    private String password;
    private String name;
    private String postnum;
    private String address;
    private String birthday;
    private String telephone;
    private String recognition;
    private boolean okDm;
    private Date createdAt;
    private String updatedAt;

    public Account() {
    }

    public Account(String mailAddress, String password, String name, String postnum, String address, String birthday, String telephone, String recognition, boolean okDm, Date createdAt, String updatedAt) {
        this.mailAddress = mailAddress;
        this.password = password;
        this.name = name;
        this.postnum = postnum;
        this.address = address;
        this.birthday = birthday;
        this.telephone = telephone;
        this.recognition = recognition;
        this.okDm = okDm;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getMailAddress() {
        return mailAddress;
    }

    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPostnum() {
        return postnum;
    }

    public void setPostnum(String postnum) {
        this.postnum = postnum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getRecognition() {
        return recognition;
    }

    public void setRecognition(String recognition) {
        this.recognition = recognition;
    }

    public boolean getOkDm() {
        return okDm;
    }

    public void setOkDm(boolean b) {
        this.okDm = b;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt1(Date date) {
        this.createdAt = date;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", mailAddress='" + mailAddress + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", postnum='" + postnum + '\'' +
                ", address='" + address + '\'' +
                ", birthday='" + birthday + '\'' +
                ", telephone='" + telephone + '\'' +
                ", recognition='" + recognition + '\'' +
                ", okDm=" + okDm +
                ", createdAt='" + createdAt + '\'' +
                ", updatedAt='" + updatedAt + '\'' +
                '}';
    }

	public void setOkDm1(boolean boolean1) {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	public void setCreatedAt11(Date date) {
		// TODO 自動生成されたメソッド・スタブ
		
	}

	public void setCreatedAt(Date date) {
		// TODO 自動生成されたメソッド・スタブ
		
	}
}
