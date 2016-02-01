package org.pivotal.katas;

import org.junit.Test;

import static org.junit.Assert.*;

public class BowlingTest {
  @Test
  public void test_correctlyCalculatesAnAllZerosGame() throws Exception {
    Bowling game = new Bowling();

    for(int i = 0; i < 9; i++) {
      game.roll(0);
      game.roll(0);
    }

    game.roll(0);
    game.roll(0);
    assertEquals(0, game.score());
  }

  @Test
  public void test_correctlyCalculatesAnAllOnesGame() throws Exception {
    Bowling game = new Bowling();

    for(int i = 0; i < 9; i++) {
      game.roll(1);
      game.roll(1);
    }

    game.roll(1);
    game.roll(1);
    assertEquals(20, game.score());
  }

  @Test
  public void test_correctlyCalculatesOneSpare() throws Exception {
    Bowling game = new Bowling();
    game.roll(3);
    game.roll(7);
    game.roll(6);
    assertEquals((7 + 3 + 6) + (6), game.score());
  }

  @Test
  public void test_correctlyCalculatesOneStrike() throws Exception {
    Bowling game = new Bowling();
    game.roll(10);
    game.roll(7);
    game.roll(1);
    assertEquals((10 + 7 + 1) + (7 + 1), game.score());
  }

  @Test
  public void test_correctlyCalculatesAPerfectGame() throws Exception {
    Bowling game = new Bowling();

    for(int i = 0; i < 9; i++) {
      game.roll(10);
    }

    game.roll(10);
    game.roll(10);
    game.roll(10);
    assertEquals(300, game.score());
  }

  @Test
  public void test_correctlyCalculatesAGameOfSpares() throws Exception {
    Bowling game = new Bowling();

    for(int i = 0; i < 9; i++) {
      game.roll(6);
      game.roll(4);
    }

    game.roll(6);
    game.roll(4);
    game.roll(6);
    assertEquals(160, game.score());
  }
}