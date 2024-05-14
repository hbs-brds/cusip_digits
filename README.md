# CUSIPs

## What are CUSIPs?

### Intro

A CUSIP is a 9-character ID that uniquely identifies different financial securities such as stocks or bonds. CUSIPs can contain letters, numbers, and the special characters #, \*, and \@.

The CUSIP 020979K107 is the CUSIP number for an issuance of Capital Stock of Alphabet.

### What a CUSIP Tells Us

The first six digits of a CUSIP indicate the issuer of the stock. For example, any financial security issued by Alphabet will start with the numbers “020979”.

The seventh and eighth digits indicate the type of security. In the CUSIP example above, the “10” signals that the security this CUSIP is referring to is Class C Capital Stock. The CUSIP “020979K305” refers to Class A Common Stock issued by Alphabet.

The ninth digit of a CUSIP is automatically calculated using the first 8 digits . It serves as a check digit to make sure the previous 8 digits were entered correctly.

For more information on CUSIPs see the [CUSIP Global Services website](https://www.cusip.com/identifiers.html#/CUSIP)

### 

## Removing a Digit: 9 to 8 Digits

While some datasets include all 9 digits of a CUSIP, others might omit the 9th check digit. The sections below explain how to remove or add the 9th digit of a CUSIP in R and Excel.

### Removing Digits: Excel

The following formula removes the last digit from a 9 digit CUSIP to turn it into an 8 digit CUSIP. If the first 9-digit CUSIP appears in Cell A2, copy and paste this formula into cell B2.\
The number “1”, indicates how many characters to remove from the end of the value in cell A2. Increasing this number to 3 will modify the 9 digit CUSIP to a 6 digit CUSIP.

`=LEFT(A2, LEN(A2) - 1)`

### Removing Digits: R

The following code creates an example dataframe in R with a 9 digit CUSIP in column “CUSIP9.” It then creates a new column, CUSIP8 without the 9th digit.

``` r
# Create Example CUSIP Data 
cusips <- data.frame(CUSIP9 = c("02079K107"))

# Remove last digit 
cusips <- cusips %>% 
  mutate(CUSIP8 = str_sub(CUSIP9, end=-2))
```

### Removing Digits: Python

The following code creates an example dataframe in Python with a 9 digit CUSIP in column “CUSIP9.” It then creates a new column, CUSIP8 without the 9th digit.

``` python
import pandas as pd

# Create Example CUSIP Data
cusips = pd.DataFrame({"CUSIP9": ["02079K107"]})

# Remove last digit from the CUSIP9 column
cusips["CUSIP8"] = cusips["CUSIP9"].str[:-1]
```

### 

## Adding a Digit: 8 to 9 Digits

### Calculating the Ninth Digit: Excel

The following formula calculates the 9th check-digit of an 8-digit CUSIP ID. If the first 8-digit CUSIP appears in Cell A2, copy and paste this formula into cell B2.

`=LET(cusip8,A2, i, SEQUENCE(LEN( cusip8)), c, MID(cusip8, i, 1), k, CODE(c), isdigit, IF((k>57) + (k<48), FALSE, TRUE), isletter, IF((k>91) + (k<64), FALSE, TRUE), p, CODE(c) - 64, v, IF(isdigit, c, IF(isletter, p+9, IF(c="", 36, IF(c="@", 37, IF(c="#", 38, "ERROR"))))), val, IF(MOD(i, 2)=0, 2v, v), digitsum, INT(val/10) + MOD(val, 10), sum, SUM(digitsum), MOD(10-MOD(sum, 10), 10))`


``` excel
=LET(cusip8,A2, i, SEQUENCE(LEN( cusip8)), c, MID(cusip8, i, 1), k, CODE(c), isdigit, IF((k>57) + (k<48), FALSE, TRUE), isletter, IF((k>91) + (k<64), FALSE, TRUE), p, CODE(c) - 64, v, IF(isdigit, c, IF(isletter, p+9, IF(c="", 36, IF(c="@", 37, IF(c="#", 38, "ERROR"))))), val, IF(MOD(i, 2)=0, 2v, v), digitsum, INT(val/10) + MOD(val, 10), sum, SUM(digitsum), MOD(10-MOD(sum, 10), 10))
```

### Calculating the Ninth Digit: R

[This R code defines a function to calculate the 9th check digit of a CUSIP](https://github.com/hbs-brds/cusip_digits/blob/main/Calculate%20Ninth%20Digit/R/gen_cusip_checkdigit.R).

([See this code for an example of how to use the function](https://github.com/hbs-brds/cusip_digits/blob/main/Calculate%20Ninth%20Digit/R/samplescript_cusipcheckdigit.R))

### Calculating the Ninth Digit: Python

[This Python code defines a function to calculate the 9th check digit of a CUSIP](https://github.com/hbs-brds/cusip_digits/blob/main/Calculate%20Ninth%20Digit/Python/gen_cusip_checkdigit.py).

([See this code for an example of how to use the function](https://github.com/hbs-brds/cusip_digits/blob/main/Calculate%20Ninth%20Digit/Python/samplescript_cusipcheckdigit.py))

### 

## External Links

General information on CUSIPs:

<https://www.cusip.com/identifiers.html#/CUSIP>

<https://en.wikipedia.org/wiki/CUSIP>

More comprehensive sources on CUSIPs, including information on 7^th^-9^th^ digits: [https://web.archive.org/web/20150227093743/https://www.cusip.com/pdf/CUSIP_Intro_03.14.11.pdf](https://web.archive.org/web/20150227093743/https:/www.cusip.com/pdf/CUSIP_Intro_03.14.11.pdf)

<https://www.cusip.com/pdf/news/CUSIP-ACommonLanguageForEfficientMarkets_2022.pdf>
