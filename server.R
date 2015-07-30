
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(spatstat)
library(rCharts)
library(leaflet)
library(htmlwidgets)

shinyServer(function(input, output, session) {

    output$piechart <- renderChart2({
        p5 <- nPlot(~ marks, data = point.data, type = 'pieChart')
        p5$chart(donut = TRUE)
        p5
        return(p5)
    })
    
    output$chart1 <- renderChart2({
        p1 <- nPlot(x ~ y, group="marks", data = point.data, type = "scatterChart")
        p1$chart(tooltipContent = "#! function(key, x, y, e){ 
                                      return 'Mark: ' + e.point.marks
                                    } !#")
        p1$chart(color = c('#6495ED', '#CDC8B1'))
        return(p1)
    })
    
    output$scatterPlot <- downloadHandler(
        filename = "scatterplot.html",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            p1 <- nPlot(x ~ y, group="marks", data = point.data, type = "scatterChart")
            p1$chart(tooltipContent = "#! function(key, x, y, e){ 
                                      return 'Mark: ' + e.point.marks
                                    } !#")
            p1$chart(color = c('#6495ED', '#CDC8B1'))
            
            p1$save(file, standalone = TRUE)
        }
    )
    
    
    output$chart2 <- renderPlot({
        plot(density(paracou, sigma=input$sigma), main="")
    })
    
    output$downloadPlot <- downloadHandler(
        filename = "density.pdf",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            pdf(file,onefile=T, width=12,height=8)
            plot(density(paracou, sigma=input$sigma), main="")
            dev.off()
        }
    )
    
    output$chart_pcf <- renderPlot({
        if(input$button_pcf == 0 ) return( msgRunPrompt() )
        input$button_pcf
        isolate(plot(envelope(Y=paracou, fun=pcf, r=0:input$r_pcf, nsim=input$nsim_pcf, nrank=input$nrank_pcf, stoyan=input$stoyan_pcf), main="", legendpos="topleft", legendargs=list(cex=0.7), xlim=c(0, max(input$r_pcf))))
    })
    
    output$pcfPlot <- downloadHandler(
        filename = "pcf.pdf",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            pdf(file,onefile=T, width=12,height=8)
            isolate(plot(envelope(Y=paracou, fun=pcf, r=0:input$r_pcf, nsim=input$nsim_pcf, nrank=input$nrank_pcf, stoyan=input$stoyan_pcf), main="", legendpos="topleft", legendargs=list(cex=0.7), xlim=c(0, max(input$r_pcf))))
            dev.off()
        }
    )
    
    output$chart_gest <- renderPlot({
        if(input$button_gest == 0 ) return( msgRunPrompt() )
        input$button_gest
        isolate(plot(envelope(paracou, fun=Gest, r=0:input$r_gest, nsim = input$nsim_gest, nrank=input$nrank_gest), main="", legendpos="topleft", legendargs=list(cex=0.7), xlim=c(0, max(input$r_gest))))
    })
    
    output$gestPlot <- downloadHandler(
        filename = "gest.pdf",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            pdf(file,onefile=T, width=12,height=8)
            isolate(plot(envelope(paracou, fun=Gest, r=0:input$r_gest, nsim = input$nsim_gest, nrank=input$nrank_gest), main="", legendpos="topleft", legendargs=list(cex=0.7), xlim=c(0, max(input$r_gest))))
            dev.off()
        }
    )
    
    output$chart_lest <- renderPlot({
        if(input$button_lest == 0 ) return( msgRunPrompt() )
        input$button_lest
        isolate(plot(envelope(paracou, fun=Lest, r=0:input$r_lest, nsim = input$nsim_lest, nrank=input$nrank_lest), . -r ~ r, main="", legendpos="topleft", legendargs=list(cex=0.7), xlim=c(0, max(input$r_lest))))
    })
    
    output$lestPlot <- downloadHandler(
        filename = "lest.pdf",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            pdf(file,onefile=T, width=12,height=8)
            isolate(plot(envelope(paracou, fun=Lest, r=0:input$r_lest, nsim = input$nsim_lest, nrank=input$nrank_lest), . -r ~ r, main="", legendpos="topleft", legendargs=list(cex=0.7), xlim=c(0, max(input$r_lest))))
            dev.off()
        }
    )
    
    output$chart_markcorr <- renderPlot({
        if(input$button_markcorr == 0 ) return( msgRunPrompt() )
        input$button_markcorr
        isolate(plot(envelope(Y=paracou, fun=markcorr, r=0:input$r_markcorr, stoyan=input$stoyan_markcorr, nsim=input$nsim_markcorr,
                              nrank=input$nrank_markcorr, simulate=expression(rlabel(paracou))), main="", legendpos="topleft",
                              legendargs=list(cex=0.7), xlim=c(0, max(input$r_markcorr))))
    })
    
    output$markcorrPlot <- downloadHandler(
        filename = "markcorr.pdf",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            pdf(file,onefile=T, width=12,height=8)
            isolate(plot(envelope(Y=paracou, fun=markcorr, r=0:input$r_markcorr, stoyan=input$stoyan_markcorr, nsim=input$nsim_markcorr,
                                  nrank=input$nrank_markcorr, simulate=expression(rlabel(paracou))), main="", legendpos="topleft",
                         legendargs=list(cex=0.7), xlim=c(0, max(input$r_markcorr))))
            dev.off()
        }
    )
    
    output$chart_pcfcross <- renderPlot({
        if(input$button_pcfcross == 0 ) return( msgRunPrompt() )
        input$button_pcfcross
        isolate(plot(envelope(Y=paracou, fun=pcfcross, i="adult", j="juvenile", r=0:input$r_pcfcross,
                              simulate=expression(rshift(paracou, which="adult")), nsim=input$nsim_pcfcross, nrank=input$nrank_pcfcross,
                              stoyan=input$stoyan_pcfcross, verbose=FALSE), main="", legendpos="topleft",
                     legendargs=list(cex=0.7), xlim=c(0, max(input$r_pcfcross))))
    })
    
    output$pcfcrossPlot <- downloadHandler(
        filename = "pcfcross.pdf",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            pdf(file,onefile=T, width=12,height=8)
            isolate(plot(envelope(Y=paracou, fun=pcfcross, i="adult", j="juvenile", r=0:input$r_pcfcross,
                                  simulate=expression(rshift(paracou, which="adult")), nsim=input$nsim_pcfcross, nrank=input$nrank_pcfcross,
                                  stoyan=input$stoyan_pcfcross, verbose=FALSE), main="", legendpos="topleft",
                         legendargs=list(cex=0.7), xlim=c(0, max(input$r_pcfcross))))
            dev.off()
        }
    )
    
    output$heatmap <- renderChart2({
        
        qc <- quadratcount(paracou, nx= input$nx, ny= input$ny)
        qc_mat <- as.data.frame(qc)
        qc_mat <- cbind(qc_mat[,2],qc_mat[,1],qc_mat[,3])
        colnames(qc_mat) <- c("x","y","value")
        
        
        map <- Highcharts$new()
        map$chart(zoomType = "x", type = 'heatmap')
        map$credits(text = "Created with rCharts and Highcharts", href = "http://rcharts.io")
        map$title(text='4x5 Quadrat counting')
        
        map$series(name = 'Counts per quadrat',
                   data = toJSONArray2(qc_mat, json=FALSE),
                   color = "#cccccc",
                   dataLabels = list(
                       enabled = TRUE,
                       color = 'black',
                       style = list(
                           textShadow = 'none',
                           HcTextStroke = NULL
                       )
                   ))

        map$addParams(colorAxis = 
                          list(
                              min = 0,
                              minColor='#FFFFFF',
                              maxColor='#7cb5ec'
                          )
        )
        
        map$legend(align='right',
                   layout='vertical',
                   margin=0,
                   verticalAlign='top',
                   y=25,
                   symbolHeight=320)
        
        # set width and height of the plot and attach it to the DOM
        map$addParams(height = 400, width=1000, dom="heatmap")
        
        # save heatmap as HTML page heatmap.html for debugging
        #map$save(destfile = 'heatmap.html')
        
        # print map
        print(map)
    })
    
    
    output$heatPlot <- downloadHandler(
        filename = "scatterplot.html",
        # a function that actually opens a connection to a pdf and print the result to it
        content = function(file) { # this function must take at least an input variable, namely the filename of the file to save
            
            qc <- quadratcount(paracou, nx= input$nx, ny= input$ny)
            qc_mat <- as.data.frame(qc)
            qc_mat <- cbind(qc_mat[,2],qc_mat[,1],qc_mat[,3])
            colnames(qc_mat) <- c("x","y","value")
            
            
            map <- Highcharts$new()
            map$chart(zoomType = "x", type = 'heatmap')
            map$credits(text = "Created with rCharts and Highcharts", href = "http://rcharts.io")
            map$title(text='4x5 Quadrat counting')
            
            map$series(name = 'Counts per quadrat',
                       data = toJSONArray2(qc_mat, json=FALSE),
                       color = "#cccccc",
                       dataLabels = list(
                           enabled = TRUE,
                           color = 'black',
                           style = list(
                               textShadow = 'none',
                               HcTextStroke = NULL
                           )
                       ))
            
            map$addParams(colorAxis = 
                              list(
                                  min = 0,
                                  minColor='#FFFFFF',
                                  maxColor='#7cb5ec'
                              )
            )
            
            map$legend(align='right',
                       layout='vertical',
                       margin=0,
                       verticalAlign='top',
                       y=25,
                       symbolHeight=320)
            
            # set width and height of the plot and attach it to the DOM
            map$addParams(height = 400, width=1000, dom="heatmap")
            
            # save heatmap as HTML page heatmap.html for debugging
            map$save(file, standalone = TRUE)
        }
    )
    
    output$myMap <- renderLeaflet(
        leaflet() %>%
            
            # Add tiles as baseGroup
            addProviderTiles("OpenMapSurfer.Roads", group = "OpenMapSurfer.Roads") %>%
            
            # Layers control
            addLayersControl(
                baseGroups = c("OpenMapSurfer.Roads"),
                overlayGroups = c("Trees"),
                options = layersControlOptions(collapsed = FALSE)
            ) %>%
            
            # add trees
            addMarkers(data = random_points, 
                       lat = ~ y, 
                       lng = ~ x, 
                       popup = marks,
                       group="Trees")
        
    )

    output$summary <- renderPrint({
        summary(point.data)
    })
    
    output$summary2 <- renderPrint({
        summary(point.data)
    })
    
    output$table <- renderDataTable({
        point.data
    }, options=list(pageLength=10))
    
})