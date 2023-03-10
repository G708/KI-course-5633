Task4
================
Gina Miku Oba
2023-03-06

# Task4 - R basic Operations

## 1. What is the square root of 10?

``` r
help(sqrt)
```

`sqrt(x)` is function to compute the square root of x.

``` r
sqrt(10)
```

    ## [1] 3.162278

The answer is 3.162278.

## 2. What is the logarithm of 32 to the base 2?

``` r
help(log)
```

`log(x, b)` is function of computing logarithms of `x` to the base `b`.
And `log2(x)` is to compute logarithms with base 2.

``` r
log2(32)
```

    ## [1] 5

The answer is 5.

## 3. What is the sum of the numbers from 1 to 1000?

It is hard to sum sequence of 1 to 1000 by hand, but computer can!

``` r
# create a sequence of 1 to 1000
sum(seq(1, 1000))
```

    ## [1] 500500

Also, we can compute it using mathematical formula.

``` r
# apply formula of gaussian sum
(1+1000)*1000/2
```

    ## [1] 500500

The answer is both 500500.

## 4. What is the sum of all even numbers from 2 to 1000?

``` r
help(seq)
```

We can create customized sequences using `seq()` function. Important
arguments of the function are `from`, `to` and `by`. `from` defines
start number, and `to` defines end values of the sequence. `by` defines
increment of sequence.

``` r
# Create sequence even numbers from 2 to 1000
# Show first 5
seq(2, 1000, by = 2)[0:5]
```

    ## [1]  2  4  6  8 10

``` r
# sum sequence of even numbers from 2 to 1000
sum(seq(2, 1000, by = 2))
```

    ## [1] 250500

The answer is 250500.

## 5. How many pairwise comparisons are there for 100 genes?

Number of pairwise comparisons of 100 gene is

$$
{}_{100} \mathrm{C}_2 = \frac{100!}{2!(100-2)!}
$$

It not consider order of the pair gene. R has function `choose(n,k)` to
compute n choose x.

``` r
choose(100,2)
```

    ## [1] 4950

The answer is 4950.

## 6. And how many ways to arrange 100 genes in triples?

A, B, C and C, B, A are different for counting the arrangement of 100
genes into triples. Number of the arrangement of 100 genes is

$$
{}_{100} \mathrm{P}_3 = \frac{100!}{(100-3)!} = {}_{100} \mathrm{C}_2 \times 3!
$$

`factorial(x)` is function to compute x!.

``` r
n <- 100
k <-3
choose(n,k) * factorial(k)
```

    ## [1] 970200

The answer is 970200.
