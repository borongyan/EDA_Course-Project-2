# # Step 0: Load & read data
# ## set work directory
  setwd("C:/Users/meng/Desktop/Coursera/EDA_Course-Project-2")
  
# ## Download data file
  file.url <-
          'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'
  file.dest <- 'exdata.zip'
  download.file(file.url, file.dest)
  
# ## Unzip data file
  unzip('exdata.zip',exdir = ".")
