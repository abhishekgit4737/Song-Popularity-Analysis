?read.csv
getwd()
setwd("c:\\Users\\abhis\\OneDrive\\Documents\\summerCourse\\project\\")
songstats<-read.csv("Songs_dataset.csv")
View(songstats)

nrow(songstats)
ncol(songstats)
dim(songstats)
head(songstats[, c("Artist","Track","Views")],n=10)
tail(songstats[, c("Artist","Track","Views")],n=10)
str(songstats)#structure
summary(songstats)
songstats$Album


songstats[4:30, c("Artist","Track","Views")]
songstats[c(2,7), c("Artist","Track","Views")]
#check whether the first row of a songstats is itself a data frame
is.data.frame(songstats[1,])

songstats$Energy_Loudness_Ratio <- songstats$Energy / songstats$Loudness
head(songstats[, c("Track","Energy","Loudness","Energy_Loudness_Ratio")],n=10)

songstats$Energy_Loudness_Ratio<-NULL
head(songstats[, c("Track","Energy","Loudness","Energy_Loudness_Ratio")],n=10)
head(songstats[, c("Track","Energy","Loudness")],n=10)


#filtering
library(dplyr)

#display all song tracks that crossed 2 billion views
filter1 <- songstats %>%
  filter(Views > 2000000000) %>%
  select(Track, Views, Likes,Energy)
filter1

#display Coldplay Track
filter2 <- filter(songstats, Artist == "Coldplay")
filter2[,c("Track","Album","Energy")]

#display in descending order of Views the Track details of Drake's Her Loss album
filter3 <- filter(songstats, Artist == "Drake", Album == "Her Loss") %>%
  arrange(desc(Views))
filter3[,c("Artist","Album","Track","Views")]

filter4 <- filter(songstats, Artist %in% c("Eminem", "Shakira") , Danceability > 0.7)%>%
  arrange(desc(Danceability))
filter4[,c("Artist","Track","Danceability")]

#quick plot
?qplot
library("ggplot2")
qplot(data=filter3,x=Track, y=Views,size=I(3)) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
qplot(data = filter1, x = Track, y = Views, size = I(3),colour="Views",shape=I(2),main="1 BILLION+ VIEWS" ,geom = "boxplot") + theme(axis.text.x = element_text(angle = 90, hjust = 1))

qplot(data = filter4, x = Track, y = Danceability, colour = Likes) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
                                                                    
#ggplot
ggplot(data = filter2, aes(x = Track, y = Energy, colour = Energy, group = 1)) +
  geom_point() +
  geom_line() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#histogram
s<-ggplot(data=filter1,aes(x=Views))
s+geom_histogram(binwidth = 100000000)
s+geom_histogram(binwidth = 100000000,aes(fill="Views"))

s+geom_density()
s+geom_density(aes(fill="Views"))
s+geom_boxplot()

