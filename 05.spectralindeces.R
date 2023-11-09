#High reflectance on NIR, low RED. Index is NIR-RED. 
#Healthy plant has high index, less if it's not
#Other period check indices derived from RS imagery

library(imageRy) #unibo
library(terra)
library(ggplot2)
library(viridis)
im.list()
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# band 1: NIR, 2: red, 3: green
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m1992, 1, 2, 3) #red overlayed with NIR
im.plotRGB(m1992, 2, 1, 3) #green atop of NIR. dense vegetation
im.plotRGB(m1992, 2, 3, 1) #nir on top of the blue. soil is yellow.

# import the 2006 image - how it changes
m2006 <- im.import("matogrosso_ast_2006209_lrg")
im.plotRGB.user(m2006, 2, 3, 1) #plot the 2006 image with NIR in the Blue component of the RGB space

par(mfrow=c(1,2)) #concatenate, multiframe row
im.plotRGB.user(m1992, 2, 3, 1)
im.plotRGB.user(m2006, 2, 3, 1)

# Vegetation indexes: Calculating the DVI
#light reflected vs incident
m2006[1]  #quite a range. rescale w bits
#2 bit 4 states info, 3 has 8 (2^3)
#DVI= NIR-RED aka 1-2 , for each pixel
dvi1992 = m1992[[1]] - m1992[[2]]
plot(dvi1992)
#amount of healthy in 92, all green healthy, rest under 0 is soil or suffering
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black"))(100)
plot(dvi1992, col=cl)

# dvi2006
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

# since 2006 has less range, we normalize 0-1
# ndvi
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
#also ndvi1992 = dvi1992 /
ndvi2006 = ndvi2006 / (m2006[[1]] + m2006[[2]])

dev.off()
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# dvi by imageRy
dvi1992i <- im.dvi(m1992, 1, 2)
dvi2006i <- im.dvi(m2006, 1, 2)

# scientifically meaningful image for everyone!
clvir <- colorRampPalette(c("violet", "dark blue", "blue", "green", "yellow"))(100) # specifying a color scheme
plot(ndvi2006, col=clvir)
