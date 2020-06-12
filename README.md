# Context : 

At the end of December 2019, COVID19 (also known as SARS-CoV-2) was first identified to be outbreaking in Wuhan, China. The virus continued to spread rapidly across the whole area of China, and later on, in some regions of Europe as well. On the day of 11 March 2020 , the World Health Organization (WHO) had acknowledged the fast spreading and major health risks of the COVID19 outbreak, and have classified it as a **pandemic** . The world has been majorly affected, with the deepest outbreaks in China, USA and Italy.


# Data Sources : 

Our project is based on the analysis of a data set containing daily numbers of confirmed cases, deaths, and recoveries from the whole world, as well as patient data including symptoms. The fully wrangled data can be found under the folder named «data». 

 - Patient data from the first 2 months of the outbreak : We’ve used a modified version of this data, which is available from Kaggle by Sudalai Rajkumar. 
 - Covid-19 cases : a publically available dataset downloaded form the Johns Hopkins Github repository. 
 - World population data and Age data from the UN.

# Data Wrangling :

All these dataframes were very messy : 

 - Different number and type of attributes
 - Different formats for storing country & provinces 
 - Different methodology of collecting time-series data 
 - Empty and extremely sparse columns 
 - Conceptual string duplicates (e.g. _runny nose_ and _nasal discharge_ )... and many more.

# Dependencies : 
The following dependencies are necessary to run our project: 
R >= 3.4.0, and the following additional packages: 
tidyverse 
lubridate 
broom 
leaflet 
leaflet.extras 
rpart 
rpart.plot 
Factoextra 
NbClust 
Caret 
GridExtra
