names_df = read.table("~/Documents/personal/Courses/3rd year/6th sem/Data Science john hopkins (PE2)/4.Exploratory Data Analysis/household_power_consumption.txt",
                     sep=";", 
                     na.strings="?",
                     header=TRUE,
                     nrows=5)
classes = sapply(names_df, class)
dataframe_plot1 = read.table("~/Documents/personal/Courses/3rd year/6th sem/Data Science john hopkins (PE2)/4.Exploratory Data Analysis/household_power_consumption.txt",
                sep=";", 
                na.strings="?",
                header=FALSE,
                colClasses=classes,
                nrows=2880, # subset for dates 2007-02-01
                skip=66637) # and 2007-02-02
colnames(dataframe_plot1) = colnames(names_df)

# plot 1

png(filename="plot1.png", width=480, height=480, units="px")

hist(dataframe_plot1$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()

