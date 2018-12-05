library(R4BehavSciPackage)
library(ggplot2)
math_items <- readr::read_csv("clean_data/math_items.csv")

#### Get count of each response to math items
table(math_items$math_motivation)  # on 5-point Likert scale from not at all to extremely
table(math_items$avg_perceived_math_meaning)  # on 7-point Likert scale from strongly disagree to strongly agree, with decimals

?custbarplot


custbarplot(data = math_items, xvar = math_motivation, scalepoints = 5, decimals = FALSE, scale = "Quant")

mathmotplot <- custbarplot(data = math_items, xvar = math_motivation, scalepoints = 5, decimals = FALSE, scale = "Quant") +
  geom_col(color = "black", fill = "light blue") +
  labs(title = "Counts and Percentages of Responses to Math Motivation Item", 
       subtitle = "Over the last two weeks, how motivated have you felt to learn math?")

ggsave("images/fig1.png", mathmotplot, height = 5, width = 5)


custbarplot(data = math_items, xvar = avg_perceived_math_meaning, scalepoints = 7, decimals = TRUE, scale = "Agree")

mathmeaningplot <- custbarplot(data = math_items, xvar = avg_perceived_math_meaning, scalepoints = 7, decimals = TRUE, scale = "Agree") + 
  geom_col(color = "black", fill = "light blue") +
  labs(title = "Counts and Percentages of Responses to Meaningfulness of Math Items", 
       subtitle = "This week, my math teacher helped me identify a meaningful reason to learn math.")

ggsave("images/fig2.png", mathmeaningplot, height = 5, width = 5)

  