corr <- function(directory, threshold = 0) {
        
        # a simple helper function to get count of complete data cases in specified file
        get_valid_count_from_csv <- function(filename)
        {
            data_frame <- read.csv(filename)
            sum(complete.cases(data_frame))
        }

        # a helper function to simplify reading data	
	    get_valid_data_from_csv <- function(filename)
	    {
            data_frame <- read.csv(filename)
            new_data <- cbind(data_frame$sulfate, data_frame$nitrate)

            new_data[complete.cases(new_data),]
	    }

        v <- vector()

        # enumerate all csv files inside directory
        list_of_files <- list.files("specdata", "^.*\\.csv$")
        for(filename in list_of_files)
        {
        	full_filename = sprintf("%s/%s", directory, filename)

	        if (get_valid_count_from_csv(full_filename) > threshold)
	        {
	        	valid_data <- get_valid_data_from_csv(full_filename)
	        	v <- c(v, cor(valid_data[,1], valid_data[,2])[1][1])
	        }
	    }


        v
 }