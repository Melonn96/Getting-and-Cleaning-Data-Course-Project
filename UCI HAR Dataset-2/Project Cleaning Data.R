# 1. Reading Features and Activity Data
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

# 2. Reading Train Data
train <- read.table("./train/X_train.txt") #Features data
colnames(train) <- features$V2  #descriptive column names for data (STEP 4)
y_train <- read.table("./train/y_train.txt") #activity labels
train$activity <- y_train$V1
subject_train <- read.table("./train/subject_train.txt") #subjects
train$subject <- factor(subject_train$V1)

# 3. Reading Test Data
test <- read.table("./test/X_test.txt")
colnames(test) <- features$V2
y_test <- read.table("./test/y_test.txt") 
test$activity <- y_test$V1
subject_test <- read.table("./test/subject_test.txt")
test$subject <- factor(subject_test$V1)

# 4. Merge Train and Test Sets (STEP 1)
dataset <- rbind(test, train) 

# 5. Filter Column Names (STEP 2)
column.names <- colnames(dataset)

# Get only columns for standard deviation and mean values, also saves activity and subject values 
column.names.filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", column.names, value=TRUE)
dataset.filtered <- dataset[, column.names.filtered] 

# 6. Adding descriptive values for activity labels (STEP 3)
dataset.filtered$activitylabel <- factor(dataset.filtered$activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# 7. Creating a tidy dataset with mean values for each subject and activity
features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)
dataset.melt <-melt(dataset.filtered, id = c('activitylabel', 'subject'), measure.vars = features.colnames)
dataset.tidy <- dcast(dataset.melt, activitylabel + subject ~ variable, mean)

