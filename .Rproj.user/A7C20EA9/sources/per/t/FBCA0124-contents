#DATA CARPENTRY

##ACQUIRE DATA

#### Load necessary libraries ----
install.packages("devtools"); library(devtools)
install_github("mnetter589/R4BehavSciPackage"); library(R4BehavSciPackage)  # contains dataset and custom function
library(readr) # contains write_csv package

#### View help documentation for custom dataset ----
?random_student_data

#### Read in data from package ----
studdata <- R4BehavSciPackage::random_student_data

#### Save cats file as CSV in raw_data folder ----
readr::write_csv(studdata, "raw_data/studdata.csv")

#### Save cats file as RData file at top level of project ----
saveRDS(studdata, "studdata.RData")  # since saved at top level, will load automatically when project opened



##GET MATH ITEMS

#### Load necessary libraries ----
library(readr)  # contains read_csv function
library(magrittr)  # contains %>% operator
library(dplyr)  # contains select and contains functions

#### Read in CSV from raw_data folder ----
studdata <- readr::read_csv("raw_data/studdata.csv")

#### Get count of each response to math items ----
table(studdata$math_motivation)  # on Likert scale from not at all to extremely
table(studdata$perceived_math_meaning_week1)  # on Likert scale from strongly disagree to strongly agree
table(studdata$perceived_math_meaning_week2)  # on Likert scale from strongly disagree to strongly agree

#### Keep only math items ----
studdata_math <- studdata %>%
  select(contains("math"))

#### Create average of two math meaning items ----
studdata_math <- studdata_math %>%
  dplyr::rowwise() %>%
  dplyr::mutate(avg_perceived_math_meaning = mean(c(perceived_math_meaning_week1,perceived_math_meaning_week2), na.rm = TRUE))

#### Save studdata_math file as CSV in clean_data folder ----
readr::write_csv(studdata_math, "clean_data/math_items.csv")



#DATA ANALYSIS

##CREATE FIGURES 1 & 2

#### Load necessary libraries ----
library(R4BehavSciPackage)
library(ggplot2)

#### Read in CSV from clean_data folder ----
math_items <- readr::read_csv("clean_data/math_items.csv")

#### Get count of each response to math items ----
table(math_items$math_motivation)  # on 5-point Likert scale from not at all to extremely
table(math_items$avg_perceived_math_meaning)  # on 7-point Likert scale from strongly disagree to strongly agree, with decimals

#### View help documentation for custom function ----
?custbarplot

#### Apply custbarplot() to math_motivation variable ----
custbarplot(data = math_items, xvar = math_motivation, scalepoints = 5, decimals = FALSE, scale = "Quant")

#### Spruce up math motivation plot and save as figure 1 in images folder ----
mathmotplot <- custbarplot(data = math_items, xvar = math_motivation, scalepoints = 5, decimals = FALSE, scale = "Quant") +
  geom_col(color = "black", fill = "light blue") +
  labs(title = "Counts and Percentages of Responses to Math Motivation Item", 
       subtitle = "Over the last two weeks, how motivated have you felt to learn math?")

ggsave("images/fig1.png", mathmotplot, height = 5, width = 5)


#### Apply custbarplot() to math_meaning variable ----
custbarplot(data = math_items, xvar = avg_perceived_math_meaning, scalepoints = 7, decimals = TRUE, scale = "Agree")

#### Spruce up math meaning plot and save as figure 2 in images folder ----
mathmeaningplot <- custbarplot(data = math_items, xvar = avg_perceived_math_meaning, scalepoints = 7, decimals = TRUE, scale = "Agree") + 
  geom_col(color = "black", fill = "light blue") +
  labs(title = "Counts and Percentages of Responses to Meaningfulness of Math Items", 
       subtitle = "This week, my math teacher helped me identify a meaningful reason to learn math.")

ggsave("images/fig2.png", mathmeaningplot, height = 5, width = 5)

  