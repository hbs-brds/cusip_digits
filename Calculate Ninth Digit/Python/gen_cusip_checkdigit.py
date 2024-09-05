"""
Generate Check Digit 
Purpose: Calculate check digit for 8 digit CUSIPs and return 9 digit CUSIPs:  
Input: 
    cusips: a dataframe that contains the relevant CUSIP8 column
Output:
    Returns a dataframe with a new column, CUSIP9, that is the original CUSIP8 
    column with a check-digit appended at the end

Acknowledgments: Thank you Sage Belz for providing us with this code


Repo: https://github.com/hbs-brds/cusip_digits/tree/main
Contact: BRDS (brds@hbs.edu)
"""
import pandas as pd 

# Define function to generate check digit (returns check digit) 
def gen_cusip_checkdigit(cusip):
    val_sum = 0
    digits = cusip.upper()

    # Convert non-numeric digits to values according to their ordinal position in the alphabet plus 9
    # (A=10, B=11,...Z=35) and converting the characters *=36, @=37, #=38.
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ*@#"
    for i in range(len(digits)):
        if digits[i].isdigit():
            val = int(digits[i])
        else:
            val = alphabet.index(digits[i]) + 10

        # Multiply every even digit by 2
        if (i % 2) != 0:
            val *= 2

        # If the result of the multiplication is a two-digit number, add the digits together. (12 = 1 + 2 = 3)
        val = (val % 10) + (val // 10)

        # Get the sum of all values.
        val_sum += val

    # Get the floored value of this operation: (10 - (sum modulo 10)) modulo 10.
    check = (10 - (val_sum % 10)) % 10
    return cusip + str(check)


