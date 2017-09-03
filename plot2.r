source("readfile.r")
powerData<-readfile()

png(file="plot2.png",width = 480, height = 480)

plot(powerData$dateTime,powerData$Global_active_power,
     type="l", ylab="Global Active Power (Kilowatt)",
     xlab="")

dev.off()