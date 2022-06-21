library(dplyr)
library(readr)
library(haven)
# Download data from https://mail.google.com/mail/u/0/#inbox/FMfcgzGpGBBmDmMkfJVmQkhJMPbJNCxJ

# Read in csv data files
files <- dir('data', recursive = TRUE, pattern = '.csv')
out_list <- list()
for(i in 1:length(files)){
  this_file <- paste0('data/', files[i])
  out_list[[i]] <- read_csv(this_file)
}
# Combine data files
ludo <- bind_rows(out_list)

# Read in spss data files
files <- dir('data', recursive = TRUE, pattern = '.sav')
out_list <- list()
for(i in 1:length(files)){
  this_file <- paste0('data/', files[i])
  out_list[[i]] <- read_sav(this_file)
}
# Combine data files
savs <- bind_rows(out_list)

sjPlot::view_df(savs,
                show.frq = TRUE,
                show.prc = TRUE)

