df=read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

with(df[df$Date>=as.Date("2007-02-01") & df$Date<=as.Date("2007-02-02"),], {
    Date=as.Date(Date, "%d/%m/%Y")
    class(Global_active_power)="numeric"
    DateTime=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")
    
    png(file = "figure/plot2.png", bg = "transparent", width=480, height=480)
    plot(x=DateTime, y=Global_active_power, type="l", xlab=NA, ylab="Global Active Power (killowatts)")
    dev.off()
})
