#CSC : Control-Saline-C/S      
#CMC : Control-Memantine-C/S
#TMC : Ts65Dn-Memantine-C/S
#TSC : Ts65Dn-Saline-C/S
#CSS : Control-Saline-S/C
#CMS : Control-Memantine-S/C
#TSS : Ts65Dn-Saline-S/C
#TMS : Ts65Dn-Memantine-S/C



myFunction <- function(){

	inp <- read.csv("hippocampus.csv", header = TRUE)
	subsetCSC <- subset(inp, class=="CSC", )
	subsetCSS <- subset(inp, class=="CSS", )

	subsetCMC <- subset(inp, class=="CMC", )
	subsetCMS <- subset(inp, class=="CMS", )

	subsetTMC <- subset(inp, class=="TMC", )
	subsetTMS <- subset(inp, class=="TMS", )

	subsetTSC <- subset(inp, class=="TSC", )
	subsetTSS <- subset(inp, class=="TSS", )
	

	resultSet1 <- list()
	resultSet2 <- list()
	resultSet3 <- list()
	resultSet4 <- list()

	#iterate through all the proteins to compare "learning" against "non-learning"
	
	tableLimit <- length(subsetCSC) - 4

	
	for(i in 2:tableLimit){
		testResult <- t.test(subsetCSC[i], subsetCSS[i])
		#prepare each proteins results
		proteinName <- names(subsetCSC[i])
		means <- testResult$estimate
		pVal <- testResult$p.value
		meansX <-means[[1]]
		meansY <-means[[2]]
		vectorColumn <-c(proteinName, meansX,meansY, pVal)
		resultSet1 <- rbind(resultSet1,vectorColumn)
			
		}
	for(i in 2:tableLimit){
		testResult <- t.test(subsetCMC[i], subsetCMS[i])
		#prepare each proteins results
		proteinName <- names(subsetCSC[i])
		means <- testResult$estimate
		pVal <- testResult$p.value
		meansX <-means[[1]]
		meansY <-means[[2]]
		vectorColumn <-c(meansX,meansY, pVal)
		resultSet2 <- rbind(resultSet2,vectorColumn)
			
		}
		finalSet<- cbind(resultSet1,resultSet2)

	for(i in 2:tableLimit){
		testResult <- t.test(subsetTMC[i], subsetTMS[i])
		#prepare each proteins results
		proteinName <- names(subsetCSC[i])
		means <- testResult$estimate
		pVal <- testResult$p.value
		meansX <-means[[1]]
		meansY <-means[[2]]
		vectorColumn <-c(meansX,meansY, pVal)
		resultSet3 <- rbind(resultSet3,vectorColumn)
			
		}
	for(i in 2:tableLimit){
		testResult <- t.test(subsetTSC[i], subsetTSS[i])
		#prepare each proteins results
		proteinName <- names(subsetCSC[i])
		means <- testResult$estimate
		pVal <- testResult$p.value
		meansX <-means[[1]]	
		meansY <-means[[2]]
		vectorColumn <-c(meansX,meansY, pVal)
		resultSet4 <- rbind(resultSet4,vectorColumn)
			
		}

	finalSet<- cbind(finalSet,resultSet3,resultSet4)
	

	#write results to a file
	write.csv(finalSet, "T-Tests.csv")


	

}

