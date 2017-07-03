fun_esc<-function(data=data,numcuentas=numcuentas,escenario="esc1"){
  
  subdata<-data[,grep(escenario,names(data))]
  subdata<-as.data.frame(apply(as.matrix(subdata),2,as.character))
  subdata<-as.data.frame(apply(as.matrix(subdata),2,as.numeric))
  subdata$numcuentas<-as.numeric(as.character(numcuentas))
  x<-subdata$numcuentas*((subdata[,1]*subdata[,2]/60)*subdata[,3]*.065*30.4*12)/1000000
  return(x)
  
}

creartabla<-function(nc1,nc2,nc3,data){
  
  es1<-fun_esc(data,nc1,"esc1")
  es2<-fun_esc(data,nc2,"esc2")
  es3<-fun_esc(data,nc3,"esc3")
  
  y<-cbind(es1,es2,es3)
  z<-as.data.frame(y)
  rownames(z)<-c("Registros","Traspasos Recibidos","Traspasos Cedidos","Asignados")
  
  return(z)
  
}

dataimportado<-read.csv("data2.csv",header=T)

nuctas1_1<-15000
nuctas2_1<-160000
nuctas3_1<-115000
nuctas4_1<-82441
nuctas1_2<-15000
nuctas2_2<-160000
nuctas3_2<-115000
nuctas4_2<-82441
nuctas1_3<-15000
nuctas2_3<-160000
nuctas3_3<-115000
nuctas4_3<-82441

tbl00<-creartabla(c(nuctas1_1,nuctas2_1,nuctas3_1,nuctas4_1),
           c(nuctas1_2,nuctas2_2,nuctas3_2,nuctas4_2),
           c(nuctas1_3,nuctas2_3,nuctas3_3,nuctas4_3),
           dataimportado)

tbla<- tbl00
View(tbla)