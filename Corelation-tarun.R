# Get the working directory
setwd("D:/CODE/SUMMER/R_data_Analytics/data")# Replace file path with the file path in your system
data<-read.csv("Songs_dataset.csv")# Replace the name also
summary(data)
str(data)

# Verifying the libraries
# install.packages("reshape2")
library(tidyverse)
library(ggplot2)
library(reshape2)

# Visualize some Column of the data

ggplot(data,aes(x=Loudness,y=Liveness))+geom_point()
ggplot(data,aes(x=Loudness,y=Views))+geom_point()

# Filter the songs based on views

filtered_songs <- data %>%filter(Views > 1000000000) %>%select(Track, Views)
filtered_songs


# Only considered ordinal data all the data

ordinal_data<-data[c(-2,-3,-4,-5,-6,-7,-19,-20,-21,-25,-26,-27)]
summary(ordinal_data)
ggpairs(ordinal_data)

# Box plot for checking outliers
?lapply
boxplot_list <- lapply(ordinal_data, boxplot)

# Display the box plots

par(mfrow = c(1, length(boxplot_list)))
for (i in seq_along(boxplot_list)) {
  boxplot_list[[i]]
}

# Replace null values with mean

?apply
clean_data<- apply(ordinal_data, 2, function(x) ifelse(is.na(x), mean(x, na.rm = TRUE), x))

# Convert back to data frame

clean_data <- as.data.frame(clean_data)

# Output the filled data frame
summary(clean_data)

# Ploting all the correlations

?ggpairs
ggpairs(clean_data[1:5])

# Pearson correlation

cor_mat<-cor(clean_data,method = "pearson")
View(cor_mat)

# Ploting the correlation matrix as a heat map
pear_heat <- melt(cor_mat)
ggplot(data = pear_heat, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "white", mid = "grey", high = "black", midpoint = 0, guide = "colorbar") +
  labs(x = "", y = "") +
  theme_minimal()

# correlation coefficient r is considered positively relevant if 0.7<r<1.0
# if it ranges from -0.7>r>-1 it is negatively correlative

?ifelse

# The positive correlative variables
positive_relevence<-apply(cor_mat,1,function(x) ifelse(x>0.7,x,0))
positive_relevence<- as.data.frame(positive_relevence)
view(positive_relevence)

# The negative correlative variables
negative_relevence<-apply(cor_mat,1,function(x) ifelse(x<(-0.7),x,0))
negative_relevence<- as.data.frame(negative_relevence)
view(negative_relevence)

print("Accoring to pearson correlevence the attribute pair(views,likes) & pair(loudness,energy) are positively correlevent")

# Spearman correlation

cor_spear<-cor(clean_data,method = "spearman")
View(cor_spear)

# Ploting the correlation matrix as a heat map
spear_heat <- melt(cor_spear)
ggplot(data = spear_heat, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "white", mid = "grey", high = "black", midpoint = 0, guide = "colorbar") +
  labs(x = "", y = "") +
  theme_minimal()

# correlation coefficient r is considered positively relevant if 0.7<r<1.0
# if it ranges from -0.7>r>-1 it is negatively correlative

?ifelse

# The positive correlative variables
positive_rel_spear<-apply(cor_spear,1,function(x) ifelse(x>0.7,x,0))
positive_rel_spear<- as.data.frame(positive_rel_spear)
view(positive_rel_spear)

print("Accoring to spearman correlevence the attribute pair(views,likes,comments) & pair(loudness,energy)  are positively correlevent")

# The negative correlative variables
negative_rel_spear<-apply(cor_spear,1,function(x) ifelse(x<-0.7,x,0))
negative_rel_spear<- as.data.frame(negative_rel_spear)
view(negative_rel_spear)



