# Project2 ETL: Extract - Transform - Load

## Proposal: The Big Mac and a Little Economics

Amidst historic inflation and already elevated food prices, there is a common narrative in the US  that raising the minimum wage will have a negative impact by only further increasing food costs. This narrative is particularly common when talking about prices in the fast food sector since it relies heavily on minimum wage workers. McDonald's is the world's largest fast-food restaurant chain with more than 39,000 locations spread over almost 100 countries on every continent except Antarctica. With all of this in mind, we intend to look at prices of the ubiquitous Big Mac in countries around the world throughout the 2000’s and pull in data for varying economic factors from a number of countries in order to further explore the truth of this narrative. 

We will use a relational database, so after extracting and transforming in python, we will load our data to a SQL database in PostgreSQL. The database we will create is intended as a starting point with a few economic factors, and new tables can be added as new curiosities come up and data is available. To begin with, we will look at minimum wage, average income, and meat consumption by country in relation to the price of a Big Mac as a jumping off point for exploration.

**Sources of Data**
* Minimum wage data from OECD.stat
* Big Mac Prices from Kaggle.com.
* Income by country
* Meat consumption by country from OECD.stat
* Currency list and abbreviations

In the cleanup of data we anticipate that we will need to drop a number of columns not relevant to the scope of this project, and we will only be focusing on countries represented on the BigMac dataset. We will need to do some manipulation to country names to ensure they match from dataset to dataset, and we will need a list of country names and corresponding codes since some datasets we are using are identified by country code. We will be using all prices and pay converted to US dollars and pay will be all converted to hourly wages. However, we will include a currency exchange table by year and currency for represented countries so the USD price, wage, and income data can be converted for reporting elsewhere. Additionally we will consider average meat consumption per year for each country as a measure of demand for beef in a particular country to see any relationships there. 

## Cleanup

