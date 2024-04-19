package model;

public class Item {
    private int itemId;
    private String name;
    private int price;
    private boolean isCoffee;

    // コンストラクタ
    public Item(int itemId, String name, int price, boolean isCoffee) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
        this.isCoffee = isCoffee;
    }

    // 商品IDのゲッターとセッター
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    // 商品名のゲッターとセッター
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // 価格のゲッターとセッター
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    // コーヒーかどうかのゲッターとセッター
    public boolean isCoffee() {
        return isCoffee;
    }

    public void setCoffee(boolean coffee) {
        isCoffee = coffee;
    }

    // toStringメソッド（デバッグ用）
    @Override
    public String toString() {
        return "Item{" +
                "itemId=" + itemId +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", isCoffee=" + isCoffee +
                '}';
    }
}
