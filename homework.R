#PSYC 259 Homework 1 - Data Import
#For full credit, provide answers for at least 6/8 questions

#List names of students collaborating with (no more than 2): 
only ME - Mohammad Dastgheib
#GENERAL INFO 
#data_A contains 12 files of data. 
#Each file (6192_3.txt) notes the participant (6192) and block number (3)
#The header contains metadata about the session
#The remaining rows contain 4 columns, one for each of 20 trials:
#trial_number, speed_actual, speed_response, correct
#Speed actual was whether the figure on the screen was actually moving faster/slower
#Speed response was what the participant report
#Correct is whether their response matched the actual speed

### QUESTION 1 ------ 

# Load the readr package

# ANSWER
library(readr)

### QUESTION 2 ----- 

# Read in the data for 6191_1.txt and store it to a variable called ds1
# Ignore the header information, and just import the 20 trials
# Be sure to look at the format of the file to determine what read_* function to use
# And what arguments might be needed

# ds1 should look like this:

# # A tibble: 20 × 4
#  trial_num    speed_actual speed_response correct
#   <dbl>       <chr>        <chr>          <lgl>  
#     1          fas          slower         FALSE  
#     2          fas          faster         TRUE   
#     3          fas          faster         TRUE   
#     4          fas          slower         FALSE  
#     5          fas          faster         TRUE   
#     6          slo          slower         TRUE
# etc..

# A list of column names are provided to use:

col_names  <-  c("trial_num","speed_actual","speed_response","correct")

# ANSWER
ds1 <- read_table("data_A/6191_1.txt", col_names = col_names, skip = 7) 

### QUESTION 3 ----- 

# For some reason, the trial numbers for this experiment should start at 100
# Create a new column in ds1 that takes trial_num and adds 100
# Then write the new data to a CSV file in the "data_cleaned" folder

# ANSWER
ds1 <- ds1 %>% add_column(trial_num_new = ds1$trial_num+100)
write_csv(ds1, file = "data_cleaned/6191_1.csv")

### QUESTION 4 ----- 

# Use list.files() to get a list of the full file names of everything in "data_A"
# Store it to a variable

# ANSWER
list_data_A <- list.files("data_A")

### QUESTION 5 ----- 

# Read all of the files in data_A into a single tibble called ds

# ANSWER
library(dplyr)
full_file_names <- dir('data_A', full.names = TRUE)
ds <- read_table(full_file_names)

### QUESTION 6 -----

# Try creating the "add 100" to the trial number variable again
# There's an error! Take a look at 6191_5.txt to see why.
# Use the col_types argument to force trial number to be an integer "i"
# You might need to check ?read_tsv to see what options to use for the columns
# trial_num should be integer, speed_actual and speed_response should be character, and correct should be logical
# After fixing it, create the column to add 100 to the trial numbers 
# (It should work now, but you'll see a warning because of the erroneous data point)

# ANSWER
ds1 <- read_table("data_A/6191_1.txt", col_names = col_names, skip = 7) 
ds2 <- read_table("data_A/6191_2.txt", col_names = col_names, skip = 7) 
ds3 <- read_table("data_A/6191_3.txt", col_names = col_names, skip = 7) 
ds4 <- read_table("data_A/6191_4.txt", col_names = col_names, skip = 7) 
ds5 <- read_table("data_A/6191_5.txt", col_names = col_names, skip = 7) 
ds6 <- read_table("data_A/6191_6.txt", col_names = col_names, skip = 7) 
ds7 <- read_table("data_A/6192_1.txt", col_names = col_names, skip = 7) 
ds8 <- read_table("data_A/6192_2.txt", col_names = col_names, skip = 7) 
ds9 <- read_table("data_A/6192_3.txt", col_names = col_names, skip = 7) 
ds10 <- read_table("data_A/6192_4.txt", col_names = col_names, skip = 7) 
ds11 <- read_table("data_A/6192_5.txt", col_names = col_names, skip = 7) 
ds12 <- read_table("data_A/6192_6.txt", col_names = col_names, skip = 7) 
ds <- bind_rows(ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds9,ds10,ds11,ds12)
#fixing the column type:
coltypes <- "iccl"
ds5 <- read_table("data_A/6191_5.txt", col_names = col_names, skip = 7, col_types = coltypes)
ds <- bind_rows(ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds9,ds10,ds11,ds12)

library(tidyverse)
ds <- ds %>% add_column(trial_num_new = ds$trial_num+100)

### QUESTION 7 -----

# Now that the column type problem is fixed, take a look at ds
# We're missing some important information (which participant/block each set of trials comes from)
# Read the help file for read_tsv to use the "id" argument to capture that information in the file
# Re-import the data so that filename becomes a column

# ANSWER
print(ds)

ds1 <- read_tsv("data_A/6191_1.txt", col_names = col_names, skip = 7, id="path") 
ds2 <- read_tsv("data_A/6191_2.txt", col_names = col_names, skip = 7, id="path") 
ds3 <- read_tsv("data_A/6191_3.txt", col_names = col_names, skip = 7, id="path") 
ds4 <- read_tsv("data_A/6191_4.txt", col_names = col_names, skip = 7, id="path") 
ds5 <- read_tsv("data_A/6191_5.txt", col_names = col_names, skip = 7, col_types = coltypes, id="path") 
ds6 <- read_tsv("data_A/6191_6.txt", col_names = col_names, skip = 7, id="path") 
ds7 <- read_tsv("data_A/6192_1.txt", col_names = col_names, skip = 7, id="path") 
ds8 <- read_tsv("data_A/6192_2.txt", col_names = col_names, skip = 7, id="path") 
ds9 <- read_tsv("data_A/6192_3.txt", col_names = col_names, skip = 7, id="path") 
ds10 <- read_tsv("data_A/6192_4.txt", col_names = col_names, skip = 7, id="path") 
ds11 <- read_tsv("data_A/6192_5.txt", col_names = col_names, skip = 7, id="path") 
ds12 <- read_tsv("data_A/6192_6.txt", col_names = col_names, skip = 7, id="path") 
ds <- bind_rows(ds1,ds2,ds3,ds4,ds5,ds6,ds7,ds8,ds9,ds10,ds11,ds12)

### QUESTION 8 -----

# Your PI emailed you an Excel file with the list of participant info 
# Install the readxl package, load it, and use it to read in the .xlsx data in data_B
# There are two sheets of data -- import each one into a new tibble

# ANSWER
install.packages("readxl")
library(readxl)

participant_tibble <- read_excel("data_B/participant_info.xlsx", sheet = "participant")
testdate_tibble <- read_excel("data_B/participant_info.xlsx", sheet = "testdate")


