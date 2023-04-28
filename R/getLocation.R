#' A set of function to gather json info
#'
#' @param x Location name or ID
#' @keywords Pokemon
#' @export
#' @name getLocation
#' @return returns a json of data regarding location
#'

library(httr)
library(jsonlite)


getLocation <- function(x){
  tryCatch(
    {
      url <- paste0("https://pokeapi.co/api/v2/location/", tolower(x))
      res = GET(url)
      return(fromJSON(rawToChar(res$content)))
    },
    error = function(err){
      message('Unable to retrive game')
      print(paste0("Error:", err))
    }
  )

}
