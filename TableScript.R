#Read in CSV file
AllData = read.csv("ChixScores.csv")
AllData

#Calculate the overall chicken mean
chixMean <- mean(AllData$Score)
chixMean

#Find the number of tables
numTables <- length(unique(AllData$Table))
numTables

#Create a vector for table means
tableMeans <- numeric(numTables)
tableMeans

#find the table means
for(i in 1:numTables)
{
  tableMeans[i] <- mean(AllData$Score[AllData$Table==i])
}

tableMeans

#Create bias factor
biasFactors <- chixMean - tableMeans
biasFactors

#Find the number of teams
numTeams <- length(AllData$Team.Name)
numTeams

#Add Bias factor field to data frame
AllData$BiasFactor <- 0

#Loop over teams and add bias factor
for(j in 1:numTeams)
{
  
  AllData[[5]][j] <- biasFactors[AllData[[3]][j]]
}

#Add new score to data frame
AllData$NewScore <- AllData$Score + AllData$BiasFactor
AllData$NewScore

#Sort to find Find new rank
NewRankData <- AllData[order(-AllData[6]),]

#Add new rank
NewRankData$NewRank <- 1:numTeams

#Calculate change in rank
NewRankData$Change = NewRankData$Rank - NewRankData$NewRank

NewRankData





