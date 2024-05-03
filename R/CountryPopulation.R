#' Function
#'
#' This function generates a plot of the population estimate for a country
#'
#' @param country Country name as a string
#' @return A line graph showing the population estimates
#' @examples
#' # example code
#' CountryPopulation('United States of America')
#' CountryPopulation('Germany')
#' @export
CountryPopulation <- function(country){

  CountryData <- WorldPopulation %>%
    filter(Country == country)

  if(is.numeric(country)){
    stop('Error: Input is integer not country name')
  }

  if(any(WorldPopulation$Country == country) == FALSE){
    stop('Error: Country was not found in data')
  }


  ggplot(data = CountryData, aes(x=Year, y=Population, group = Country)) +
    geom_line() +
    scale_x_discrete(breaks = seq(1950, 2020, by = 10)) +
    theme_bw() +
    theme(axis.text.x = element_text(angle= 45, hjust= 1)) +
    labs(y = 'Population In Thousands', x = "Years from 1950-2020",
         title = country)

}
