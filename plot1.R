#############################################################################################################
#
#  This is course project for course "Exploratory Data Analysis" https://www.coursera.org/course/exdata
#
#  Code in this file shold create histogramm of "Global Active Power" data with specified plotting format 
#  and save result in file "plot1.png"
#
#  To create plot run createPlot1() function
#
#  Code written by Nadezda Strikovskaya
#  GitHub account: https://github.com/bagiran/
#
#  NB: From my point of view more effective to move loadData function in separate module. 
#      But it's incorrect according cource list of required files.
#      To avoid multiple loadData() function I store it in plot1.R file and load this file.
#
#############################################################################################################


#  loadData() function loads data from "./data/household_power_consumption.txt" file
#  if file doesn't exists dunction automatically dounload and unpack data in ./data folder

loadData <- function() {
        
        # check data existance
        if ( !file.exists( "./data/household_power_consumption.txt" ) ) {
                dir.create( "./data", showWarnings = FALSE )
                
                if ( !file.exists( "./data/data.zip" ) )
                        download.file( "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                                       "./data/data.zip" )
                
                unzip( "./data/data.zip", exdir="./data" )
        }
        
        # loading of whole table with date and time like characters requires about 150 Mb and it's not big value, 
        # but let's read only data in which we're intersted in (2007-02-01 and 2007-02-02)
        # they located in rows 66638 - 69517 (2880 rows)
        
        # I know that reading strings in data field and using data.frame instead of data.tables 
        # has less efficiency and need more memory
        # Selected way is fast enougth (0.25 sec on my PC) on requested task so it's acceptable
        # But more amount of data may require optimization
        
        # I need read header before reading data, because header is in 1st row and loaded data are far far away
        header <- readLines( "./data/household_power_consumption.txt", n = 1 )
        
        data <- read.table( "./data/household_power_consumption.txt", header = FALSE, sep = ";",
                            na.strings = "?",
                            colClasses = c( rep( "character", 2 ), rep( "numeric", 7 ) ),
                            col.names = unlist( strsplit( header, ";" ) ), skip = 66637, nrows = 2880 )
        
        # construct from strings Date and Time one global time object and remove unused data
        
        data$Time <- as.POSIXct( paste( data$Date, data$Time ), format = "%d/%m/%Y %H:%M:%S" )
        data$Date <- NULL
        
        data
}


# createPlot1() function build Global Active Power histogramm and save result in file "plot1.png"

createPlot1 <- function() {
        data <- loadData()
        
        png ( filename = "plot1.png" ) # default size of png is 480 x 480 so no necessaty in additional parameters
        
        # draw Global Active Power historgamm with red color and custom labels
        hist( data$Global_active_power, breaks = seq( 0, 7.5, 0.5 ), col = "red", 
              main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )

        dev.off()
}
