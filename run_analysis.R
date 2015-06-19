run_analysis <- function(){
        library(dplyr)
        
        # read training data
        x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
        subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        # read test data
        x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
        subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        # read features
        feat <- read.table("./UCI HAR Dataset/features.txt")
        # read activity labels
        act <- read.table("./UCI HAR Dataset/activity_labels.txt")
        
        # combine subject, activity and data columns for train and test
        df_train <- cbind(subj_train, y_train, x_train)
        df_test <- cbind(subj_test, y_test, x_test)
        # combine both to data frame
        df <- rbind(df_train, df_test)
        
        # get column names, make.names provides syntactically valid names
        col.names <- make.names(c("Subject", "Activity", 
                                  as.character(feat[, 2])))
        # assign colnames
        colnames(df) <- col.names
        # remove duplicates
        df <- df[!duplicated(names(df))]
        # select Subject, Activity, mean and std columns
        final_df <- select(df, 1:2, contains(".mean."), contains(".std."))
        
        # set activity names
        final_df <- within(final_df, 
                           Activity <- factor(Activity, labels = act$V2))
        
        # group df by activity and subject
        grouped_df <- group_by(final_df, Activity, Subject)
        # summarise each non grouping variable (calculate mean)
        # into df that answers step 5 of assignment
        result <- summarise_each(grouped_df, funs(mean))
        write.table(result, file = "tidy_data.txt",row.name = FALSE)
        
        
}