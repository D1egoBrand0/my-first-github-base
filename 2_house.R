library(ggplot2)
library(dplyr)
library(plotly)
library(hrbrthemes)

train <- read.csv('C:/HDH/my-first-github-base/house/train.csv')


df <- train
df <- mutate_all(df, ~replace(., is.na(.), 0))  # 결측치 0으로 
df <- df[, c('SalePrice','LotFrontage','LotArea','YearBuilt')]
# 판매가, 부동산과 도로와의 거리, 면적, 지어진 년도
str(df)

plot(df, col = 'steelblue',pch = 19)

cor(df)

model <- lm(SalePrice ~ YearBuilt+LotFrontage+LotArea, data = df)
abline(model, col = 'tomato', lwd= 3)
summary(model)
