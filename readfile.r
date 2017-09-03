library(dplyr)

readfile<-function(){
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
     
     
     powerData
}