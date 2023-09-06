##load libraries
library(caret)
library(tidyverse)
library(mlbench)
library(MLmetrics)

#see available data
data()

##glimpse data
df <- BostonHousing
glimpse(df)

##Clustering=>ภาษาการตลาดเรียกว่าSegmentation

subset_df <- df %>%
  select(crim, rm, age, lstat, medv) %>%
  as_tibble()
##as_tibble=Show Default (10 top rows)

##test different k (k= 2-5)
result <- kmeans(x = subset_df, centers = 3)
#มันจะแบ่งบ้านเป็น2กลุ่มbase on 5คอลัมน์ที่กำหนดไป
##เก็บค่าไว้ในชื่อ result
##ทดสอบresult$clusterที่console


##ทำการmembership[1,2,3]
#เอาค่า3กลุ่มassignไปที่dfเราเอาก้อนนี้ไปรันบนconsole
subset_df$cluster <- result$cluster
  

##ลองหาmean(medv)ได้เช่นกัน
subset_df %>%
  summarise(avg_medv = mean(medv))


##แล้วถ้าเกิดต้องการจับกลุ่มmean ราคาบ้านแบ่งตามmembership
subset_df %>%
  group_by(cluster) %>%
  summarise(avg_medv = mean(medv))

##-----------------------------------------------
## lm, knn

df <- as_tibble(df)

# 1.split data
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=0.8*n)
train_data <- df[id, ]
test_data <- df[-id, ]

# 2.train model
mylinear_model <- train(medv ~ crim + rm + age,
                   data = train_data,
                   method = "lm")

myknn_model <- train(medv ~ crim + rm + age,
                   data = train_data,
                   method = "knn")
#ctrl
set.seed(42)
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)
#grid search 
k_grid <- data.frame(k = c(3,5,7,9,11))

myknn2_model <- train(medv ~ crim + rm + age,
                     data = train_data,
                     method = "knn",
                     metric = "Rsquared",
                     tuneGrid = k_grid,
                     preProcess = c("center","scale"),
                     trcontrol = ctrl)
#tuneLength random search
myknn3_model <- train(medv ~ crim + rm + age,
                      data = train_data,
                      method = "knn",
                      metric = "Rsquared",
                      tuneLength = 2,
                      preProcess = c("center","scale"),
                      trcontrol = ctrl)

# 3.score
p <- predict(knn_model, newdata = test_data)

# 4.evaluate
RMSE(p, test_data$medv)  


##--------------------------------------------
##Clssification problem
data("PimaIndiansDiabetes")

df <- PimaIndiansDiabetes

subset_df <- df %>%
  select(glucose, insulin, age, diabetes)

#library(forcats)
df$diabetes <- fct_relevel(df$diabetes, "pos")

# 1.Split data
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=0.8*n)
train_data <- subset_df[id, ]
test_data <- subset_df[-id, ]

# 2.Train model
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE,
                     summaryFunction = prSummary,
                     classProbs = TRUE)

(knn_model <- train(diabetes ~ .,
                   data = train_data,
                   method = "knn",
                   metric = "Recall", #PR AUC
                   trControl = ctrl))

# 3.Score
p <- predict(knn_model, newdata = test_data)

# 4.Evaluate
table(test_data$diabetes, p, dnn = c("Actual",
                                     "Prediction"))


confusionMatrix(p, test_data$diabetes)

##ถ้าเราต้องการหาคนที่เป็นPositive(เป็นเบาหวานคือ+)ให้เซตเพิ่มไปด้วย
confusionMatrix(p, test_data$diabetes, 
                positive = "pos",
                mode = "prec_recall")

#อย่าลืมติดตั้ง MLmetrics เพิ่ม
##ใช้contrasts()เพื่อกำหนดตัวหลักในการpredictใหม่ให้เป็นpositive
##ใช้forcats()เพื่อกำหนดให้มันโฟกัสไปที่positive

##--------------------------------------------------
##Logistic Regression

# 1.Split data
set.seed(42)
n <- nrow(df)
id <- sample(1:n, size=0.8*n)
train_data <- subset_df[id, ]
test_data <- subset_df[-id, ]

# 2.Train model
ctrl <- trainControl(method = "cv",
                     number = 5,
                     verboseIter = TRUE)

(knn_model <- train(diabetes ~ .,
                    data = train_data,
                    method = "glm",
                    metric = "Accuracy",
                    trControl = ctrl))

##--------------------------------------------------
##Decision Tree (rpart)











