package model;

public class CartItem {
    private int itemId;
    private String name;
    private int price;
    private int quantity;
    private int isCoffee;
    private String coffeeStatus;

    public CartItem(int itemId, String name, int price, int quantity, int isCoffee, String coffeeStatus) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.isCoffee = isCoffee;
        this.coffeeStatus = coffeeStatus;
    }

    public int getItemId() {
        return itemId;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIsCoffee() {
        return isCoffee;
    }

    public String getCoffeeStatus() {
        return coffeeStatus;
    }

    public void setCoffeeStatus(String coffeeStatus) {
        this.coffeeStatus = coffeeStatus;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "itemId=" + itemId +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", isCoffee=" + isCoffee +
                ", coffeeStatus='" + coffeeStatus + '\'' +
                '}';
    }
}