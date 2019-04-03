# cto convert day names to engish

Sys.setlocale("LC_TIME", "English")

names_df = read.table("~/Documents/personal/Courses/3rd year/6th sem/Data Science john hopkins (PE2)/4.Exploratory Data Analysis/household_power_consumption.txt",
                     sep=";", 
                     na.strings="?",
                     header=TRUE,
                     nrows=5)
classes = sapply(names_df, class)
dataframe_plot3 = read.table("~/Documents/personal/Courses/3rd year/6th sem/Data Science john hopkins (PE2)/4.Exploratory Data Analysis/household_power_consumption.txt",
                sep=";", 
                na.strings="?",
                header=FALSE,
                colClasses=classes,
                nrows=2880, # subset for dates 2007-02-01
                skip=66637) # and 2007-02-02
colnames(dataframe_plot3) = colnames(names_df)

# format date and time attributes

dataframe_plot3$Date = as.Date(dataframe_plot3$Date, "%d/%m/%Y")
dataframe_plot3$DateTime = strptime(paste(dataframe_plot3$Date, dataframe_plot3$Time), "%Y-%m-%d %H:%M:%S")

# diagram creation

png(filename="plot3.png", width=480, height=480, units="px")


with(dataframe_plot3, {
  plot(DateTime, Sub_metering_1,
       col="black",
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2,
        col="red")
  lines(DateTime, Sub_metering_3,
        col="blue")
  legend("topright", 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"),
         lty=1)
}
)

dev.off()
