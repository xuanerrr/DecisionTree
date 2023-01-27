library(rpart)
library(rpart.plot)
data=read.table('D:/Move/move/code_jupyter/表1.csv',header=T,sep=',')
data
library(raster)
for (i in 1:13){
  data$Age[i]<-trim(data$Age[i])
}
tree0<-rpart(formula = Buying ~ Age+Incoming+Student+Credit.Rating,
             data=data, method='class', parms = list(split = "gini"),control =rpart.control(minsplit =1))
par(xpd=T)
plot(tree0, uniform = TRUE, branch = 0)
text(tree0, splits = T, use.n = T)
rpart.plot(tree0, type = 2, extra = "auto", under = FALSE, fallen.leaves = TRUE, 
           digits = 2, varlen = 0, faclen = 0, roundint = TRUE, cex = NULL, tweak = 1, 
           clip.facs = FALSE, clip.right.labs = TRUE, snip = FALSE, box.palette = "auto")
test=data.frame('User_id'=14,
                'Age'=c('>40'),
                'Incoming'=c('medium'),
                'Student'=c('no'),
                'Credit Rating'=c('excellent'))
predict(tree0,test,type='class')

