source("readfile.r")

powerData<-readfile()



png(file="plot1.png",width = 480, height = 480)

hist(powerData$Global_active_power,col = "red",
     main="Global Active Power",
     xlab="Global Active Power (killowatts)")


dev.off()



