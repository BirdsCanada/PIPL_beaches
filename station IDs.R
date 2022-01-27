library(tidyverse)

#select distance matrix station_by_beach.csv 
#This includes the nearest weather station for each beach polygon
stations<-read.csv(file.choose()) 

#determine the number of unique stations to download data for
stations %>% 
  select(TargetID) %>% 
  unique() %>% 
  count()
# 29 total stations for the 63 beaches

station_list<-stations %>% 
  select(TargetID) %>% 
  unique()

# import station inventory to find the correct station IDs (Station Inventory EN.csv)
#station IDs are needed for homebrew/automated download of the data
inventory<-read.csv(file.choose(), skip = 2) #first 2 rows are not column names

ID_list<-inventory %>% 
  filter(Name %in% station_list$TargetID) %>% 
  select(1,4) #gives 34 stations because of duplicate names
