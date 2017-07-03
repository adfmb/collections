library(shiny)
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

function(input, output, session) {
  

  dataimportado<-eventReactive(input$file1,{
    
    # inFile <- input$file1
    
    if (is.null(input$file1)){
      return(NULL)}else{
    
    read.csv(input$file1$datapath, header=input$header)
      }

  })
  
  observe({ dataimportado() })
  
  # nc1<-reactive({
  #   
  #   c(input$nuctas1_1,input$nuctas2_1,input$nuctas3_1,input$nuctas4_1)
  #   
  # })
  # 
  # nc2<-reactive({
  #   
  #   c(input$nuctas1_2,input$nuctas2_2,input$nuctas3_2,input$nuctas4_2)
  #   
  # })
  # 
  # nc3<-reactive({
  #   
  #   c(input$nuctas1_3,input$nuctas2_3,input$nuctas3_3,input$nuctas4_3)
  #   
  # })
  # 
  # tbla_final<-reactive({
  #   
  #   creartabla(nc1(),nc2(),nc3(),dataimportado())
  #   
  # })
  
  
  tbl00<-eventReactive(input$go,{
    
    creartabla(c(input$nuctas1_1,input$nuctas2_1,input$nuctas3_1,input$nuctas4_1),
               c(input$nuctas1_2,input$nuctas2_2,input$nuctas3_2,input$nuctas4_2),
               c(input$nuctas1_3,input$nuctas2_3,input$nuctas3_3,input$nuctas4_3),
               dataimportado())
    # creartabla(nc1(),nc2(),nc3(),dataimportado())
    
  })
  

  
  
  
  output$tbla <- renderDataTable({
    # tbla_final
    # observe({ tbl00() })
    tbl00()
  })
  
  
  
}