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
## Correct data format
   ttable$Date<-strptime(paste(ttable$Date,ttable$Time),format="%d/%m/%Y %H:%M:%S")
   ttable[,3]<-as.numeric(ttable[,3])
## Drawing to file
   png(filename = "plot2.png", width = 480, height = 480, units = "px")
   with(ttable,plot(Date,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
   dev.off()
