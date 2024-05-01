package model;

public class Item {
    private int itemId;
    private String name;
    private int price;
    private int isCoffee;

    // デフォルトコンストラクタ
    public Item() {
    }

    public Item(int itemId, String name, int price, int isCoffee) {
        this.itemId = itemId;
        this.name = name;
        this.price = price;
        this.isCoffee = isCoffee;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getIsCoffee() {
        return isCoffee;
    }

    public void setIsCoffee(int isCoffee) {
        this.isCoffee = isCoffee;
    }

    // isCoffee フィールドの状態を boolean 型として返すメソッド
    public boolean isCoffeeBoolean() {
        return isCoffee == 1;
    }

    // isCoffee フィールドの状態を boolean 型として設定するメソッド
    public void setIsCoffeeBoolean(boolean coffee) {
        this.isCoffee = coffee ? 1 : 0;
    }

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
