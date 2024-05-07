package model;

public class Cart {
    private int cartId;
    private int accountId;
    private int itemId;
    private int quantity;
    private String coffeeStatus;
    
    // Constructor
    public Cart(int cartId, int accountId, int itemId, int quantity, String coffeeStatus) {
        this.cartId = cartId;
        this.accountId = accountId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.coffeeStatus = coffeeStatus;
    }

    // Getters and Setters
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public String getCoffeeStatus() {
        return coffeeStatus;
    }

    public void setCoffeeStatus(String coffeeStatus) {
        this.coffeeStatus = coffeeStatus;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", accountId=" + accountId +
                ", itemId=" + itemId +
                ", quantity=" + quantity +
                ", coffeeStatus='" + coffeeStatus + '\'' +
                '}';
    }
}