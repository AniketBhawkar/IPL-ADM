library(keras)
library(readr)
df = read.csv("F:/Masters/Semester 2/Advanced Data Mining/IPL/raghu543-ipl-data-till-2017/clean datasets/Match_Impact_Teams.csv")
df = df[c(-3,-4,-5,-6,-8,-9,-10,-12,-13)]
data = as.matrix(df)

dimnames(data) = NULL
set.seed(1234)
index = sample(2,
               nrow(data),
               replace = TRUE,
               prob = c(0.75,0.25))
x_train = data[index == 1,-4]
x_test = data[index == 2,-4]

#x_test_actual = data[index == 1,8]
y_test_actual = data[index == 2,4]

y_train = to_categorical(data[index==1,4])
y_test = to_categorical(data[index==2,4])


mean_train = apply(x_train,
                   2,
                   mean)

std_train = apply(x_train,
                  2,
                  sd)

x_train = scale(x_train,
                center = mean_train,
                scale = std_train)

x_test = scale(x_test,
               center = mean_train,
               scale = std_train)


model <- keras_model_sequential() 
model %>% 
  layer_dense(units = 256, activation = "relu", input_shape = c(13)) %>% 
  layer_dropout(rate = 0.4) %>% 
  layer_dense(units = 128, activation = "relu") %>%
  layer_dropout(rate = 0.3) %>%
  layer_dense(units = 2, activation = "softmax")
summary(model)

model %>% compile(
  loss = "categorical_crossentropy",
  optimizer = "adam",
  metrics = c("accuracy")
)

history <- model %>% 
  fit(x_train, 
      y_train, 
      epochs = 10, 
      batch_size = 128, 
      validation_split = 0.2)

plot(history)

model %>%
  evaluate(x_test,
           y_test)

pred = model %>%
  predict_classes(x_test)

table(Predicted = pred,
      Actual = y_test_actual)

prob = model %>%
  predict_proba(x_test)

ans = cbind(prob,pred,y_test_actual)

