#Main specie for wood: Vaia storm
#Climax stability for everyone... but Lorentz effect. Chaos by Gleick. Stable is dying

#***********
# MULTIVAR
#***********

library(vegan)

data(dune)
ord <- decorana(dune)
ord

# Call:
# decorana(veg = dune) 

# Detrended correspondence analysis with 26 segments.
# Rescaling of axes with 4 iterations.

#                   DCA1   DCA2
# Eigenvalues     0.5117 0.3036
# Decorana values 0.5360 0.2869
# Axis lengths    3.7004 3.1166
#                    DCA3    DCA4
# Eigenvalues     0.12125 0.14267
# Decorana values 0.08136 0.04814
# Axis lengths    1.30055 1.47888

ldc1 =  3.7004 
ldc2 =  3.1166 
ldc3 = 1.30055
ldc4 = 1.47888

total = ldc1 + ldc2 + ldc3 + ldc4

pldc1 = ldc1 * 100 / total
pldc2 = ldc2 * 100 / total
pldc3 = ldc3 * 100 / total
pldc4 = ldc4 * 100 / total

pldc1
pldc2

pldc1 + pldc2

plot(ord)


#*************
# OVERLAP
#***********

# camera traps data
# data from Kerinci-Seblat National Park in Sumatra, Indonesia (Ridout and Linkie, 2009)
# Ridout MS, Linkie M (2009). Estimating overlap of daily activity patterns from camera trap data. 
# Journal of Agricultural, Biological, and Environmental Statistics, 14(3), 322–337.

install.packages("overlap")
library(overlap)
# https://cran.r-project.org/web/packages/overlap/vignettes/overlap.pdf


# data
data(kerinci)
head(kerinci)

# tiger
# The unit of time is the day, so values range from 0 to 1. 
# The package overlap works entirely in radians: fitting density curves uses trigonometric functions (sin, cos, tan),
# so this speeds up simulations. The conversion is straightforward: kerinci$Time * 2 * pi
kerinci$timeRad <- kerinci$Time * 2 * pi

# selecting the first species
tiger <- kerinci[kerinci$Sps=="tiger",]

# selecting the time for the tiger
timetig <- tiger$timeRad
densityPlot(timetig, rug=TRUE)

# selecting the second species
maca <- kerinci[kerinci$Sps=="macaque",]

# selecting the time for the tiger
timemaca <- maca$timeRad
densityPlot(timemaca, rug=TRUE)

# overlap!
overlapPlot(timetig, timemaca)
legend('topright', c("Tigers", "Macaques"), lty=c(1,2), col=c("black","blue"), bty='n')       

# species
kerinci$Sps
summary(kerinci$Sps)

# tapir
tap <- timeRad[kerinci$Sps == 'tapir']
overlapPlot(mac, tap)
legend('topright', c("Macaques", "Tapirs"), lty=c(1,2), col=c("black","blue"), bty='n')       


#******** 2 ******
# relation among species in time

library(overlap)

data(kerinci)
summary(kerinci)

kerinci$timeRad <- kerinci$Time * 2 * pi

tiger <- kerinci[kerinci$Sps=="tiger",]

timetig <- tiger$timeRad
densityPlot(timetig, rug=TRUE)

# exercise: select only the data on macaque individuals
macaque <- kerinci[kerinci$Sps=="macaque",]
head(macaque)

timemac <- macaque$timeRad
densityPlot(timemac, rug=TRUE)

overlapPlot(timetig, timemac)
