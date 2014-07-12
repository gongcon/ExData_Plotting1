df=read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

with(df[df$Date>=as.Date("2007-02-01") & df$Date<=as.Date("2007-02-02"),], {
    Date=as.Date(Date, "%d/%m/%Y")
    class(Global_active_power)="numeric"
    
    png(file = "figure/plot1.png", bg = "transparent", width=480, height=480)
    hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)", ylab="Frequency", col="red" )
    dev.off()
})
