# Created by Wagner Doering
# doeringw@vcu.edu or wdoering@gmail.com

runKMeans <- function(){
	inp <- read.csv("T-Tests.csv", header = TRUE)

	x <- inp[2:	length(inp)]

	result <- kmeans(x,centers=4)
	result
}
