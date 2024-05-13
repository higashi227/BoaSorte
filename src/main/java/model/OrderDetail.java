package model;

public class OrderDetail {
    private int orderId;
    private int quantity;
    private int price;
    private int postage;
    private String coffeeStatus;
    private java.util.Date createdAt;
    private String itemName;
    private int totalAmount;

    // コンストラクタ
    public OrderDetail(int orderId, int quantity, int price, int postage, String coffeeStatus, java.util.Date createdAt, String itemName, int totalAmount) {
        this.orderId = orderId;
        this.quantity = quantity;
        this.price = price;
        this.postage = postage;
        this.coffeeStatus = coffeeStatus;
        this.createdAt = createdAt;
        this.itemName = itemName;
        this.totalAmount = totalAmount;
    }

    // ゲッターとセッター
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPostage() {
        return postage;
    }

    public void setPostage(int postage) {
        this.postage = postage;
    }

    public String getCoffeeStatus() {
        return coffeeStatus;
    }

    public void setCoffeeStatus(String coffeeStatus) {
        this.coffeeStatus = coffeeStatus;
    }

    public java.util.Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(java.util.Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }
}