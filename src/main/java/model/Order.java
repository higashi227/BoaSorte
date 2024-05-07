package model;

import java.sql.Date;

public class Order {
    private int orderId;
    private int accountId;
    private int itemId;
    private String name;
    private int quantity;
    private int price;
    private int postage;
    private String coffeeStatus;
    private Date createdAt;
    private Date updatedAt;

    public Order(int orderId, int accountId, int itemId, int quantity, int price, int postage, String coffeeStatus, Date createdAt, Date updatedAt) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.price = price;
        this.postage = postage;
        this.coffeeStatus = coffeeStatus;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getAccountId() {
        return accountId;
    }

    public int getItemId() {
        return itemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", accountId=" + accountId +
                ", itemId=" + itemId +
                ", name='" + name + '\'' +
                ", quantity=" + quantity +
                ", price=" + price +
                ", postage=" + postage +
                ", coffeeStatus='" + coffeeStatus + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}