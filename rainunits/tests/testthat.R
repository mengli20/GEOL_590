library(testthat)
library(rainunits)

test_that("units of in are reported", {
  expect_equal(rainin(101.6), 4)
})



