# Population dynamics
# Surviving as much as we can as long as we have food, Numer in time
# worldometer

# install.packages("spatstat")
# install.packages("terra")
library(spatstat)
library(terra)

bei 
plot(bei, pch=19, cex=.5) 
# we want to understand why there are forests there

bei.extra
# It contains 2 levels of maps: a raster each (aratro each pixel) is a map, elevation and grad
plot(bei.extra)
# To link elevation to dataset you use a symbol like rope: $
plot(bei.extra$elev)
elevation<-bei.extra$elev


plot(bei.extra[[1]])
density_map <- density(bei)

par(mfrow=c(2,1))
plot(bei.extra[[1]])
plot(density_map)

cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(bei.extra[[1]], col=cl)
plot(density_map, col=cl)

#-----
bei.rast <- rast(bei.extra[[1]])
density.rast <- rast(density_map)

randompoints <- spatSample(bei.rast, 100, "random", as.points = TRUE)
bei.points <- terra::extract(bei.rast, randompoints)
density.points <- terra::extract(density.rast, randompoints)
 
pointmaps <- data.frame(bei.points[1:2], density.points[2])

names(pointmaps)

attach(pointmaps)
plot(lyr.1, lyr.1.1)
