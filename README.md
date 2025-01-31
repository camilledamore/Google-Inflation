# Can google search trends predict national inflation rates?

Accurate inflation data takes several months to be reported by government agencies. However, I wanted to investigate if there exists a more readily available proxy indicator for the CPI.

Oftentimes, people will use Google searches for things they notice. Thus, I set out to answer the question: Can Google searches for inflation predict the inflation rate?

To answer this question, I compared the inflation rate in four countries (Canada, Mexico, South Africa, and the United States) to the Google search rate for the word “inflation.”   Google search data sourced from Trends.Google.com and inflation data sourced from the World Bank (https://www.worldbank.org/en/research/brief/inflation-database). 

Additionally, to further explore other possible keywords that could be correlated to inflation, I examined the correlation of the search rate for the word "inflation" to the following words for all four countries: "inflation, interest rate, market, job, and trade."  A heatmap of this inquiry can be found below in figure 1. 

<img width="1127" alt="Screen Shot 2024-06-12 at 9 50 54 PM" src="https://github.com/camilledamore/Google-Inflation/assets/157072047/7d9dd4b2-c618-4b85-9bc8-cc57362990bd">

#### Figure 1: Heatmap of correlation coefficient values of keywords "inflation, interest rate, market, job, and trade" as compared to the search rate for "inflation" (all_country_correlation data).

  
## Analysis 

Figures 2 reports the trend for the inflation and search rates over time since 2005 for all four countries, and figure 3 enlarges the graph for the United States.

It appears that the inflation rate and search rate are not strongly correlated before the COVID-19 pandemic in 2020 in all countries.
 
However, Since the beginning of the COVID-19 pandemic, the inflation rate is correlated with the Google search rate for "inflation." During this time period, the actual inflation rate leads the search term, which is promising. This potentially indicates that, shortly after actual inflation increases, people may begin to notice and investigate the rising prices; people search for inflation after the rate has risen. 

However this may be explained by the fact that inflation markers such as the CPI are released to the public 1-3 months after, and these public releases during the pandemic—a period of great economic uncertainty—may be driving this trend. 


 <img width="1117" alt="Screen Shot 2024-06-12 at 9 50 40 PM" src="https://github.com/camilledamore/Google-Inflation/assets/157072047/ac219428-78eb-4368-aefe-25a5afe18657">

#### Figure 2:  Inflation rate and Google search rate of the word “inflation” since 2005 for the Canada, Mexico, South Africa, and the United States. 
<br/>
<br/>


 
<img width="1107" alt="Screen Shot 2024-06-12 at 9 50 29 PM" src="https://github.com/camilledamore/Google-Inflation/assets/157072047/d7cca9d7-af4b-48dd-870b-8ac29606e1b7"> 

#### Figure 3: Larger view of US graph from Figure 2.


## Conclusion

It is uncertain whether or not inflation rate can be predicted accurately via Google search data. 
It seems to be a promising predictor for the US and Canada for dates after 2020, but it is unreliable in Mexico and South Africa for all years studied. This is possibly due to variations in internet availability.

Because there was little promising findings for the keyword "inflation", I did not investigate the trend between the other other five related keywords (interest rate, market, job, and trade) with the recorded inflation rates. This is for sake of time.  However, it may be interesting to repeat analysis with the remaining data. 

Further analysis in subsequent years is needed to investigate the trend further. 
