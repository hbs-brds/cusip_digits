# Generate Check Digit 
# Purpose: Calculate check digit for 8 digit CUSIPs and return 9 digit CUSIPs: 
# Input: 
#     CUSIP8: Column in a dataframe that contains the CUSIP-8 codes 
#
# Output:
#     Returns a dataframe with a new column, CUSIP9, that is the original CUSIP8 
#     column with a check-digit appended at the end
#
# Contact: BRDS (brds@hbs.edu)
# Repo: https://github.com/hbs-brds/cusip_digits
# Website: https://www.library.hbs.edu/baker-research-data-services


# Define Function 
gen_cusip_checkdigit <- function(CUSIP8) { 

  #Loop through each row of the dataframe
  CUSIP9 <- NA
  for (i in 1:length(CUSIP8)) {
    ## Extract row of dataframe
    x <- CUSIP8[i]
    ## Split string into individual characters
    xlist <- as.list(strsplit(x, "")[[1]])
    
    
    ## Convert special characters 
    xlist2 <- gsub("\\*","36", xlist)
    xlist2 <- gsub("@","37", xlist2)
    xlist2 <- gsub("#","38", xlist2) 
    
    ## Convert letters to numeric 
    xlist2 <- as.numeric(ifelse(grepl("[A-Z]", xlist2), match(xlist2, LETTERS) + 9, xlist2))
    
    
    ## Double every other number
    xlist3 <- xlist2
    xlist3[2] <- xlist3[2]*2
    xlist3[4] <- xlist3[4]*2
    xlist3[6] <- xlist3[6]*2
    xlist3[8] <- xlist3[8]*2
    xlist4 <- xlist3
    
    
    ## Loop through each element in the CUSIP
    for (j in 1:8) {
      ## Sum digits for characters greater than 10
      if (xlist3[j] > 9) {
        
        xlist4[j] = floor(xlist3[j]/10) + (xlist3[j] %% 10)
      } 
    }
    
    
    ## Sum values and calculate check digit 
    xlistsum <- sum(xlist4)
    checkdigit <- floor((10 - (xlistsum %% 10)) %% 10)
    
    
    ## Add final check digit to original CUSIP. 
    CUSIP9[i] <- paste0(x,checkdigit)  
  }  
    ## Return 9 digit CUSIPs
    return(CUSIP9)
  
}