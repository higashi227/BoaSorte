package model;

public class ItemView {
    private int id;
    private String name;
    private String imagePath;
    private double price;
    private boolean isCoffee;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isCoffee() {
        return isCoffee;
    }

    public void setCoffee(boolean coffee) {
        isCoffee = coffee;
    }
}
