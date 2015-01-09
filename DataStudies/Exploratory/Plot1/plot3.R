##To set the language of weekdays to English on Linux, add Sys.setlocale("LC_TIME", "C") 

## Getting the data
   temp <- tempfile()
   download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              temp,method="curl")
   ttable <- read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";",
                     colClasses="character")
   unlink(temp)
##Gets the needed piece
   ttable<-ttable[(ttable$Date=="1/2/2007")|(ttable$Date=="2/2/2007"),]
## Correct date format
   ttable$Date<-strptime(paste(ttable$Date,ttable$Time),format="%d/%m/%Y %H:%M:%S")
## Making parameters numeric   
   ttable$Sub_metering_1<-as.numeric(ttable$Sub_metering_1)
   ttable$Sub_metering_2<-as.numeric(ttable$Sub_metering_2)
   ttable$Sub_metering_3<-as.numeric(ttable$Sub_metering_3)
## Drawing to file
   png(filename = "plot3.png", width = 480, height = 480, units = "px")
      with(ttable,plot(Date,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
      lines(ttable$Date, ttable$Sub_metering_2, col = "red")
      lines(ttable$Date, ttable$Sub_metering_3, col = "blue")
      legend("topright", lwd=2, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
   dev.off()