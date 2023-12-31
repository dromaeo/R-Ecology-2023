# This is a script to visualize satellite data

library(devtools)
# install the imageRy package from GitHub
devtools::install_github("ducciorocchini/imageRy")
library(imageRy)
library(terra)

duccio <- 10 + 10
duccio # objects
adam <- 5 + 3
duccio + adam
# arrays
diameter <- c(100, 10, 50, 20, 15)
iron <- c(10, 1000, 20, 700, 900)
plot(iron, diameter) # iron and diameter are arguments of a function # https://www.google.com/search?client=ubuntu-sn&hs=Ssn&sca_esv=564367827&channel=fs&sxsrf=AB5stBhOTkEGpHkLRMvuoUQuTCdqYjKtEw:1694448980289&q=pch+in+R&tbm=isch&source=lnms&sa=X&ved=2ahUKEwjzmr2s-qKBAxUOGuwKHUdlAnMQ0pQJegQIDBAB&biw=960&bih=484&dpr=2#imgrc=lUw3nrgRKV8ynM
plot(iron, diameter, pch=19, cex=2, col="red")
?plot()

# now we will use a package
im.list()
# importing data
b2 <- im.import("sentinel.dolomites.b2.tif") # b2 is the blue wavelength
b2 # blue band
b3 <- im.import("sentinel.dolomites.b3.tif")
b3 # green band
b4 <- im.import("sentinel.dolomites.b4.tif")
b4 # red band
b8 <- im.import("sentinel.dolomites.b8.tif")
b8 # NIR band infrared

cl=colorRampPalette(c("black","dark grey","light grey")) (100)
plot(b2, col=cl)
stacksent<-c(b2, b3, b4, b8)
plot(stacksent, col=cl)
dev.off() #cleans graph
#We do want to store as points

par(mfrow=c(2,2))
cl <- colorRampPalette(c("dark blue", "blue", "light blue")) (100) # 100 is the amount of colours in the gradient
plot(b2, col=cl)
clg <- colorRampPalette(c("dark green", "green", "light green")) (100) # 100 is the amount of colours in the gradient
plot(b3, col=clg)
clr <- colorRampPalette(c("dark red", "red", "pink")) (100) # 100 is the amount of colours in the gradient
plot(b4, col=clr)
cln <- colorRampPalette(c("brown", "orange", "yellow")) (100) # 100 is the amount of colours in the gradient
plot(b8, col=cln)
dev.off() 

# To compose image in colors Rb4 Gb3 Bb2 and b8 each band to a RGB. We see all bands together
#stack
#band2 blue element1 stacksent[[1]]
#b3 green 2
#b4 red 3
#b8 nir 4
im.plotRGB(stacksent, r=3, g=2, b=1) # it plots the first three layers in the RGB components
im.plotRGB(stacksent, r=4, g=3, b=2)
im.plotRGB(stacksent, r=3, g=4, b=2)
im.plotRGB(stacksent, r=3, g=2, b=4)

  #EXAM:
  #GIT comments, project, 10min presentation questions on what's used. 

#We can compare functions in pairs (Pear.'s correlation)
# ?pairs
pairs(stacksent)
#All bands are correlated with each other
# reflectance int not float
# histograms: each value of reflectance
