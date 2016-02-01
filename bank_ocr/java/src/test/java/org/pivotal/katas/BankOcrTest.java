package org.pivotal.katas;

import org.junit.Test;

import static org.junit.Assert.*;

public class BankOcrTest {
  @Test
  public void test_parsesWhenTheAccountIsValid() throws Exception {
    String num = "  _  _     _  _  _  _  _ \n" +
                 "| _| _||_||_ |_   ||_||_|\n" +
                 "||_  _|  | _||_|  ||_| _|\n";
    BankOcr ocr = new BankOcr(num);
    assertEquals("123456789", ocr.accountNumber());
  }

  @Test
  public void test_parsesWhenTheAccountHasOneValidAlternative() throws Exception {
    String num = " _     _  _  _  _  _  _  _ \n" +
                 " _||_||_ |_||_| _||_||_ |_ \n" +
                 " _   | _||_||_||_ |_||_| _|\n";
    BankOcr ocr = new BankOcr(num);
    assertEquals("345882865", ocr.accountNumber());
  }

  @Test
  public void test_appendsIllegalStatusIfNoAlternatives() throws Exception {
    String num = "                           \n"+
                 "|_||_||_||_||_||_||_||_||_|\n"+
                 "  |  |  |  |  |  |  |  |  |\n";
    BankOcr ocr = new BankOcr(num);
    assertEquals("444444444 ILL", ocr.accountNumber());
  }

  @Test
  public void test_appendsIllegalStatusIfAccountIsNotParsable() throws Exception {
    String num = " _  _  _     _  _  _  _  _ \n" +
                 " _  _| _||_||_ |_   ||_||_|\n" +
                 " _ |_  _|  | _||_|  ||_| _|\n";
    BankOcr ocr = new BankOcr(num);
    assertEquals("?23456789 ILL", ocr.accountNumber());
  }

  @Test
  public void test_appendsAmbiguityStatusIfAccountHasMultipleInterpretations() throws Exception {
    String num = "    _  _  _  _  _  _     _ \n"+
                 "|_||_|| || ||_   |  |  ||_ \n"+
                 "  | _||_||_||_|  |  |  | _|\n";
    BankOcr ocr = new BankOcr(num);
    String accountNumber = ocr.accountNumber();
    assertTrue("Account number should be parsed as '490067715' and marked ambiguous", accountNumber.startsWith("490067715 AMB"));
    assertTrue("Account number should list '490067115' as a possibility", accountNumber.contains("490067115"));
    assertTrue("Account number should list '490067719' as a possibility", accountNumber.contains("490067719"));
    assertTrue("Account number should list '490867715' as a possibility", accountNumber.contains("490867715"));
  }
}