#' A set of function to gather json info
#'
#' @param x Game name or ID
#' @keywords Pokemon
#' @export
#' @name getGame
#' @return returns a json of data regarding provided Pokemon game
#'

library(httr)
library(jsonlite)


getGame <- function(x){
  tryCatch(
    {
      url <- paste0("https://pokeapi.co/api/v2/version/", tolower(x))
      res = GET(url)
      return(fromJSON(rawToChar(res$content)))
    },
    error = function(err){
      message('Unable to retrive game')
      print(paste0("Error:", err))
    }
  )
}
