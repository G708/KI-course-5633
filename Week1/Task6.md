Task6
================
Gina Miku Oba
2023-03-07

# Task6 - R Function

## 1. A function that calculates the ratio of the mean and the median of a given vector.

Input of the function is given vector and output of the function is the
ratio of the mean and the median.

$$
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

    ##  [1] 0.09043364 0.56039604 0.55568637 0.96031764 0.51601451 0.55126713
    ##  [7] 0.22929616 0.26628807 0.14052216 0.96067508

``` r
# print mean and median
print(paste("mean:", mean(vector)))
```

    ## [1] "mean: 0.483089677873068"

``` r
print(paste("median:", median(vector)))
```

    ## [1] "median: 0.53364081599284"

``` r
# print ratio of mean and median 
result <- ratio_mean_median(vector)
print(result)
```

    ## [1] 0.9052712

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

    ##  [1] 0.99096315 0.46809563 0.16775805 0.39400477 0.27496038 0.02930822
    ##  [7] 0.53292353 0.23619284 0.38348189 0.69666559

``` r
print(paste("median:", median(vector)))
```

    ## [1] "median: 0.388743326300755"

``` r
# print mean and trim_mean
print(paste("mean:", mean(vector)))
```

    ## [1] "mean: 0.417435403075069"

``` r
print(paste("trim_mean:", trim_mean(vector)))
```

    ## [1] "trim_mean: 0.394260332948761"

The advantage of this trimmed mean is that it is robust to outliers or
the heavy tail data distribution. Try vector with extreme value:

``` r
# Generate a random vector of 10 components, each with a value between 0 and 1.
vector <- runif(9, 0, 1) 
# add extreme value 10
vector <- append(vector, 10)
print(vector)
```

    ##  [1]  0.10519219  0.98352282  0.77933591  0.20712216  0.79607092  0.60857962
    ##  [7]  0.83973060  0.86330618  0.03660586 10.00000000

``` r
print(paste("median:", median(vector)))
```

    ## [1] "median: 0.787703414913267"

``` r
# print mean and trim_mean
print(paste("mean:", mean(vector)))
```

    ## [1] "mean: 1.5219466252951"

``` r
print(paste("trim_mean:", trim_mean(vector)))
```

    ## [1] "trim_mean: 0.647857549454784"

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
