pollutantmean <- function(directory, pollutant, id = 1:332) {
	# a helper function to simplify reading data	
    get_column_from_csv <- function(filename, column)
    {
    	data_frame <- read.csv(filename)
    	vec <- data_frame[column]
    	vec <- vec[!is.na(vec)]

    	vec
    }

    v <- vector()
    for (i in id)
    {
    	# reformatting the filename string to match the given dataset
    	filename <- sprintf("%s/%03d.csv", directory, i)
    	v <- c(v, get_column_from_csv(filename, pollutant))
    }

    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    mean(v)
   
}