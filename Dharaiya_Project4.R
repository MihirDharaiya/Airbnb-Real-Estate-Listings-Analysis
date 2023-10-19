# Mihir Dharaiya
# Date: 15 October 2023
# ALY 6000

library(tidyverse)
# Reading the dataset
df <- read_csv('listings.csv')
head(df)

# Data Cleaning

# Spilting the name column into multiple columns
df$name <- strsplit(df$name, " . ")
df
df <- df %>% unnest_wider(name, names_sep="_")
df

# Naming new Columns
colnames(df)[c(2,3,4,5,6)] <- c("location","rating","bedrooms","beds","baths")

# Removing null values
df <- df %>% filter(!is.na(bedrooms))

# Writing function for more filtering 
clean_cols <- function(string){
   if( string =="Studio"){
    return(0)
  }else if(is.character(string)){
    clean = unlist(strsplit(string," ")[1])
    return(clean[1])
  }
}

# removing NAs from 3 columns
df <- df %>% drop_na(bedrooms,beds,baths)

# Filtering the strings 
df$bedrooms <- apply(data.frame(df$bedrooms),1,clean_cols)
df$beds <- apply(data.frame(df$beds),1,clean_cols)
df$baths <- apply(data.frame(df$baths),1,clean_cols)
df$rating <- str_replace_all(df$rating, "★","")

# removing unwanted columns
df <- select(df, -neighbourhood_group,-license,-id,-host_id,-host_name,-last_review)

# Splitting the new location column into 2 columns type and city
df$location <- strsplit(df$location, " in ")
df <- df %>% unnest_wider(location, names_sep="_")
colnames(df)[1] <- "type"
colnames(df)[2] <- "city"


# Converting the Character object into numeric for better analysis
df$rating <- as.numeric(df$rating)
df$bedrooms <- as.numeric(df$bedrooms)
df$beds <- as.numeric(df$beds)
df$baths <- as.numeric(df$baths)


# Checking the summary of the dataset
summary(df)


# Considering only bedrooms upto 5
df_filtered <- df %>% 
  drop_na() %>% 
  filter(bedrooms <= 5)

# Checking distribution of listings according to city
unique(df_filtered$city)
df_city <- df_filtered %>% 
  group_by(city) %>% 
  summarise(count = n())
df_city
# After this step among the dataset, Austin has a count of 9327 data points.
# Therefore, Only considering the data of Austin.

# Filtering the data that contains only Austin as the city because from all the cities 
# austin has the most number of data.
df_filtered <- df_filtered %>% 
  filter(city == "Austin")
df_filtered

df_filtered <- select(df_filtered,type,city,rating,bedrooms,beds,baths,neighbourhood,latitude,longitude,room_type,price,number_of_reviews)

# Question :1 
#  Investigate how property listings are distributed in accordance with room Type.
df_q1 <- df_filtered %>% 
  group_by(room_type) %>% 
  summarise(total_listing = n())
df_q1

# Plotting bar Graph 
ggplot(df_q1, aes(x = room_type,y=total_listing,fill=room_type)) +
  geom_bar(stat = 'identity') + 
  labs(x = "Room Types",y="Total Number of Listings",title = "Total Listings Distribution")

#Conclusion : Among the dataset, austin has maximum number of the listings which provide their entire home/apt
# and listings of shared room remains the minimum.


# Question :2
# Analyzing the average prices based on all the available characteristics.

df_q2 <- df_filtered %>% 
  group_by(bedrooms) %>% 
  summarise(price = mean(price)) 
df_q2$bedrooms <- factor(df_q2$bedrooms,levels = df_q2$bedrooms)

ggplot(df_q2,aes(y=price,x=bedrooms, group = 1)) + 
  geom_line()+geom_point(size=3,color = "red") +
  labs(x="Number of Bedrooms",y = "Average Price", title = " Average Price per bedroom")+
  theme_get()

# According to the above graph we could see listing price increases based on the number of bedrooms.

# Inorder to extract more insights through varioius characteristics I tried
# Calculating the Correlation between various parameters.
cor(df_filtered$bedrooms,df_filtered$price)
cor(df_filtered$baths,df_filtered$price)
cor(df_filtered$rating,df_filtered$price)
cor(df_filtered$bedrooms,df_filtered$rating)
cor(df_filtered$bedrooms,df_filtered$beds)
cor(df_filtered$baths,df_filtered$rating)

# Loading corrplot library to create a correlation graph
library(corrplot)

df_new <- select(df_filtered, rating,bedrooms,beds,baths,price,number_of_reviews)
M = cor(df_new)
corrplot(M, method = 'number')
# Conclusion: According to the above graph, We could see that there is correlation
# between the price,bedrooms,beds and baths.
# How many beds available in a bedroom are extensively coorelated and same with the baths.

# However, the role of rating is bare minimum in accordance with these parameters.


# To find unique data points in type
unique(df_filtered$type)

# Calculating the average price of each type 
df_type <- df_filtered %>% 
  group_by(type) %>% 
  summarise(price = round(mean(price),2),count = n()) %>% 
  arrange(desc(count)) %>% 
  slice(1:10)

df_type

# Plotting top 10 types of the dataset to depict the average prices of the types available.
ggplot(df_type,aes(x=price,y=type,))+
  geom_bar(stat='identity',fill='blue') +
  labs(x='Average Price of the Listing',y='Type of the Listing',title='Average Price distribution of the Type of Listing')+
  geom_text(aes(label=price),hjust = -0.25)

