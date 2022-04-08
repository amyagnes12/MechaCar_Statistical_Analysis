#Deliverable 1 Linear Regression to predict MPG
library(dplyr)
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv', stringsAsFactors=F)
head(MechaCar_mpg)
lm(mpg  ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)
summary(lm(mpg  ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

#Deliverable 2: create visualizations for the trip analysis
library(tidyverse)
Suspension_Coil <- read.csv(file='Suspension_Coil.csv', stringsAsFactors=F)
head(Suspension_Coil)
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary <- Suspension_Coil %>% group_by (Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#Deliverable 3: T-Tests on suspension coils
#if the PSI across all manufacturing lots is statistically different from the population mean of 1,500
t.test(Suspension_Coil$PSI, mu= 1500)
#if the PSI for each manufacturing lot is statistically different from the population mean of 1,500
t.test(subset(Suspension_Coil, Manufacturing_Lot == "Lot1")$PSI, mu= 1500)
t.test(subset(Suspension_Coil, Manufacturing_Lot == "Lot2")$PSI, mu= 1500)
t.test(subset(Suspension_Coil, Manufacturing_Lot == "Lot3")$PSI, mu= 1500)