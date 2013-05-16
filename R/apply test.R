myFunctionV2 <- function(){

	inp <- read.csv("hippocampus.csv", header = TRUE)
	inp <- matrix(inp)
	results <- apply(inp, 2,function(inp){
	})
	
	write.csv(resultSet, "T-TestsWithApply.csv")
	
}