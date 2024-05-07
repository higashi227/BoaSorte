package model;

public class Cart {
    private int cartId;
    private int accountId;
    private int itemId;
    private int quantity;
    
    // Constructor
    public Cart(int cartId, int accountId, int itemId, int quantity) {
        this.cartId = cartId;
        this.accountId = accountId;
        this.itemId = itemId;
        this.quantity = quantity;
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
    
    // オブジェクト情報を文字列で表示するためのtoStringメソッド
    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", accountId=" + accountId +
                ", itemId=" + itemId +
                ", quantity=" + quantity +
                '}';
    }
}