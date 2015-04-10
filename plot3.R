#############################################################################################################
#
#  This is course project for course "Exploratory Data Analysis" https://www.coursera.org/course/exdata
#
#  Code in this file shold create plot the SubMetering Energy of time
#
#  To create plot run createPlot3() function
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


# createPlot3() function build plot the SubMetering Energy of time and save result in file "plot3.png"

createPlot3 <- function() {
        data <- loadData()
        
        png( filename = "plot3.png" ) # default size of png is 480 x 480 so no necessaty in additional parameters
        
        with( data, {
                plot( Time, Sub_metering_1, type = "l", col = "black", 
                      xlab = "", ylab = "Energy sub metering" )
                lines( Time, Sub_metering_2, col = "red" )
                lines( Time, Sub_metering_3, col = "blue" )
        })
        
        legend( "topright", lty = rep( 1, 3 ), col = c( "black", "red", "blue" ),
                legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ) )
        
        dev.off()
}
