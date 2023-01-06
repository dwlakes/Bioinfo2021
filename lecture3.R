# First R assignmentassignment

# set working directory
setwd("/Users/dwlakes/Bioinfo2021")

# Load the fasta file into R
mtNd1 <- readLines("data/mt-Nd1.fasta.txt")

mtNd1

# Using square brackets we can look into the object we just created, e.g. mtNd1[2] gets the 2nd 
# line out of the file mtNd1[15] gets the 15th line. If we want to know the composition of some 
# lines,  we can use the table command to give us an overview of the elements present.

mtNd1[2]

strsplit(mtNd1[15],"")

table(strsplit(mtNd1[15],"")[[1]])

# The second statement however is when we split up the characters in the second string mtNd1[2] by using
# the strsplit function we get a nice tabulated representation of our DNA data. How many A’s are there in this       
# sequence?

table(strsplit(mtNd1[2],"")[[1]])
# 13 As

# Print first letter of each line
for (line in mtNd1){
	firstLetter <- unlist(strsplit(line, ""))[1]
	if(is.na(firstLetter)){
		cat("EMPTY!!!\n")
	}else{
		if(firstLetter == ">"){
			cat("IDENTIFIER!!!\n")
		}else{
			cat("SEQUENCE!!!\n")
		}	
	}
	
}