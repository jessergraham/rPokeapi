#' A set of function to gather json info
#'
#' @param x ability name or ID
#' @keywords Pokemon
#' @export
#' @name getAbilities
#' @return returns a json of data regarding Pokemon abilties
#'

library(httr)
library(jsonlite)


getAbilities <- function(x){
  tryCatch(
    {
      url <- paste0("https://pokeapi.co/api/v2/ability/", tolower(x))
      res = GET(url)
      return(fromJSON(rawToChar(res$content)))
    },
    error = function(err){
      message('Unable to retrove ability')
      print(paste0("Error:", err))
    }
  )
}
