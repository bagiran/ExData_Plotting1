#############################################################################################################
#
#  This is course project for course "Exploratory Data Analysis" https://www.coursera.org/course/exdata
#
#  Code in this file shold create plot the Global Active Power of time
#
#  To create plot run createPlot2() function
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


# createPlot2() function build plot the Global Active Power of time and save result in file "plot2.png"

createPlot2 <- function() {
        data <- loadData()
        
        png( filename = "plot2.png" ) # default size of png is 480 x 480 so no necessaty in additional parameters
        
        with ( data, plot( Time, Global_active_power, type = "l", 
                           xlab = "", ylab = "Global Active Power (kilowatts)" ) )
        
        dev.off()
}
