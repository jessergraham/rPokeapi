#' A set of function to gather json info
#'
#' @param x Pokemon name or ID
#' @keywords Pokemon
#' @export
#' @name quickStats
#' @return returns name, weight, height, base xp, moves and locations of a Pokemon
#'

library(httr)
library(jsonlite)


quickStats <- function(x){
  url <- paste0("https://pokeapi.co/api/v2/pokemon/", tolower(x))
  res = GET(url)
  myJson <- fromJSON(rawToChar(res$content))
  print(paste('Name:', myJson$name))
  print(paste('Weight in hg:', myJson$weight))
  print(paste('Height in dm:', myJson$height))
  print(paste('Base XP:', myJson$base_experience))
  print(paste('Moves:', myJson$moves$move$name))
  abilities <- data.frame(myJson$abilities$ability$name)
  colnames(abilities) <- 'Ability'
  print(abilities)
  tryCatch(
      {
        encounters <- fromJSON(rawToChar(GET(myJson$location_area_encounters)$content))
        locationDF <- data.frame(encounters$location_area$name)
        colnames(locationDF) <- 'Location'
        print(locationDF)
        },
      error = function(err){
        message('No locations were found for this Pokemon')
        }
      )
}


