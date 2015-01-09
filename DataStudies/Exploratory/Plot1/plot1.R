temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              temp,method="curl")
ttable <- read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";",
                     colClasses="character")
unlink(temp)
ttable<-ttable[(ttable$Date=="1/2/2007")|(ttable$Date=="2/2/2007"),]
ttable[,3]<-as.numeric(ttable[,3])
png(filename = "plot1.png", width = 480, height = 480, units = "px")
with(ttable,hist(Global_active_power, col="red",main="Global Active Power", 
                 xlab="Global Active Power (kilowatts)"))
dev.off()
