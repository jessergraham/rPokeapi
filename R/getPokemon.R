#' A set of function to gather json info
#'
#' @param x Pokemon name or ID
#' @keywords Pokemon
#' @export
#' @name getPokemon
#' @return returns a json of Pokemon data
#'

library(httr)
library(jsonlite)


getPokemon <- function(x){
  tryCatch(
    {
      url <- paste0("https://pokeapi.co/api/v2/pokemon/", tolower(x))
      res = GET(url)
      return(fromJSON(rawToChar(res$content)))
    },
    error = function(err){
      message('Unable to retrive Pokemon')
      print(paste0("Error:", err))
    }
  )

}
