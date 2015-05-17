complete <- function(directory, id = 1:332) {

        # a simple helper function to get count of complete data cases in specified file
        get_valid_count_from_csv <- function(filename)
        {
                data_frame <- read.csv(filename)
                sum(complete.cases(data_frame))
        }

        data <- data.frame()
        
        for(i in id)
        {
                filename <- sprintf("%s/%03d.csv", directory, i)
                row <- c(i, get_valid_count_from_csv(filename))
                data <- rbind(data, row)
        }

        colnames(data) <- c("id", "nobs")
        data
}
