#' A set of function to gather json info
#' @name comparePokemon
#' @param x First Pokemon name or ID
#' @param y Second Pokemon name or ID
#' @keywords Pokemon
#' @export
#' @return returns name, weight, height, base xp, moves and locations of a Pokemon
#'

library(httr)
library(jsonlite)

comparePokemon <- function(x, y){
  tryCatch(
    {
      first <- GET(paste0("https://pokeapi.co/api/v2/pokemon/", tolower(x)))
      second <- GET(paste0("https://pokeapi.co/api/v2/pokemon/", tolower(y)))
      firstData <- fromJSON(rawToChar(first$content))
      secData <- fromJSON(rawToChar(second$content))
      firstRow <- c(firstData$name, firstData$base_experience, firstData$height, firstData$weight,
                    length(firstData$moves$move$name))
      secondRow <- c(secData$name, secData$base_experience, secData$height, secData$weight,
                     length(secData$moves$move$name))
      df <- data.frame(firstRow, secondRow)
      rownames(df) <- c('Pokemon', 'Base XP', 'Height in dm', 'Weight in hg', "# of Moves")
      print(df)
    },
      error = function(err){
        message('Unable to compare Pokemon')
        print(paste0("Error:", err))
      }
  )

}
