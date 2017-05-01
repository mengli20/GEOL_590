Task 8
================
Marie English
March 20, 2017

Function 1
----------

Create a function that adds two user specified columns together.

``` r
Column_summer3 <- function(df, new_col_name, column1, column2) {
  if (is.data.frame(df)== FALSE) {
   warning ("Input is not a dataframe")} #Ensure that input is a dataframe or a warning is issued
  
  mutate_call <- lazyeval::interp(~ a + b, a = as.name (column1), b = as.name (column2))
  df %>% mutate_(.dots = setNames(list(mutate_call), new_col_name))
  }
  
#Test the function:
Column_summer3(mtcars, 'wtmpg', 'mpg', 'wt')
```

    ##     mpg cyl  disp  hp drat    wt  qsec vs am gear carb  wtmpg
    ## 1  21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4 23.620
    ## 2  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4 23.875
    ## 3  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1 25.120
    ## 4  21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1 24.615
    ## 5  18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2 22.140
    ## 6  18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1 21.560
    ## 7  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4 17.870
    ## 8  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2 27.590
    ## 9  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2 25.950
    ## 10 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4 22.640
    ## 11 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4 21.240
    ## 12 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3 20.470
    ## 13 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3 21.030
    ## 14 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3 18.980
    ## 15 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4 15.650
    ## 16 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4 15.824
    ## 17 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4 20.045
    ## 18 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1 34.600
    ## 19 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2 32.015
    ## 20 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1 35.735
    ## 21 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1 23.965
    ## 22 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2 19.020
    ## 23 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2 18.635
    ## 24 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4 17.140
    ## 25 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2 23.045
    ## 26 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1 29.235
    ## 27 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2 28.140
    ## 28 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2 31.913
    ## 29 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4 18.970
    ## 30 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6 22.470
    ## 31 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8 18.570
    ## 32 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2 24.180

Function 2
----------

Create a for loop similar to the sum function. Compare the function to the sum () function in base R.

``` r
 my_sum <- function(x) {
    total <- 0 
    n<- length (x)
    for (i in 1:n) { 
      total = total +x[i]
    }
  total
    }
  
#testing the function
  myvec<- c(1,2,3,4,5)
  my_sum(myvec)
```

    ## [1] 15

``` r
#Comparison of the function we created to the existing sum function 
  test.vec <- 1:10^4
  microbenchmark::microbenchmark(
  my_sum(test.vec),
  sum(test.vec))
```

    ## Unit: microseconds
    ##              expr      min       lq       mean   median       uq      max
    ##  my_sum(test.vec) 3653.409 3957.487 4863.09315 4335.382 5182.386 9344.034
    ##     sum(test.vec)   11.379   11.495   15.93883   14.530   17.032   30.890
    ##  neval cld
    ##    100   b
    ##    100  a

The microbenchmark results show that the sum function in base R is much faster than the loop that can be created to execute the same function (my\_sum).
