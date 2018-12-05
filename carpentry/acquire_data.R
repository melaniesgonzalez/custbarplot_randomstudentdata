#### Load necessary libraries ----
install.packages("devtools")
library(devtools)
install_github("mnetter589/R4BehavSciPackage")
library(R4BehavSciPackage)  # contains dataset
library(readr) # contains write_csv package

#### View help documentation for custom dataset ----
?random_student_data

#### Read in data from package ----
studdata <- R4BehavSciPackage::random_student_data

#### Save cats file as CSV in raw_data folder ----
readr::write_csv(studdata, "raw_data/studdata.csv")

#### Save cats file as RData file at top level of project ----
saveRDS(studdata, "studdata.RData")  # since saved at top level, will load automatically when project opened
