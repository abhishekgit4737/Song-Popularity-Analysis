getwd()
setwd("C:/Users/ujjwa/OneDrive/Desktop/r_files")
songs<-read.csv('spotify_songs.csv')
View(songs)


#LM of 4 variables energy,loudness,valence,playlist genre and subgenre on views or track popularity
popularity_fit_energy <- lm(formula = track_popularity ~ energy,data =songs)
summary(popularity_fit_energy)#hypothesis for each

popularity_fit_loudness<-lm(formula = track_popularity ~loudness, data = songs)
summary(popularity_fit_loudness)#hypo

popularity_fit_genre <- lm(formula = track_popularity ~ playlist_genre,data =songs)
ggplot(songs,aes(x=track_popularity,y=playlist_genre))+geom_boxplot()#visualising
summary(popularity_fit_genre)

#Variable		p-value	 Adj R2
#--------------------------
#energy		 	<2e-16	 0.001
#loudness	  <2e-16	 0.003
#playlist   <2e-16   0.03

#using playlist genre #highest influence
subgenre_fit <- lm(track_popularity ~ playlist_subgenre, data = songs)
summary(subgenre_fit)
ggplot(songs,aes(x=track_popularity,y=playlist_subgenre))+geom_boxplot()#visualising
#post-teen pop results in highest popularity

library(tidyverse)

songs %>% 
  filter(playlist_subgenre == 'post-teen pop') %>% 
  summary()


# Variable	        Q1	   Mean	  Median	 Q3
#-------------------------------------------------
# track_popularity 	49	   60	    67	     77
# energy	          0.59   0.71	  0.73	   0.84
# loudness	       -6.6	  -5.8	 -5.3	    -4.2



#Residuals
res<-resid(subgenre_fit)
qqnorm(res)
