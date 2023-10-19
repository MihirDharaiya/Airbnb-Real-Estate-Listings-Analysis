# Airbnb-Real-Estate-Listings-Analysis
This project is focused on the analysis of the the Airbnb's Real Estate Listings dataset which is avaiable on kaggle.

Link of the dataset: [https://www.kaggle.com/datasets/deeplearner09/airbnb-listings](url)

This dataset is centered around Airbnb real estate listings and encompasses details about properties across six different cities: Austin, Melbourne, Bangkok, Buenos Aires, Cape Town, and Istanbul. It features a wide array of attributes such as ratings, types of listings, reviews, availability, and various other information.


After performing crucial steps, including data cleaning, transformation, and other necessary preparations to make the data suitable for analysis, I advanced to tackle the questions I had devised. To do this, I utilized a variety of captivating visualizations to unveil the answers.

Upon completing these steps, I discovered that among the six cities, Austin had the most extensive dataset. As a result, I chose to filter out the Austin data and focused my analysis solely on the listings from Austin.

To kickstart my analysis, I formulated a set of questions that would guide my observations and enable me to execute various tasks. They are as follows:


1. Investigate how property listings are distributed across cities in accordance with room Type.

->  According to the distribution, it became evident that within all the data points, the "Entire home/apt" type of listing was the most prevalent. This means that, out of the three room types, "Entire home/apt" had the highest number of listings, while "shared room" had the fewest.

<img width="500" alt="Total Listings Distribution" src="https://github.com/MihirDharaiya/Airbnb-Real-Estate-Listings-Analysis/assets/53827567/407126e6-bd4c-42be-a0d6-bb72e9f37e99">
<br>
<br>

2. Analyzing the average prices based on all the available  characteristics.

-> To analyze the price trends based on various characteristics, I conducted a correlation analysis between price and each parameter. It was apparent that only the number of bedrooms, beds and baths had a significant impact on price deviations, while ratings and reviews made a minimal contribution to the overall price trend. I also created a bar graph to check the increase in prices when number of bedrooms increases.

<img width="450" alt="coorelation" src="https://github.com/MihirDharaiya/Airbnb-Real-Estate-Listings-Analysis/assets/53827567/b8b42543-67fe-4a4e-8655-362e0769f5ef">
<img width="500" height="410" alt="Average Price per bedroom" src="https://github.com/MihirDharaiya/Airbnb-Real-Estate-Listings-Analysis/assets/53827567/b2b8ffd5-e71e-4d23-b8b4-94d5615d3f95">

<br>
<br> 

3. Analyzing the neighbourhood of the cities in terms of listings.

-> Since I had access to geographical data for the listings, I endeavoured to identify neighbourhoods and their respective average prices. While I initially attempted this analysis in R Studio, I encountered challenges in installing the necessary libraries. Consequently, I resorted to creating a map graph displaying the average prices of Austin's neighbourhoods using Tableau Public. Furthermore, I generated a bar graph to visually depict the average prices based on the listing types.

<img width="450" height="371" alt="map" src="https://github.com/MihirDharaiya/Airbnb-Real-Estate-Listings-Analysis/assets/53827567/b7f65d0b-4c2f-4393-9b78-becd6d9f70e5">
<img width="500" alt="type" src="https://github.com/MihirDharaiya/Airbnb-Real-Estate-Listings-Analysis/assets/53827567/60e02f98-7e00-40fe-960f-be9e105e49da">

<br>
<br>

After conducting these steps, here's what I learned:

1. The dataset primarily focused on the city of Austin, with limited data available for other cities, making it challenging to conduct thorough analyses for those locations.

2. Extensive analysis of the dataset revealed that property prices are notably influenced by the property's location, with strong associations with the number of bedrooms and baths.

3. Among the various property types, "Homes" were the most frequently listed type in Austin, overshadowing the other 38 property types available in the dataset.

4. Initially, I expected ratings and the number of reviews to have a substantial impact on prices. However, my analysis showed the opposite, indicating only minimal correlations between these factors and other parameters in the dataset.
