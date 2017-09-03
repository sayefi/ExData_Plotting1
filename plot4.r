source("readfile.r")
powerData<-readfile()

png(file="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))


plot(powerData$dateTime,powerData$Global_active_power, type="l",xlab="",
     ylab="Global Active Power")
          

plot(powerData$dateTime,powerData$Voltage, type="l",xlab="datetime",
     ylab="Voltage")
          

plot(powerData$dateTime,powerData$Sub_metering_1,
     type="l",col="black",ylab="",xlab="")

lines(powerData$dateTime,powerData$Sub_metering_2,
      type="l",col="blue")

lines(powerData$dateTime,powerData$Sub_metering_3,
      type="l",col="red")

title(ylab="Energy sub metering")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","blue","red"),lty=1)


plot(powerData$dateTime,powerData$Global_reactive_power, type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()