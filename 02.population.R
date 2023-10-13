# Population dynamics
# Surviving as much as we can as long as we have food, Numer in time
# worldometer

# install.packages("spatstat")
# install.packages("terra")
library(spatstat)
library(terra)
# Do not save locally R, data from outside
# " when outside R, the world is scary, when inside no need

bei 
plot(bei, pch=19, cex=.5) 
# we want to understand why there are forests there
# data clustered is an island

bei.extra
# It contains 2 levels of maps: a raster each (aratro each pixel) is a map, elevation and grad
plot(bei.extra)
# To link elevation to dataset you use a symbol like rope: $
plot(bei.extra$elev)
elevation<-bei.extra$elev
 #6th or 7th person will have same birthday as another. cumulative population
plot(bei.extra[[1]])

density_map <- density(bei)
# passing from points to a continuous surface
density_map
plot(density_map)
points(bei, cex=2)
cl <- colorRampPalette(c("black", "red", "orange", "yellow"))(100)
plot(density_map, col=cl)

clnew <- colorRampPalette(c("dark blue", "blue", "light blue"))(4)
plot(densitymap, col=clnew)

plot(bei.extra[[1]], col=cl)

# multiframe
par(mfrow=c(2,1))
plot(densitymap)
plot(elev)

par(mfrow=c(1,3))
plot(bei)
plot(densitymap)
plot(elev)
