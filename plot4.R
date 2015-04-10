#############################################################################################################
#
#  This is course project for course "Exploratory Data Analysis" https://www.coursera.org/course/exdata
#
#  Code in this file shold create combining plot for measured data presentation
#
#  To create plot run createPlot4() function
#
#  Code written by Nadezda Strikovskaya
#  GitHub account: https://github.com/bagiran/
#
#  NB: From my point of view more effective to move loadData function in separate module. 
#      But it's incorrect according cource list of required files.
#      To avoid multiple loadData() function I store it in plot1.R file and load this file.
#
#############################################################################################################


# function loadData() stores in "./plot1.R" file and loads separately to 
# avoid problem of difference in data preprocessing for plots

source( "./plot1.R" )


# createPlot4() function build combining plot for measured data presentation of time and save result in file "plot4.png"

createPlot4 <- function() {
        data <- loadData()
        
        png( filename = "plot4.png" ) # default size of png is 480 x 480 so no necessaty in additional parameters
        
        par( mfrow = c( 2, 2 ) ) # setup combined plot
        
        # NB: From my point of view labels "Global_relative_power and "datetime" looks ugly
        #     And other labels have different writing rules
        #     But they're requested by cource so I had to leave them as they are :(
        
        with( data, { 
                # this plot looks like Global Active Power from plot2 but it has different y-label
                plot( Time, Global_active_power, type = "l", 
                      xlab = "", ylab = "Global Active Power" )
        
                # plot voltage
                plot( Time, Voltage, type = "l", xlab = "datetime" )
        
                # this plot looks like Energy Sub Metering plot from plot3 but has different legend
                plot( Time, Sub_metering_1, type = "l", col = "black", 
                      xlab = "", ylab = "Energy sub metering" )
                lines( data$Time, data$Sub_metering_2, col = "red" )
                lines( data$Time, data$Sub_metering_3, col = "blue" )
        
                legend( "topright", bty = "n", lty = rep( 1, 3 ), col = c( "black", "red", "blue" ),
                        legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )
        
                # plot global relative power
                plot( Time, Global_reactive_power, type = "l", xlab = "datetime" )
        })
        
        dev.off()
}