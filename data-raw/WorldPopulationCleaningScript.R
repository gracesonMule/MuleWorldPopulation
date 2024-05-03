library(tidyverse)
library(readxl)

WorldPopulation <- read_xlsx('data-raw/World_Population.xlsx', sheet = 'ESTIMATES', range = "A17:BZ306",
                             na = c("", "...")) %>%
  filter(Type == 'Country/Area') %>%
  pivot_longer(names_to = "Year", values_to = "Population", cols = '1950':'2020') %>%
  rename(Country = 'Region, subregion, country or area *') %>%
  select(Year, Country, Population)

usethis::use_data(WorldPopulation, overwrite = TRUE)
