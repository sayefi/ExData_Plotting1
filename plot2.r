
library(dplyr)


fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

dataUrl<-"household_power_consumption.txt"

tempUrl<-"tempfile.txt"


if(!file.exists(tempUrl)){
     download.file(fileUrl,"input.zip")
     unzip("input.zip")
     
     tmpData<-read.csv(dataUrl,
                         na.strings = "?",sep = ";", stringsAsFactors=F)
     
     
     str(tmpData)

     powerData<-subset(tmpData, Date=="1/2/2007"|Date=="2/2/2007")
     
     
     write.csv(powerData,tempUrl,sep=";",na="?",row.names = F)
     
} else {
     powerData<-read.csv(tempUrl,na="?", stringsAsFactors=F)
}



powerData<-mutate(powerData, 
                  dateTime<-as.POSIXct(strptime(
                       paste(powerData$Date, powerData$Time, sep = " "),
                       "%d/%m/%Y %H:%M:%S")))


colnames(powerData)[10]<-"dateTime"



png(file="plot2.png",width = 480, height = 480)

plot(powerData$dateTime,powerData$Global_active_power,
     type="l", ylab="Global Active Power (Kilowatt)")


dev.off()




powerData$Date.
head(powerData)

str(powerData)




hist(powerData$Global_active_power,col = "red",
     main="Global Active Power",
     xlab="Global Active Power (killowatts)")



# hist(powerData$Global_active_power,col = "red")
# title(main="Global Active Power")
# title(xlab="Global Active Power (killowatts)")

dev.off()



