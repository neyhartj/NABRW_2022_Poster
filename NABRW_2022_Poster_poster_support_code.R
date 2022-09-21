## Poster support code
##
## Generate tables and figures for the poster
##

# Packages to load
library(tidyverse)
library(kableExtra)

# Project directories
proj_dir <- "path/to/project"

# Directories
pheno_dir <- file.path(proj_dir, "Data")
result_dir <- file.path(proj_dir, "Results")
fig_dir <- file.path(getwd(), "poster_code/figures/")


## Dimensions to help with producing figures
units <- "in"
paper_width <- 33 # (inches)
paper_height <- 46

one_col <- 0.3013333 * paper_width
two_col <- 0.6266666 * paper_width
three_col <- 0.9279999 * paper_width





# Table 1 - number of locations, environments, etc. -----------------------

dat <- tibble(Parameter = c("Locations", "Years", "Environments", "Genotypes", "Traits"),
              MississippiValleyNursery = c(20, 25, 175, 401, 19),
              WesternRegionalNursery = c(32, 23, 251, 393, 18))

# Output the table code
dat %>%
  rename_all(neyhart::str_add_space) %>%
  kable(x = ., format = "latex", align = "lcc", booktabs = TRUE) %>%
  kable_styling(full_width = FALSE) %>%
  row_spec(0, bold = TRUE) %>%
  column_spec(1, width = paste0(round(one_col * 0.3, 2), units)) %>%
  column_spec(2, width = paste0(round(one_col * 0.3, 2), units)) %>%
  column_spec(3, width = paste0(round(one_col * 0.3, 2), units))




# Table 2 - optimized location summary ------------------------------------

dat <- tibble(
  Nursery = c("MVN", "WRN"),
  `No. Location to Measure Agro. Traits` = c(5, 5),
  `No. Location to Measure Malt Qual. Traits` = c(2, 3),
  Precision = c(-7.48, 2.98),
  Repeatability = c(33.3, 16.0),
  Representativeness = c(15.0, 8.05)
)

dat %>%
  kable(x = ., format = "latex", align = paste(c("l", rep("c", ncol(dat) - 1)), collapse = ""), booktabs = TRUE) %>%
  kable_styling(full_width = TRUE, font_size = 18) %>%
  row_spec(0, bold = TRUE) %>%
  add_header_above(c(" ", " ", " ", "% Improvement Over Using All Locations" = 3))




# Generate a QR code for the poster GitHub repo ---------------------------

library(qrcode)

url <- "https://github.com/neyhartj/NABRW_2022_Poster"

# Create and save the qr code
png(filename = "figures/github_qr_code.png", width = 3, height = 3, units = "in", res = 300, bg = "transparent")
qrcode_gen(dataString = url)
dev.off()


url <- "https://acsess.onlinelibrary.wiley.com/doi/abs/10.1002/csc2.20657"

# Create and save the qr code
png(filename = "figures/cs_qr_code.png", width = 3, height = 3, units = "in", res = 300, bg = "transparent")
qrcode_gen(dataString = url)
dev.off()









