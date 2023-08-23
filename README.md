# Project Title: Spotify and YouTube Song Data Analysis

## Introduction
This project focuses on the analysis of songs from Spotify and YouTube datasets. The data is loaded, explored, and various analyses are performed using R programming language. The project covers data manipulation, visualization, and statistical analysis to gain insights into song attributes, popularity, and correlations.

## Getting Started
1. **Data Loading:** The project begins by loading the required libraries and reading the datasets from CSV files using the `read.csv` function.
2. **Working Directory:** The working directory is set to the appropriate path where the datasets are stored.

## Data Exploration
1. **Basic Statistics:** Basic information about the dataset is extracted using functions like `nrow`, `ncol`, `dim`, `head`, `tail`, `str`, and `summary`.
2. **Variable Selection:** Specific columns of interest (e.g., "Artist," "Track," "Views") are extracted and displayed using indexing.
3. **Adding New Columns:** New columns are added to the dataset, such as the "Energy_Loudness_Ratio," calculated by dividing Energy by Loudness.
4. **Data Filtering:** The `dplyr` library is used to filter and select specific rows based on conditions (e.g., songs with over 2 billion views, tracks by a specific artist, etc.).
5. **Visualization:** Various visualizations are created using `ggplot2` and `qplot` for exploratory data analysis.

## Data Analysis
1. **Correlation Analysis:** Pearson and Spearman correlation matrices are computed to identify correlations between song attributes. Correlation heatmaps are plotted to visualize these correlations.
2. **Outlier Detection:** Box plots are used to identify potential outliers in ordinal data columns.
3. **Data Imputation:** Missing values are imputed with the mean of each column using the `apply` function.

## Linear Regression Analysis
1. **Linear Regression Models:** Linear regression models are built to predict track popularity (`track_popularity`) based on different song attributes like energy, loudness, and playlist genre.
2. **Model Summary:** The summary statistics for each linear regression model are displayed, including p-values and adjusted R-squared values.
3. **Visualization:** Box plots and summary statistics are visualized using `ggplot2` to show the relationship between track popularity and playlist subgenre.

## Conclusion
The project successfully analyzes Spotify and YouTube song data through data loading, exploration, visualization, correlation analysis, and linear regression. It provides insights into song attributes, correlations, and their impact on track popularity. The linear regression models highlight which variables have the most influence on track popularity, aiding in understanding the factors that contribute to a song's popularity.



