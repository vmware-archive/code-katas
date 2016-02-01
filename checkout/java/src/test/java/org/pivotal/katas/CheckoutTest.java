package org.pivotal.katas;

import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.assertEquals;

public class CheckoutTest {
  private static final Map<String, Checkout.Pricing> RULES = new HashMap<String, Checkout.Pricing>() {{
    put("A", new Checkout.Pricing(50, new Checkout.Discount(3, 130)));
    put("B", new Checkout.Pricing(30, new Checkout.Discount(2, 45)));
    put("C", new Checkout.Pricing(20));
    put("D", new Checkout.Pricing(15));
  }};

  private int priceOf(String goods) {
    Checkout checkout = new Checkout(RULES);
    for(String item : goods.split("")) {
      checkout.scan(item);
    }
    return checkout.total();
  }

  @Test
  public void test_calculatesTotalsCorrectly() throws Exception {
    assertEquals(0, priceOf(""));
    assertEquals(50, priceOf("A"));
    assertEquals(80, priceOf("AB"));
    assertEquals(115, priceOf("CDBA"));

    assertEquals(100, priceOf("AA"));
    assertEquals(130, priceOf("AAA"));
    assertEquals(180, priceOf("AAAA"));
    assertEquals(230, priceOf("AAAAA"));
    assertEquals(260, priceOf("AAAAAA"));

    assertEquals(160, priceOf("AAAB"));
    assertEquals(175, priceOf("AAABB"));
    assertEquals(190, priceOf("AAABBD"));
    assertEquals(190, priceOf("DABABA"));
  }

  @Test
  public void test_calculatesTotalsIncrementally() throws Exception {
    Checkout checkout = new Checkout(RULES);
    assertEquals(0, checkout.total());
    checkout.scan("A"); assertEquals(50, checkout.total());
    checkout.scan("B"); assertEquals(80, checkout.total());
    checkout.scan("A"); assertEquals(130, checkout.total());
    checkout.scan("A"); assertEquals(160, checkout.total());
    checkout.scan("B"); assertEquals(175, checkout.total());
  }
}