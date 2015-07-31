library(markdown)
library(shinythemes)
library(shinyBS)
library(rCharts)
library(leaflet)
options(RCHART_LIB = 'nvd3')

shinyUI(navbarPage("SpatStat",theme = shinytheme("journal"),
                   tabPanel("Overview",
                            navlistPanel(
                                tabPanel("Scatterplot",
                                         tabsetPanel(type = "tabs", 
                                                     tabPanel("Plot", showOutput("chart1", lib="nvd3"),
                                                              downloadButton('scatterPlot',label='download plot')), 
                                                     tabPanel("Theory", includeMarkdown("scatter.md"))
                                         )
                                ),
                                tabPanel("Density",
                                         tabsetPanel(type = "tabs", 
                                                     tabPanel("Plot",
                                                              sliderInput("sigma", "Sigma:", min = 5, max = 15, value = bw.diggle(paracou), step = 0.5),
                                                              plotOutput("chart2", height=800),
                                                              downloadButton('downloadPlot',label='download plot')), 
                                                     tabPanel("Theory", includeMarkdown("density.md"))
                                         )
                                ),
                                tabPanel("Heatmap",
                                         tabsetPanel(type = "tabs", 
                                                     tabPanel("Plot",
                                                              tags$head(tags$script(src = "https://code.highcharts.com/highcharts.js"),
                                                                        tags$script(src = "https://code.highcharts.com/highcharts-more.js"),
                                                                        tags$script(src = "https://code.highcharts.com/modules/exporting.js"),
                                                                        tags$script(src = "https://code.highcharts.com/modules/heatmap.js")
                                                              ),
                                                              sliderInput("nx", "nx:", min = 0, max = 30, value = 5, step = 1),
                                                              sliderInput("ny", "ny:", min = 0, max = 30, value = 4, step = 1),
                                                              br(),   
                                                              showOutput("heatmap", lib="highcharts"),
                                                              downloadButton('heatPlot',label='download plot')),
                                                     tabPanel("Theory", includeMarkdown("heat.md"))
                                                     )
                                ),
                                tabPanel("Summary",
                                         tabsetPanel(type = "tabs", 
                                                     tabPanel("Summary", verbatimTextOutput("summary")),
                                                     tabPanel("Piechart", showOutput("piechart", lib="nvd3")),
                                                     tabPanel("Theory", includeMarkdown("summary.md"))
                                         )
                                )
                            )
                            ),
                   navbarMenu("Summary Statistics (univariat)",
                              tabPanel("Pair Correlation Function",
                                       sidebarLayout(
                                           sidebarPanel(
                                               sliderInput("nrank_pcf", "nrank:", 5, min = 1, max = 99, step = 1),
                                               sliderInput("nsim_pcf", "nsim:", 19, min = 19, max = 999, step = 1),
                                               sliderInput("stoyan_pcf", "stoyan:", 0.3, min = 0, max = 0.5, step = 0.01),
                                               sliderInput("r_pcf", "r:", 50, min = 0, max = 100, step = 1),
                                               br(),
                                               bsButton("button_pcf", "Run Statistics", type='action', icon = icon("terminal", lib="font-awesome"),
                                                        style="info"),
                                               downloadButton('pcfPlot',label='download plot')
                                           ),
                                           
                                           # Show a tabset that includes a plot, summary, and table view
                                           # of the generated distribution
                                           mainPanel(
                                               tabsetPanel(type = "tabs", 
                                                           tabPanel("Plot", plotOutput("chart_pcf")), 
                                                           tabPanel("Parameters", includeMarkdown("pcf_params.md")), 
                                                           tabPanel("Theory", includeMarkdown("pcf_theory.md"))
                                               )
                                           )
                                       )
                              ),
                              tabPanel("L-function",
                                       sidebarLayout(
                                           sidebarPanel(
                                               sliderInput("nrank_lest", "nrank:", 5, min = 1, max = 99, step = 1),
                                               sliderInput("nsim_lest", "nsim:", 19, min = 19, max = 999, step = 1),
                                               sliderInput("r_lest", "r:", 50, min = 0, max = 100, step = 1),
                                               br(),
                                               bsButton("button_lest", "Run Statistics", type='action', icon = icon("terminal", lib="font-awesome"),
                                                        style="info"),
                                               downloadButton('lestPlot',label='download plot')
                                           ),
                                           
                                           # Show a tabset that includes a plot, summary, and table view
                                           # of the generated distribution
                                           mainPanel(
                                               tabsetPanel(type = "tabs", 
                                                           tabPanel("Plot", plotOutput("chart_lest")), 
                                                           tabPanel("Parameters", includeMarkdown("est_params.md")), 
                                                           tabPanel("Theory", includeMarkdown("lest_theory.md"))
                                               )
                                           )
                                       )
                              ),
                              tabPanel("G-function",
                                       sidebarLayout(
                                           sidebarPanel(
                                               sliderInput("nrank_gest", "nrank:", 5, min = 1, max = 99, step = 1),
                                               sliderInput("nsim_gest", "nsim:", 19, min = 19, max = 999, step = 1),
                                               sliderInput("r_gest", "r:", 50, min = 0, max = 100, step = 1),
                                               br(),
                                               bsButton("button_gest", "Run Statistics", type='action', icon = icon("terminal", lib="font-awesome"),
                                                        style="info"),
                                               downloadButton('gestPlot',label='download plot')
                                           ),
                                           
                                           # Show a tabset that includes a plot, summary, and table view
                                           # of the generated distribution
                                           mainPanel(
                                               tabsetPanel(type = "tabs", 
                                                           tabPanel("Plot", plotOutput("chart_gest")), 
                                                           tabPanel("Parameters", includeMarkdown("est_params.md")), 
                                                           tabPanel("Theory", includeMarkdown("gest_theory.md"))
                                               )
                                           )
                                       )
                              )
                      ),
                   navbarMenu("Summary Statistics (bivariat)",
                              tabPanel("Mark Correlation Function",
                                       sidebarLayout(
                                           sidebarPanel(
                                               sliderInput("nrank_markcorr", "nrank:", 5, min = 1, max = 99, step = 1),
                                               sliderInput("nsim_markcorr", "nsim:", 19, min = 19, max = 999, step = 1),
                                               sliderInput("stoyan_markcorr", "stoyan:", 0.3, min = 0, max = 0.5, step = 0.01),
                                               sliderInput("r_markcorr", "r:", 50, min = 0, max = 100, step = 1),
                                               br(),
                                               bsButton("button_markcorr", "Run Statistics", type='action', icon = icon("terminal", lib="font-awesome"),
                                                        style="info"),
                                               downloadButton('markcorrPlot',label='download plot')
                                           ),
                                           
                                           # Show a tabset that includes a plot, summary, and table view
                                           # of the generated distribution
                                           mainPanel(
                                               tabsetPanel(type = "tabs", 
                                                           tabPanel("Plot", plotOutput("chart_markcorr")), 
                                                           tabPanel("Parameters", includeMarkdown("markcorr_params.md")), 
                                                           tabPanel("Theory", includeMarkdown("markcorr_theory.md"))
                                               )
                                           )
                                       )
                              ),
                              tabPanel("Multitype pair correlation function",
                                       sidebarLayout(
                                           sidebarPanel(
                                               sliderInput("stoyan_pcfcross", "stoyan:", 0.3, min = 0, max = 0.5, step = 0.01),
                                               sliderInput("nrank_pcfcross", "nrank:", 5, min = 1, max = 99, step = 1),
                                               sliderInput("nsim_pcfcross", "nsim:", 19, min = 19, max = 999, step = 1),
                                               sliderInput("r_pcfcross", "r:", 50, min = 0, max = 100, step = 1),
                                               br(),
                                               bsButton("button_pcfcross", "Run Statistics", type='action', icon = icon("terminal", lib="font-awesome"),
                                                        style="info"),
                                               downloadButton('pcfcrossPlot',label='download plot')
                                           ),
                                           
                                           # Show a tabset that includes a plot, summary, and table view
                                           # of the generated distribution
                                           mainPanel(
                                               tabsetPanel(type = "tabs", 
                                                           tabPanel("Plot", plotOutput("chart_pcfcross")), 
                                                           tabPanel("Parameters", includeMarkdown("pcfcross_params.md")), 
                                                           tabPanel("Theory", includeMarkdown("pcfcross_theory.md"))
                                               )
                                           )
                                       )
                              )
                   ),
                   navbarMenu("More",
                              tabPanel("Table",
                                       dataTableOutput("table")
                              ),
                              tabPanel("Map",
                                       tabsetPanel(type = "tabs", 
                                                   tabPanel("Plot", leafletOutput('myMap', height=600)), 
                                                   tabPanel("Theory", includeMarkdown("leaflet.md"))
                                       )
                              ),
                              tabPanel("About",
                                       fluidRow(
                                           column(6,
                                                  includeMarkdown("about.md")
                                           ),
                                           column(3,
                                                  img(class="img-polaroid",
                                                      width = 500,
                                                      src=paste0("http://upload.wikimedia.org/",
                                                                 "wikipedia/commons/f/fc/",
                                                                 "French_Guiana_tropical_forest_towards_Cacao.jpg")),
                                                  tags$small(
                                                      "Source: French Guiana: tropical forest towards Cacao. Panorama at Bellevue.",
                                                      ", 24 March 2013, by",
                                                      a(href="https://commons.wikimedia.org/wiki/User:Cayambe",
                                                        "User:Cayambe")
                                                  )
                                           )
                                       )
                              ),
                              tabPanel("Further reading",
                                       includeMarkdown("references.md")
                              )
                   )
))