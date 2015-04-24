# Ghana-Electricity
This project tends to analyze the generation, consumption, import and export of electricity in Ghana. By Adekunle Tobi Ogundele

Datasets containing electricity information  were obtained from the website below;
http://www.eia.gov/cfapps/ipdbproject/IEDIndex3.cfm   

Data including Electricity import, export, consumption and generation were obtained in (.Xls) format.


Exploratory Data Analysis

The data obtained needed to be cleaned up because they were in Excel format.  The following process were taken to clean up the dataset and prepare them for analysis.
1. Remove empty cells, rows and columns from all Xls formatted documents.
2. Insert a new cell called "countries" to help identify all countries in the data.
3. Convert Xls formatted datasets to CSV format.
4. Remove  commas from country name so that  CSV does not treat the string as a separate word e.g "Bahamas, The".
5. Remove all Periods and tabbed spaces.
6. Wrote a R code to query the CSV file in order to be able to obtain Ghana's electricity information from all the datasets.
7. Wrote a R code to query the CSV file in order to be able to obtain other West African countries (Nigeria, Benin, Ivory Coast, and Togo) electricity information from all the datasets.


Questions to be answered

1. How has the generation of electricity over the years met the needs of national consumption?
2. Does Ghana Import more than export to other countries?
3. Does Ghana import, export, and consume electricity compared to other West African countries (Nigeria, Benin, Togo, Ivory Coast)?
4. How can the consumption rate of electricity be predicted for the next (7) years, (2013 - 2020)?


Analysis Programmed

in order to analyse the data, R programming language was used. 
To compare and constrast import, export, generation and consumption data,  Barplots () were used.
The most interesting part of this project is the aspect where we would have to forecast or predict electricity consumption rate for the next 7 years
To do Forecasting with R programming Language, the "Forecast" package has to be installed, and then the library(forecast) is called on the datasets to generate predictions
Three types of forecast were used:
1. Exponential Model
2. Time series Model
3. ARIMA Model






