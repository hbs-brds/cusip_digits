# Sample Code for running generate_check_digit.py 
# 
# Script that uses the function generate generate_check_digit.py
# 
# 
# Contact: BRDS (brds@hbs.edu)
# Repo: https://github.com/hbs-brds/cusip_digits
# Website: https://www.library.hbs.edu/baker-research-data-services

# Load required library
library(dplyr)

# Load the generate_check_digit.R script
source("gen_cusip_checkdigit.R")

# Define dataframe with 8 digit CUSIPs 
cusips_example_data <- data.frame(
  Company = c('Apple', 'Alphabet', 'Alaska Air Group', 'Walmart'),
  CUSIP8 = c('03783310', '02079K10', '01165910', '93114210')
)

# Generate 9 digit CUSIPs in new column using generate_check_digit.R 
cusips_example_data$CUSIP9 <- gen_cusip_checkdigit(cusips_example_data$CUSIP8)

# See results
print(cusips_example_data)

