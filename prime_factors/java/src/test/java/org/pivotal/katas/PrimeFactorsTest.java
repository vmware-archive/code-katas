package org.pivotal.katas;

import org.junit.Test;

import java.util.Arrays;

import static org.hamcrest.CoreMatchers.*;
import static org.hamcrest.MatcherAssert.assertThat;

public class PrimeFactorsTest {
    @Test
    public void factors_of_one() {
        assertThat(PrimeFactors.generate(1), is(equalTo(Arrays.asList())));
    }

    @Test
    public void factors_of_two() {
        assertThat(PrimeFactors.generate(2), is(equalTo(Arrays.asList(2))));
    }

    @Test
    public void factors_of_three() {
        assertThat(PrimeFactors.generate(3), is(equalTo(Arrays.asList(3))));
    }

    @Test
    public void factors_of_four() {
        assertThat(PrimeFactors.generate(4), is(equalTo(Arrays.asList(2, 2))));
    }

    @Test
    public void factors_of_five() {
        assertThat(PrimeFactors.generate(5), is(equalTo(Arrays.asList(5))));
    }

    @Test
    public void factors_of_six() {
        assertThat(PrimeFactors.generate(6), is(equalTo(Arrays.asList(2, 3))));
    }

    @Test
    public void factors_of_seven() {
        assertThat(PrimeFactors.generate(7), is(equalTo(Arrays.asList(7))));
    }

    @Test
    public void factors_of_eight() {
        assertThat(PrimeFactors.generate(8), is(equalTo(Arrays.asList(2, 2, 2))));
    }

    @Test
    public void factors_of_nine() {
        assertThat(PrimeFactors.generate(9), is(equalTo(Arrays.asList(3, 3))));
    }
}