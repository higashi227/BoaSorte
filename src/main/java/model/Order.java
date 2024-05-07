package model;

import java.sql.Date;

public class Order {
    private int orderId;
    private int accountId;
    private int itemId;
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

    public int getQuantity() {
        return quantity;
    }

    public int getPrice() {
        return price;
    }

    public int getPostage() {
        return postage;
    }

    public String getCoffeeStatus() {
        return coffeeStatus;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }
}