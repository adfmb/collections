
pageWithSidebar(
  headerPanel('Recaudación'),
  sidebarPanel(
    
    fileInput("file1", "Elige archivo CSV",
              accept = c(
                ".csv")
    ),
    tags$hr(),
    
    checkboxInput("header", "Header", TRUE),
  
    tags$hr(),
    
    actionButton("go", "Calcula"),
  
    numericInput('nuctas1_1', 'Registros E1', 15000,
                 min = 5000, max = 100000),
    numericInput('nuctas2_1', 'Traspasos Recibidos E1', 160000,
                 min = 100000, max = 200000),
    numericInput('nuctas3_1', 'Traspasos Cedidos E1', 115000,
                 min = 50000, max = 150000),
    numericInput('nuctas4_1', 'Asignados E1', 82441,
                 min = 0, max = 100000),
    numericInput('nuctas1_2', 'Registros E2', 15000,
                 min = 5000, max = 100000),
    numericInput('nuctas2_2', 'Traspasos Recibidos E2', 160000,
                 min = 100000, max = 200000),
    numericInput('nuctas3_2', 'Traspasos Cedidos E2', 115000,
                 min = 50000, max = 150000),
    numericInput('nuctas4_2', 'Asignados E2', 82441,
                 min = 0, max = 100000),
    numericInput('nuctas1_3', 'Registros E3', 15000,
                 min = 5000, max = 100000),
    numericInput('nuctas2_3', 'Traspasos Recibidos E3', 160000,
                 min = 100000, max = 200000),
    numericInput('nuctas3_3', 'Traspasos Cedidos E3', 115000,
                 min = 50000, max = 150000),
    numericInput('nuctas4_3', 'Asignados E3', 82441,
                 min = 0, max = 100000)
    
  ),
  
  mainPanel(
    img(src='Afore-profuturo-GNP.jpg', align = "center"),
    dataTableOutput("tbla")
  )
)
