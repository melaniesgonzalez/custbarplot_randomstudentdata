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