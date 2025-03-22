

#Inspecting Data --
# Script to inspect the data (initial EDA)

# packages
library(tidyverse)


# load data
homeless.dta <-  read.csv("data/05b_analysis_file_update.csv", sep = ",")

# add outcome variable
homeless.dta <-  homeless.dta %>% mutate(homlessness_rate = pit_tot_hless_pit_hud / dem_pop_pop_census)


readxl::read_xlsx() # package to read excel files. For example the dictionary for dataset

# load codebooks:
hless_codebook <- readxl::read_xlsx(filename, sheet = 1)
derived_vars_codebook <- readxl::read_xlsx(filename, sheet = 1)

# quick look at data
homeless.dta %>% glimpse()

homeless.dta %>% count(year)

# filter data to 2017 only
homeless2017 <- homeless.dta %>% filter(year == 2017)

# Picking columns to clear non-2017 variables
homeless2017 <- homeless2017 %>% select(-ends_with("_2012"), -ends_with("_2015"))

## tip: don't use the variables that were used to create the homeless rate as predictors.



