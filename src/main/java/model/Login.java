package model;

public class Login {
    private String mailAddress;
    private String password;

    public Login(String mailAddress, String password) {
        this.mailAddress = mailAddress;
        this.password = password;
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
}
