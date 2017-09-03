source("readfile.r")
powerData<-readfile()

png(file="plot3.png",width = 480, height = 480)


plot(powerData$dateTime,powerData$Sub_metering_1,
     type="l",col="black",ylab="",xlab="")

lines(powerData$dateTime,powerData$Sub_metering_2,
      type="l",col="blue")

lines(powerData$dateTime,powerData$Sub_metering_3,
      type="l",col="red")

title(ylab="Energy sub metering")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","blue","red"),lty=1)

dev.off()

