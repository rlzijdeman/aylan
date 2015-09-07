# File: nl_asylum_requests_population_01.R
# Date: 2015-09-07
# Author: richard.zijdeman@iisg.nl
# Purpose: to show trends in population size and asylum requests
# Last change: none.

# clear workspace
rm(list = ls())

# Libraries
library(ggplot2)
require(gridExtra)

# Data from CBS Statline
# Hyperlink to tabel
# http://statline.cbs.nl/Statweb/publication/?VW=T&DM=SLNL&PA=80059NED&D1=0&D2=0-3,5,12,15,17-18,21,23,25-26,51,53-54,l&D3=a&HD=150907-1303&HDR=T,G2&STB=G1
# Hyperlink to download-screen
# http://statline.cbs.nl/Statweb/publication/?VW=D&DM=SLNL&PA=80059NED&D1=0&D2=0-3,5,12,15,17-18,21,23,25-26,51,53-54,l&D3=a&HD=150907-1303&HDR=T,G2&STB=G1

# Total of Asylum Requests (art)
art <- c(1330, 750, 1215, 2015, 2605, 5645, 5865, 13460, 7485, 13900, 21210, 21615, 20345, 
         35400, 52575, 29260, 22855, 34445, 45215, 39305, 43560, 32580, 18665, 13400, 9780, 
         12345, 14465, 9730, 15275, 16165, 15155, 14630, 13170, 17190, 29890) 
        # NB: # special values for 2012 and 2013

years <- c(1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014)


# Population size, since 1980
# Hyperlink to tabel
# http://statline.cbs.nl/Statweb/publication/?VW=T&DM=SLNL&PA=37296NED&D1=0&D2=a&HD=150907-1309&HDR=G1&STB=T
# Hyperlink to downloadscreen
# http://statline.cbs.nl/Statweb/publication/?VW=D&DM=SLNL&PA=37296NED&D1=0&D2=a&HD=150907-1309&HDR=G1&STB=T
pop <- c(14091014, 14208586, 14285829, 14339551, 14394589, 14453833, 14529430, 14615125, 14714948, 14805240, 14892574, 15010445, 15129150, 15239182, 15341553, 15424122, 15493889, 15567107, 15654192, 15760225, 15863950, 15987075, 16105285, 16192572, 16258032, 16305526, 16334210, 16357992, 16405399, 16485787, 16574989, 16655799, 16730348, 16779575, 16829289)


# Creating the graph
df <- as.data.frame(cbind(years, pop, art))

p1 <- ggplot(df, aes(years, pop)) + geom_bar(stat = "identity", fill = "white") +
        labs(x = "Time (years)", y = "Total Dutch Population")
p2 <- ggplot(df, aes(years, art)) + geom_bar(stat = "identity", fill = "red") +
        labs(x = "Time (years)", y = "Total Asylum requests (including follow ups)")

p1
p2
p3 <- p1 + geom_bar(aes(years, art), stat = "identity", fill = "red") +
        labs(x = "Time (years)", y = "Nr. of Dutch (white) / Total Asylum request (red)")

p3

# combine the plots
ppi <- 300
png("./graphs/NL_asylum_requests_population_01.png", width = 16*ppi, height = 12*ppi, res = ppi,)
grid.arrange(p1, p2, p3, ncol=2)
dev.off()

# EOF