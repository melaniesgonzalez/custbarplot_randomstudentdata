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
