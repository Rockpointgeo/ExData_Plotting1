# Set working directory
setwd("/Users/cwgeo/Documents/from_pc/personal/MOOCs/coursera/data science/04_exploratory_data_analysis/assignments/week1")
# load data
power_data_file <- "household_power_consumption.txt"
power_data <- read.table(power_data_file, header=TRUE, stringsAsFactors = FALSE, sep=";",
                         na.strings = "?")
all_date <- strptime(power_data$Date, "%d/%m/%Y")
start_date <- strptime("01/02/2007", "%d/%m/%Y")
end_date <- strptime("02/02/2007", "%d/%m/%Y")
ind <- all_date < start_date | all_date > end_date

power_data <- power_data[!ind,]
power_data$DateTime <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 1
png(file="plot1.png")
hist(power_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

# Plot 2
png(file="plot2.png")
plot(power_data$DateTime,power_data$Global_active_power,type="n", xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(power_data$DateTime,power_data$Global_active_power)
dev.off()

# Plot 3
png(file="plot3.png")
plot(power_data$DateTime,power_data$Sub_metering_1,type="n", xlab="", 
     ylab="Energy sub metering")
lines(power_data$DateTime,power_data$Sub_metering_1, col="black")
lines(power_data$DateTime,power_data$Sub_metering_2, col="red")
lines(power_data$DateTime,power_data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col= c("black", "red", "blue"), 
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

#Plot 4
png(file="plot4.png")
par(mfrow=c(2,2))
with(power_data,{
    plot(DateTime,Global_active_power,type="n", xlab="", 
         ylab="Global Active Power (kilowatts)")
    lines(DateTime,Global_active_power)
    plot(DateTime,Voltage,type="n", xlab="datetime", 
         ylab="Voltage")
    lines(DateTime,Voltage)
    plot(power_data$DateTime,power_data$Sub_metering_1,type="n", xlab="", 
         ylab="Energy sub metering")
    lines(power_data$DateTime,power_data$Sub_metering_1, col="black")
    lines(power_data$DateTime,power_data$Sub_metering_2, col="red")
    lines(power_data$DateTime,power_data$Sub_metering_3, col="blue")
    legend("topright", lty = 1, col= c("black", "red", "blue"), 
           legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type="n", xlab="datetime", 
         ylab="Global_reactive_power")
    lines(DateTime,Global_reactive_power)
})
