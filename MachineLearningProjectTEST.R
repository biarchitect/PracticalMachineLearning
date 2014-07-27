#rm(list=ls())
#data<-read.csv("./Data/pml-testing.csv",header=T,stringsAsFactors=F)
data<-read.csv("./Data/pml-testing.csv",stringsAsFactors=F)
#data<-read.csv("./Data/pml-testing.csv",as.is=T)
testp<-data
testp[testp==""]<-NA
testp[testp=="#DIV/0!"]<-NA
#testp1<-testp[,!apply(testp,2,function(x) all(is.na(x)))]
#testp1<-apply(testp[,c(-2,-5,-6,-160)],2,as.numeric)
testp1<-as.data.frame(testp1)
testp1$amplitude_yaw_belt<-NULL
testp1$amplitude_yaw_dumbbell<-NULL
testp1$amplitude_yaw_forearm<-NULL
m<-dim(testp1)[1]
testp3<-testp1
# for (x in 1:dim(testp3)[2]) {if (sum(!is.na(testp3[,x]))/m < 1) {testp3[,x]<-NULL} }
# for (x in 1:dim(testp3)[2]) {if (sum(!is.na(testp3[,x]))/m < 1) {testp3[,x]<-NULL} }
# for (x in 1:dim(testp3)[2]) {if (sum(!is.na(testp3[,x]))/m < 1) {testp3[,x]<-NULL} }
# for (x in 1:dim(testp3)[2]) {if (sum(!is.na(testp3[,x]))/m < 1) {testp3[,x]<-NULL} }
# for (x in 1:dim(testp3)[2]) {if (sum(!is.na(testp3[,x]))/m < 1) {testp3[,x]<-NULL} }
# for (x in 1:dim(testp3)[2]) {if (sum(!is.na(testp3[,x]))/m < 1) {testp3[,x]<-NULL} }
testp3<-testp1
x<-1;y<-dim(testp3)[2]
while (x < y){
  if (sum(!is.na(testp3[,x]))/m < 1) {testp3[,x]<-NULL;y<-dim(testp3)[2]} else{ x<-x+1}
                                    
}

# testp3$classe<-as.factor(testp[,])
test<-testp3
test<-test[,-1:-4]
#confusionMatrix(test$classe,predict(modelFit,test))
x<-predict(modelFit,newdata=test)


pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("./Data/problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}
pml_write_files(x)
