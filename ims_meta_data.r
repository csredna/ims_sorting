#set wd to IMS repository

b <- list.files(pattern = "ims.csv", full.names = TRUE)

readdata <- function(filename){
  
  c <- read.table(file = filename, sep = "\t", quote = "", nrows = 10, skip = 6, comment.char = "", colClasses = "character")
  
  temp <- t(c)[c(1,2,3,8,9,10)]
  #reading desired lines
  idiot <- matrix(unlist(strsplit(t(temp), split= ",")), ncol = 3, byrow = TRUE)[,3]
  #Getting values
  #names(idiot) <- matrix(unlist(strsplit(t(temp), split= ",")), ncol = 3, byrow = TRUE)[,2]
  #well should return the descritions of values, works but does not pass it on :-(
  return(idiot)
  #made me feel like an idiot for not beeing smarter.
  
  
  
}

table.o.data <- lapply(X = b, FUN  = readdata)
#hate this function



table.o.data <- as.data.frame(matrix(unlist(table.o.data), ncol = 6, byrow = TRUE))
#is this the best, i think not ..:-(

#get the names of the columns
c <- read.table(file = b[1], sep = "\t", quote = "", nrows = 10, skip = 6, comment.char = "", colClasses = "character")
temp <- t(c)[c(1,2,3,8,9,10)]
#adds the names to the dataframe
names(table.o.data) <- matrix(unlist(strsplit(t(temp), split= ",")), ncol = 3, byrow = TRUE)[,2]


write.csv2(table.o.data, "metadata.csv")
#yes im a bastard using csv2
