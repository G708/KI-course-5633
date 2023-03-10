Task6
================
Gina Miku Oba
2023-03-07

# Task6 - R Function

## 1. A function that calculates the ratio of the mean and the median of a given vector.

Input of the function is given vector and output of the function is the
ratio of the mean and the median. $$
f(x) = \frac{mean(x)}{median(x)} \\
\text{where, }x = \{x_1, x_2, ..., x_n\}
$$

``` r
ratio_mean_median <- function(x){
  return(mean(x) / median(x))
  }
```

Try test on random vector:

``` r
# Generate a random vector of 10 components, each with a value between 0 and 1.
vector <- runif(10, 0, 1) 
print(vector)
```

    ##  [1] 0.69528372 0.97081159 0.72033951 0.95534629 0.27936788 0.72894444
    ##  [7] 0.43696733 0.13007022 0.14434471 0.05637758

``` r
# print mean and median
print(paste("mean:", mean(vector)))
```

    ## [1] "mean: 0.511785328621045"

``` r
print(paste("median:", median(vector)))
```

    ## [1] "median: 0.566125528072007"

``` r
# print ratio of mean and median 
result <- ratio_mean_median(vector)
print(result)
```

    ## [1] 0.9040139

``` r
# print if function works fine
if (result == mean(vector)/median(vector)){
  print("Function works well")
}else{
  print("Function not works")
}
```

    ## [1] "Function works well"

## 2. A function that ignore the lowest and the hightest value from given vector and calculate the mean.

The input to the function is a vector. The output of the function is
mean. The lowest value in the function is searched for with min() and
the highest value with max().

``` r
trim_mean <- function(x){
  min <- min(x)
  max <- max(x)
  # remove min and max from given vector using subset().
  trimmed <- subset(x, x != min & x != max)
  return(mean(trimmed))
}
```

Try test:

``` r
# Generate a random vector of 10 components, each with a value between 0 and 1.
vector <- runif(10, 0, 1) 
print(vector)
```

    ##  [1] 0.44238432 0.67333230 0.16618733 0.79236806 0.74682731 0.05275395
    ##  [7] 0.57973204 0.59655261 0.55482136 0.89286302

``` r
print(paste("median:", median(vector)))
```

    ## [1] "median: 0.58814232761506"

``` r
# print mean and trim_mean
print(paste("mean:", mean(vector)))
```

    ## [1] "mean: 0.549782230798155"

``` r
print(paste("trim_mean:", trim_mean(vector)))
```

    ## [1] "trim_mean: 0.569025667384267"

The advantage of this trimmed mean is that it is robust to outliers or
the heavy tail data distribution. Try vector with extreme value:

``` r
# Generate a random vector of 10 components, each with a value between 0 and 1.
vector <- runif(9, 0, 1) 
# add extreme value 10
vector <- append(vector, 10)
print(vector)
```

    ##  [1]  0.78708000  0.34745111  0.51816333  0.19856377  0.27578365  0.78428501
    ##  [7]  0.01558995  0.69500849  0.93741776 10.00000000

``` r
print(paste("median:", median(vector)))
```

    ## [1] "median: 0.606585909961723"

``` r
# print mean and trim_mean
print(paste("mean:", mean(vector)))
```

    ## [1] "mean: 1.45593430711888"

``` r
print(paste("trim_mean:", trim_mean(vector)))
```

    ## [1] "trim_mean: 0.567969140218338"

By trimming the highest and lowest values, the trimmed mean was closer
to the median.

## 3. Explanation of piping usase

Write a short (max. 300 characters, no spaces) explanation of why, how,
and when not to use pipes.

Pipes chain functions together and improve code readability. However,
longer chains (\> 10) can complicate code and should be avoided. Pipes
overwrite intermediate objects, making them unsuitable for functions
with multiple inputs/outputs. Additionally, pipes have limitations for
functions with complex dependencies since they operate linearly.

## 4. Explanation of apply-family function

Write a short explanation (max. 300 characters, no spaces) of why they
could be useful in your work.

The Apply family of functions is useful for applying a function to
entire dataset. Loops can create a deep hierarchy, making code difficult
to read. Apply-functions can simplify code by reducing loops. They are
crucial when analyzing large dataset such as gene expression matrices,
streamlining the process and ensuring consistent results.
