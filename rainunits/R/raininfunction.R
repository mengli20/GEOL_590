
#' This function allows you to take met station data and convert it from mm to in.
#'
#' @param x  a dataframe with one column of daily rainfall in units (mm)
#' @return Rainfall data in units (in)
#' @export

rainin <- function(x) {
  z<- x/25.4
  return (z)
}


