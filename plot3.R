df=read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

with(df[df$Date>=as.Date("2007-02-01") & df$Date<=as.Date("2007-02-02"),], {
    Date=as.Date(Date, "%d/%m/%Y")
    class(Global_active_power)="numeric"
    DateTime=as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")
    
    png(file = "figure/plot3.png", bg = "transparent", width=480, height=480)
    plot(x=DateTime, y=Sub_metering_1, type="l", xlab=NA, ylab="Energy sub metering")
    lines(x=DateTime, y=Sub_metering_2, col="red")
    lines(x=DateTime, y=Sub_metering_3, col="blue")
    legend("topright", lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
    dev.off()
})
