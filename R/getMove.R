#' A set of function to gather json info
#'
#' @param x Move name or ID
#' @keywords Pokemon
#' @export
#' @name getMove
#' @return returns a json of data regarding provided Pokemon move
#'

library(httr)
library(jsonlite)


getMove <- function(x){
  tryCatch(
    {
      url <- paste0("https://pokeapi.co/api/v2/move/", tolower(x))
      res = GET(url)
      return(fromJSON(rawToChar(res$content)))
    },
    error = function(err){
      message('Unable to retrive move')
      print(paste0("Error:", err))
    }
  )
}

