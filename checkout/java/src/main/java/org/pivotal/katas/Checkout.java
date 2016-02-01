package org.pivotal.katas;

import java.util.Map;

public class Checkout {
  private final Map<String, Pricing> rules;

  public Checkout(Map<String, Pricing> rules) {
    this.rules = rules;
  }

  public void scan(String item) {

  }

  public int total() {
    return 0;
  }

  public static class Discount {
    private final int quantity;
    private final int price;

    public Discount(int quantity, int price) {
      this.quantity = quantity;
      this.price = price;
    }
  }

  public static class Pricing {
    private final int price;
    private final Discount discount;

    public Pricing(int price) {
      this(price, null);
    }

    public Pricing(int price, Discount discount) {
      this.price = price;
      this.discount = discount;
    }
  }
}