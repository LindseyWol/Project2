# Project2 ETL: Extract - Transform - Load

## Proposal: The Big Mac and a Little Economics

Amidst historic inflation and already elevated food prices, there is a common narrative in the US  that raising the minimum wage will have a negative impact by only further increasing food costs. This narrative is particularly common when talking about prices in the fast food sector since it relies heavily on minimum wage workers. McDonald's is the world's largest fast-food restaurant chain with more than 39,000 locations spread over almost 100 countries on every continent except Antarctica. With all of this in mind, we intend to look at prices of the ubiquitous Big Mac in countries around the world throughout the 2000’s and pull in data for varying economic factors from a number of countries in order to further explore the truth of this narrative. 

We will use a relational database, so after extracting and transforming in python, we will load our data to a SQL database in PostgreSQL. The database we will create is intended as a starting point with a few economic factors, and new tables can be added as new curiosities come up and data is available. To begin with, we will look at minimum wage, average income, and meat consumption by country in relation to the price of a Big Mac as a jumping off point for exploration.

In the cleanup of data we anticipate that we will need to drop a number of columns not relevant to the scope of this project, and we will only be focusing on countries represented on the BigMac dataset. We will need to do some manipulation to country names to ensure they match from dataset to dataset, and we will need a list of country names and corresponding codes since some datasets we are using are identified by country code. We will be using all prices and pay converted to US dollars and pay will be all converted to hourly wages. However, we will include a currency exchange table by year and currency for represented countries so the USD price, wage, and income data can be converted for reporting elsewhere. Additionally we will consider average meat consumption per year for each country as a measure of demand for beef in a particular country to see any relationships there. 

## Sources of Data
* Minimum wage data from OECD.stat
* Big Mac Prices from Kaggle.com.
* Income by country
* Meat consumption by country from OECD.stat
* Currency list and abbreviations

## Contributors
* Lindsey Wolterstorff and Will Dickerson

## The Process
**Extract:** Find our datasets, load them into Python, and plan cleanup
**Transform:** Clean up the data accourding to our plan, then pivot and find additional points to clean up, and finally reformat for database
**Load:** Get the data into our SQL database for future analyzation

### Step 1: Extract
1. Downloaded various CSVs from sources cited above
2. Loaded our CSVs into Python and previewed data to get an idea of what needs to be cleaned, transformed, joined, and deleted

### Step 2: Transform
#### 1. Fix country names for consistency
* We noticed right away we would need to fix spellings of some countries so they could be matched across datasets (ex. Korea vs South Korea)
* We realized too late how much easier this all would have been converting everything to country codes first, that was a big learning 

#### 2. Create new tables from existing data
* We created a countries table with corresponding country codes and currency codes
* We created a currency table with currency codes and names
* We created a currency exchange table with exchange rates for currencies by year
    * All values in our current tables are in US Dollars, but we wanted to add a currency exchange table for future use if conversions were needed for analysis  

#### 3. Clean-up data in CSVs
* BigMac
    *  Renamed columns, dropped unnecessary columns
    *  Change dates to year only for consistency with other data
    *  If a country had more than one price entry for a year we used mean with groupby
    *  Dropped country rows not in countries_df through merge 
  
* AvgIncome
    * Renamed columns, dropped unnecessary columns
    * Rounded incomes
    * Dropped country rows not in countries_df through merge
 
* MinWage
    * Renamed columns, dropped unnecessary columns
    * Dropped country rows not in countries_df through merge

* MeatConsumption
    * Renamed columsn, dropped unnecessary columns
    * Dropped country rows not in countries_df through merge

#### 4. Write dataframes to new CSVs for future database load
* Created a new folder for these new CSVs
* In the end we had 7 dataframes to upload to SQL

### Step 3: Load
After extracting and transforming we were left with 7 dataframes to upload as tables to our SQL database. At the end, we realized it might make sense to have combined our BigMac, AvgIncome, MeatConsumption, and MinWage into one table. We could do that in the future.

## Schema
We created an ERD using QuickDBD
![image](https://user-images.githubusercontent.com/113874979/209034957-f88419bd-7fa9-46c2-b9d5-26465668389b.png)

## Potential Queries
With our data loaded into SQL, we are now able to perform queries, such as the following:
* What is the change over time year to year for minimum wage vs Big Mac price?
* What is the relationship between average income and Big Mac price?
* Does increased beef consumption lead to decreased Big Mac price?
* Does increased beef consumption correlate with increased average income? with minimum wage?

## Limitations
* Time and experience were major constraints with only a week to finish our project. In the future, with more time and experience, incorporating web scraping or APIs to contribute additional data, especially adding more current data, would be ideal. 
* Countries used were limited first by what was included in our BigMac dataset, then further dwindled down as we started adding multiple datasets. We thought starting out with 75 countries and 2,000+ lines of data would be sufficient, but we lost more in the cleanup than we had anticipated.
* Our data points are yearly, but the ability to break these up further to quarterly or even monthly could give more accurate numbers and a different view.

## Future Considerations
* Looking at our database now, there are already things we know we would do differently. We should have had country_code as the PK and not the country name. It is not good practice to have such a large VarChar as a key, now we know. We also received feedback very late in the game that we probably should have combined our 4 individual tables (BigMac, AvgIncome, MinWage, MeatConsumption) into a single table. As stated in our proposal, this database really is a starting off point, we can only improve and refine from here with added experience. 


