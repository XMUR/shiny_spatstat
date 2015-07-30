library(spatstat)
library(rgdal)
library(rgeos)
library(ggmap)

# load data
attach(paracou)
point.data <- as.data.frame(paracou)
point.data[,1] <- round(point.data[,1], digits = 1)

r            <- seq(from=0, to=50, by=0.5)

### function for displaying text in in the UI
msgRunPrompt <- function( renderType="plot", ... )
{
    #... allows other mtext params to be passed
    msg <- "Press the 'Run Statistics' button to see output here"
    
    if (renderType=="plot")
        mtext(msg, col='#a50026', ...)
    else if (renderType=="print")
        cat(msg)
    else #text
        msg
}

geolocated_paracou <- geocode("Paracou Field Station, Sinnamary, Cayenne, French Guiana")
geolocated_paracou <- SpatialPoints(geolocated_paracou)
pc100km <- gBuffer(geolocated_paracou, width=0.001, byid=TRUE )
random_points <- spsample(pc100km, n=884, type="random")
random_points$marks <- paracou$marks
random_points <- as.data.frame(random_points)

