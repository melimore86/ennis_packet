library("readxl")
library("plyr")
library("dplyr")
library("lubridate")
library("tidyverse")
library("DBI")
library("RMySQL")
library("rsconnect")
library("lubridate")
library("RMariaDB")
library("stringr")
library("hms")
library("naniar")


lc1l<- read_excel("kaplan_data.xlsx",1)
lc1s<- read_excel("kaplan_data.xlsx",2)
lc2l<- read_excel("kaplan_data.xlsx",3)
lc2s<- read_excel("kaplan_data.xlsx",4)
lc3l<- read_excel("kaplan_data.xlsx",5)
lc3s<- read_excel("kaplan_data.xlsx",6)

kaplan_data<- do.call("rbind", list(lc1l,lc1s,lc2l,lc2s,lc3l,lc3s))

kaplan_data$Date<- as.POSIXct(kaplan_data$Date, format= "%Y-%m-%d %H:%M:%OS")
kaplan_data$Date<- round(kaplan_data$Date, "mins")

write.csv(kaplan_data, "kaplan_data.csv")
