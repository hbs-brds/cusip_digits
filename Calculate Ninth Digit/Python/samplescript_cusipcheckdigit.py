"""
Sample Code for running gen_cusip_checkdigit

Repo: https://github.com/hbs-brds/cusip_digits/tree/main
Contact: Caracuzzo, Alex acaracuzzo@hbs.edu
"""
# Import 
import pandas as pd
from gen_cusip_checkdigit import gen_cusip_checkdigit #Ensure "gen_cusip_checkdigit.py" is in the same directory as this script

# Define dataframe with 8 digit CUSIPs 
cusips_example_data = {
        'Company': ['Apple', 'Alphabet', "Alaska Air Group", 'Walmart'],
        'CUSIP8': ['03783310', '02079K10', '01165910', '93114210']
}

cusips_example_df = pd.DataFrame(cusips_example_data) 


# Generate 9 digit CUSIPs in new column using generate_check_digit.py 
cusips_example_df['CUSIP9'] = cusips_example_df['CUSIP8'].apply(gen_cusip_checkdigit)

# See results
print(cusips_example_df)

