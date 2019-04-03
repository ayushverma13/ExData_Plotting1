names_df = read.table("~/Documents/personal/Courses/3rd year/6th sem/Data Science john hopkins (PE2)/4.Exploratory Data Analysis/household_power_consumption.txt",
                     sep=";", 
                     na.strings="?",
                     header=TRUE,
                     nrows=5)
classes = sapply(names_df, class)
dataframe_plot2 = read.table("~/Documents/personal/Courses/3rd year/6th sem/Data Science john hopkins (PE2)/4.Exploratory Data Analysis/household_power_consumption.txt",
                sep=";", 
                na.strings="?",
                header=FALSE,
                colClasses=classes,
                nrows=2880, # subset for dates 2007-02-01
                skip=66637) # and 2007-02-02
colnames(dataframe_plot2) = colnames(names_df)

# format date and time attributes

dataframe_plot2$Date = as.Date(dataframe_plot2$Date, "%d/%m/%Y")
dataframe_plot2$DateTime = strptime(paste(dataframe_plot2$Date, dataframe_plot2$Time), "%Y-%m-%d %H:%M:%S")

# diagram creation

png(filename="plot2.png", width=480, height=480, units="px")

with(dataframe_plot2, plot(DateTime, Global_active_power,
              type="l",
              xlab="",
              ylab="Global Active Power (kilowatts)")
)

dev.off()
