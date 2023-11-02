# Why populations disperse over the landscape in a certain manner?

library(sdm)
library(terra)

file <- system.file("external/species.shp", package="sdm")
rana <- vect(file)
rana$Occurrence
plot(rana)

# Selecting presences
pres <- rana[rana$Occurrence==1,]
plot(pres)
pres
# select absence
abse <- rana[rana$Occurrence==0,]
par(mfrow=c(1,2))
plot(pres, col="dark blue")
points(abse, col="light blue")
dev.off()

# predictors: environmental variables
# elevation predictor
elev <- system.file("external/elevation.asc", package="sdm") 
elevmap <- rast(elev) # from terra package
plot(elevmap)
points(pres, cex=.5)

# temperature predictor
temp <- system.file("external/temperature.asc", package="sdm") 
tempmap <- rast(temp) # from terra package
plot(tempmap)
points(pres, cex=.5)

# vegetation cover
vege <- system.file("external/vegetation.asc", package="sdm") 
vegemap <- rast(vege) # from terra package
plot(vegemap)
points(pres, cex=.5)

# exrcise: do the same with vegetation cover
prec <- system.file("external/precipitation.asc", package="sdm") 
precmap <- rast(prec) # from terra package
plot(precmap)
points(pres, cex=.5)

# final multiframe
par(mfrow=c(2,2))
# elev
plot(elevmap)
points(pres, cex=.5)
# temp
plot(tempmap)
points(pres, cex=.5)
# vege
plot(vegemap)
points(pres, cex=.5)
# prec
plot(precmap)
points(pres, cex=.5)
