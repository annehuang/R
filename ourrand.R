# This was used to process the data for our CS 502 Computational Biology Project at the University of Illinois at Chicago, for the spring of 2017.

sink("rand.txt", append=FALSE, split=FALSE)

library("igraph")

#c combines these items into a list or vector
for (task in c("M", "R", "N")){
	for (subject in c("HC", "DZ")){
		#http://stackoverflow.com/questions/14420936/error-in-filefile-rt-invalid-description-argument-in-complete-cases-pro
		path <- paste(task, subject, sep="")
		
		#This takes as the parameter the name of the file.
		df<-read.csv(paste("C:/", path, ".csv", sep=""))

		#http://stackoverflow.com/questions/13706188/importing-csv-file-into-r-numeric-values-read-as-characters

		num_data<-data.frame(data.matrix(df))
		
		#sapply accepts a list and a function. It applies the function to every entry in the list (here, num_data).
		#Here, the function is defined in the call to sapply.
		#as.numeric converts the entry into numeric
		numeric_columns <- sapply(num_data,function(x){as.numeric(x)})

		#http://stackoverflow.com/questions/7615450/getting-a-row-from-a-data-frame-as-a-vector-in-r

		print(path)
		for(i in 1:ncol(numeric_columns)){
			for (j in 1:ncol(numeric_columns)){
				if (i != j){
					print(compare(as.numeric(numeric_columns[,i]), as.numeric(numeric_columns[,j]), method="rand"))
				}
			}
		}
	}
}
