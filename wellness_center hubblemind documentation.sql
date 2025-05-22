					/*Week 1: Basic SQL Tasks*/
SELECT *
FROM wellness_centre_beneficiaries;
/* EXPLANATION
The code selects all the columns in the table "wellness_centre_beneficiaries" 
and returns the number of rows in the table*/

#1.PROBLEM: count of how many beneficiaries are in each city
/*DESCRIPTION
This script selects the columns from the table in the database and returns the number of beneficiaries in each city*/ 
SELECT cityName, sum(count) AS total_beneficiaries
FROM wellness_centre_beneficiaries
GROUP BY cityName
order by total_beneficiaries desc
limit 10;
/*EXPLANATION
1.The select statement identifies the columns cityName and count
the count column is summed and given the alias total_beneficiaries 
the group by clause groups the rows with the same cityName 

The script then returns the total number of beneficiaries in each city
*/
# PROBLEM 2: unique wellness centers in the dataset.
/* This script uses the distinct clause to identify unique values
The sript returns the unique wellness centres in the data set 
There are 363 unique rows */
SELECT DISTINCT wellnessCentreName
FROM wellness_centre_beneficiaries;

#PROBLEM 3: Total number of beneficiaries for each wellness center
SELECT WellnessCentreName, SUM(count) AS total_beneficiaries
FROM wellness_centre_beneficiaries
GROUP BY WellnessCentreName;
/* EXPLANATION
The query selects the columns wellnessCentreName , and sum(count) which is the aggregate function that
sums the count column(The total number of beneficiaries for each card type at the wellness cente)
from the table wellness_centre_beneficiaries .
The group by clause groups rows with the same wellnessCentreName and summs the count.*/

#PROBLEM 4:Identify cities with more than 10,000 total beneficiaries.
SELECT cityName, SUM(count) AS total_beneficiaries
FROM wellness_centre_beneficiaries
GROUP BY cityName
HAVING SUM(count) > 10000;
/*EXPLANATION
SUM(count);calculates the total number of beneficiaries for each city
GROUP BY cityName; groups the rows by thr city
HAVING sum(count)>10000; filters the groups such that the output produces rows with the total number
of beneficiaries greater than 10000
*/

/*PROBLEM 5:Filter and display only the 'Serving' beneficiaries in the dataset.*/
SELECT *
FROM wellness_centre_beneficiaries
WHERE card_type = 'Serving';
/*EXPLANATION
SELECT * retrieves all columns from the table "wellness_centre_beneficiaries"
the WHERE card_type ="serving" filters the rows that the card_type column is"serving"
*/
# PROBLEM 6:Order cities by their total beneficiary count*/
SELECT cityName, SUM(count) AS total
FROM wellness_centre_beneficiaries
GROUP BY cityName
ORDER BY SUM(count) DESC;
/* EXPLANATION
The query retrieves the colums cityName and aggregrates the count column
(The total number of beneficiaries for each card type)
 the group by clause groups the result by each unique city
 order by clause orders the citis by their total beneficiary count
*/
# PROBLEM 7:Identify wellness centers with at least 5,000 beneficiaries.
SELECT wellnessCentreName, count AS number_of_beneficiaries
FROM wellness_centre_beneficiaries
WHERE count >= 5000;
/* EXPLANATION
SELECT wellnessCentreName, count AS number_of_beneficiaries specifies the columns to retrieve:
wellnessCentreName AND count, which is aliased as number_of_beneficiaries for clarity in the output. 
FROM wellness_centre_beneficiaries table
WHERE count >= 5000,This condition filters the results to include only rows where the count column (number of beneficiaries)
 is greater than or equal to 5,000.*/
 
 
#PROBLEM 8:List the number of 'Pensioner' beneficiaries at each wellness center.
SELECT wellnessCentreName, SUM(count) AS pensioners
FROM wellness_centre_beneficiaries
WHERE card_type = 'pensioner'
GROUP BY wellnessCentreName
ORDER BY pensioners ASC;
/* EXPLANATION 
SELECT wellnessCentreName, SUM(count) AS pensioners
The select statement identifies wellnessCentreName and SUM(count) which Aggregates the total number of pensioner beneficiaries (count) for each wellness center.
AS pensioners is an  alias name
The query retrieves data from the wellness_centre_beneficiaries table, which contains details about the beneficiaries of each wellness center.
WHERE card_type = 'pensioner',This condition filters the rows to include only those beneficiaries whose card type is "pensioner."
GROUP BY wellnessCentreName,Groups the rows by wellnessCentreName, so the sum of beneficiaries is calculated separately for each wellness center.
ORDER BY pensioners ASC,Sorts the results in ascending order 
*/

#PROBLEM 9: the total number of beneficiaries across all cities.
SELECT cityName, SUM(count) AS total_beneficiaries
FROM wellness_centre_beneficiaries
GROUP BY cityName;
/*EXPLANATION
Select statement identifies cityName and SUM(count) giving "total_beneficiaries" as an alias 
FROM the table "wellness_centre_beneficiaries" 
GROUP BY cityName:Groups the rows by cityName, ensuring that the sum of beneficiaries (count) is calculated separately for each city.
*/

#PROBLEM 10:Find cities that have no 'Freedom Fighter' beneficiaries.
SELECT DISTINCT cityName
FROM wellness_centre_beneficiaries t1
WHERE NOT EXISTS(
SELECT 1 FROM wellness_centre_beneficiaries t2
WHERE t2.cityName = t1.cityName AND t2.card_type = 'Freedom Fighter');
/*EXPLANATION
This SQL query retrieves the distinct names of cities where there are no beneficiaries with the card type 'Freedom Fighter'
The use of DISTINCT ensures that each city appears only once in the results.
FROM wellness_centre_beneficiaries t1:
Refers to the wellness_centre_beneficiaries table and assigns it the alias t1 
WHERE NOT EXISTS ():Filters cities to include only those for which the specified condition is not satisfied. 
Specifically, it checks whether the subquery returns any rows for the given city.
The subquery looks for rows in the wellness_centre_beneficiaries table (aliased as t2) where:
The cityName matches the cityName from the outer query (t1.cityName).
The card_type is 'Freedom Fighter'.
If such rows exist, the subquery returns results, which makes the NOT EXISTS condition false for that city.
*/

				/* week two:intermediate tasks*/
#PROBLEM 1:Calculate the average number of beneficiaries per wellness center across all cities
SELECT wellnessCentreName, AVG(count) AS average_no_beneficiaries
FROM wellness_centre_beneficiaries
GROUP BY wellnessCentreName;
/*Explanataion
This SQL query calculates the average number of beneficiaries per wellness center.BY Selecting the wellnessCentreName column,
and Calculates the average number of beneficiaries (count) for each wellness center.
Groups the data by the wellnessCentreName, ensuring that the average is calculated for each wellness center individually. 
*/

#PROBLEM 2:List the total number of 'Pensioner' and 'Serving' beneficiaries for each city
SELECT cityName, card_type, SUM(count)
FROM wellness_centre_beneficiaries
WHERE card_type IN ('Pensioner' , 'Serving')
GROUP BY cityName , card_type;
/* EXPLANATION
This SQL query Retrieves the cityName and card_type columns,calculates the total number of beneficiaries for each combination of city and card type, 
WHERE card_type IN ('Pensioner', 'Serving')focuses only on beneficiaries with the card types 'Pensioner' and 'Serving'
GROUP BY cityName, card_type:Groups the data by cityName and card_type,
so the sum of beneficiaries is calculated separately for each city and card type combination.
*/
#PROBLEM 3:Show the highest number of beneficiaries in each city.
SELECT cityName, MAX(count) AS highest_no_beneficiaries
FROM wellness_centre_beneficiaries
GROUP BY cityName;
/* EXPLANATION
The script Retrieves the name of each city.and Finds the maximum value in the count column for each city.
"AS highest_no_beneficiaries": Aliases the result of the MAX function to name the output column highest_no_beneficiaries.
GROUP BY cityName:Groups the data by cityName, so the maximum number of beneficiaries is calculated independently for each city.
*/

#PROBLEM 4:Retrieve wellness centers in a specific city (e.g., KOLKATA)
SELECT DISTINCT wellnessCentreName, cityName
FROM wellness_centre_beneficiaries
WHERE cityName = 'KOLKATA';
/*EXPLANATION
This SQL query retrieves the unique names of wellness centers and KOLKATA being the associated city from the wellness_centre_beneficiaries table, 
ensuring that each wellness center in Kolkata is listed only once.
*/

#PROBLEM 5:Calculate the percentage of 'Pensioner' beneficiaries in each city.
SELECT cityName,SUM(count) AS total,
(SELECT SUM(CASE WHEN card_type = 'Pensioner' THEN count ELSE 0 END) * 100 / SUM(count)) AS percentage
FROM wellness_centre_beneficiaries
GROUP BY cityName
ORDER BY cityName ASC;
/* EXPLANATION
This SQL query calculates the total number of beneficiaries and the percentage of those with the 'Pensioner' card type for each city, 
and orders the results alphabetically by city name
THE SUBQUERY,calculates the percentage of beneficiaries
 with the 'Pensioner' card type by dividing the sum of 'Pensioner' beneficiaries by the total number of beneficiaries and multiplying by 100.
*/
#PROBLEM 6:Display cities where 'Pensioner' beneficiaries outnumber 'Serving' beneficiaries
SELECT cityName,(SELECT SUM(CASE WHEN card_type = 'Pensioner' THEN count ELSE 0 END)) AS total_pensioners,
(SELECT SUM(CASE WHEN card_type = 'Serving' THEN count ELSE 0 END)) AS total_serving
FROM wellness_centre_beneficiaries
WHERE card_type IN ('Pensioner' , 'Serving')
GROUP BY cityName
HAVING SUM(CASE WHEN card_type = 'Pensioner' THEN count ELSE 0 END) > 
SUM(CASE WHEN card_type = 'Serving' THEN count ELSE 0 END)
ORDER BY cityName;
/*EXPLANATION
This SQL query calculates the total number of 'Pensioner' and 'Serving' beneficiaries for each city using subqueries.
It filters the cities to only include those where the number of 'Pensioner' beneficiaries exceeds the number of 'Serving' beneficiaries. 
The results are grouped by city and ordered alphabetically.
*/

#PROBLEM 7:Sum the total number of 'Freedom Fighter' beneficiaries across all cities.
SELECT cityName, SUM(count) AS freedom_fighter_beneficiaries
FROM wellness_centre_beneficiaries
WHERE card_type = 'Freedom Fighter'
GROUP BY cityName;
/* EXPLANATION
This SQL query calculates the total number of 'Freedom Fighter' beneficiaries for each city. 
The results are grouped by city and the total number of beneficiaries is summed for each city.
*/

#PROBLEM 8:Find wellness centers whose names start with 'A' and calculate their total beneficiaries.
SELECT wellnessCentreName, SUM(count) AS beneficiaries
FROM wellness_centre_beneficiaries
WHERE wellnessCentreName LIKE 'A%'
GROUP BY wellnessCentreName;
/*EXPLANTION
The query filters rows where the wellnessCentreName starts with the letter "A" 
and calculate their total beneficiaries
*/

#PROBLEM 9:Determine the total number of unique cities and wellness centers.
SELECT COUNT(DISTINCT wellnessCentreName) AS total_unique_centers,
(SELECT COUNT(DISTINCT cityName)) AS total_unique_cities
FROM wellness_centre_beneficiaries;
/* EXPLANATION
The Query counts the number of unique wellness centres and cities*/

#PROBLEM 10:Calculate the average number of 'Serving' beneficiaries per city.
SELECT cityName, AVG(count) AS average_serving_beneficiaries
FROM wellness_centre_beneficiaries
WHERE card_type = 'Serving'
GROUP BY cityName;
/*EXPLANATION
The query calculates the average number of "serving" beneficiaries in each city
*/
			
		                /*Week 3: Advanced SQL Task*/
#PROBLEM 1:Identify cities where the total number of 'Pensioner' and 'Serving' beneficiaries combined exceeds 20,000.
SELECT cityName
FROM wellness_centre_beneficiaries
WHERE card_type IN ('Pensioner' , 'Serving')
GROUP BY cityName
HAVING SUM(count) > 20000;
/*EXPLANATION
The query identifies total number of beneficiaries where the beneficiaries are( pensioner and serving)
 combined in greater than 20000*/
 
#PROBLEM 2:List wellness centers in cities with the lowest average number of beneficiaries.
SELECT DISTINCT wellnessCentreName, MIN(avg_count) AS min_avg
FROM(SELECT DISTINCT wellnessCentreName, AVG(count) AS avg_count
FROM wellness_centre_beneficiaries
GROUP BY wellnessCentreName) AS avg_table
GROUP BY wellnessCentreName
ORDER BY min_avg ASC;
/*EXPLANATION
This query calculates the average number of beneficiaries for each wellness center
and then finds the minimum average value for each unique center. It groups the results by wellnessCentreName,
orders them by the minimum average in ascending order.
*/

#PROBLEM 3:Find the city with the highest number of 'Serving' beneficiaries using subqueries.
SELECT cityName, SUM(count) AS total_number
FROM wellness_centre_beneficiaries
WHERE card_type = 'Serving'
GROUP BY cityName
HAVING SUM(count) = (SELECT MAX(total_number)
FROM(SELECT cityName, SUM(count) AS total_number
FROM wellness_centre_beneficiaries
WHERE card_type = 'Serving'
GROUP BY cityName) AS total_table);
/*EXPLANATION
The query filters city that has the highest number of "serving" beneficiaries
*/

#PROBLEM 4: Identify wellness centers with a higher-than-average number of beneficiaries compared to all other centers.
SELECT wellnessCentreName, AVG(count) AS beneficiary_count
FROM wellness_centre_beneficiaries
GROUP BY wellnessCentreName
HAVING AVG(count) >(SELECT AVG(count)
FROM wellness_centre_beneficiaries);
/*EXPLANATION
This query calculates the average number of beneficiaries for each wellness center 
 and filters to include only those centers where the average beneficiary count is greater than the overall average across all records. 
*/

#PROBLEM 5:Calculate the total number of beneficiaries in all cities, grouped by card type.
SELECT cityName, card_type, SUM(count)
FROM wellness_centre_beneficiaries
GROUP BY card_type , cityName
ORDER BY cityName;
/*EXPLANATION
The query calculates the total number of beneficiaries in each city and groups it by card_type
*/

#PROBLEM 6:Find wellness centers that have fewer beneficiaries than the average city total.
SELECT cityName,wellnessCentreName,SUM(count) AS total_beneficiaries
FROM wellness_centre_beneficiaries
GROUP BY cityName , wellnessCentreName
HAVING total_beneficiaries <(SELECT AVG(total)
FROM(SELECT cityName, SUM(count) AS total
FROM wellness_centre_beneficiaries
GROUP BY cityName) AS total_table);
/* The query identifies columns (cityName,wellnessCentreName and sum(count) with an alias total beneficiaries
it identifies he wellness centres whose beneficiariiss are less than that of the city average*/

# PROBLEM 7:Determine the difference between the highest and lowest beneficiary count in each city
SELECT cityName, (MAX(count) - MIN(count)) AS differnce_count
FROM wellness_centre_beneficiaries
GROUP BY cityName;
/* The query finds the difference between the highest and the lowest beneficiary count in each city*/

#PROBLEM 8:Identify the top 3 cities with the most 'Pensioner' beneficiaries using subqueries
SELECT cityName
FROM (SELECT cityName, SUM(count) AS pensioners
FROM wellness_centre_beneficiaries
WHERE card_type = 'Pensioner'
GROUP BY cityName
ORDER BY SUM(count) DESC) AS t1
LIMIT 3;
/*EXPLANATION
The query identifies the top 3 cities with the most number of pensioners
*/

#PROBLEM 9:compare the number of 'Freedom Fighter' beneficiaries to 'Pensioner' beneficiaries in city.
SELECT cityName,COUNT(CASE WHEN card_type = 'Freedom Fighter' THEN 1 END) AS freedom_fighter,
COUNT(CASE WHEN card_type = 'Pensioner' THEN 1 END) AS pensioner
FROM wellness_centre_beneficiaries
GROUP BY cityName;
/*EXPLANATION
This query calculates the count of beneficiaries with the card_type "Freedom Fighter" and "Pensioner" for each city in the wellness_centre_beneficiaries table. 
It uses COUNT using CASE condition to count the records based on card_type, grouping the results by cityName. 
The DISTINCT ensures unique city names, but it's redundant since GROUP BY already achieves this.
*/

#PROBLEM 10:Calculate the percentage of 'Pensioner' beneficiaries compared to all beneficiaries in city
SELECT cityName,ROUND((pensioner_total * 100) / (total), 2) AS pensioner_percentage
FROM
(SELECT cityName,SUM(count) AS total,SUM(CASE WHEN card_type = 'Pensioner' THEN count END) AS pensioner_total
    FROM wellness_centre_beneficiaries
    GROUP BY cityName) AS percentage_table;
/*EXPLANATION
The SQL query calculates the percentage of pensioners  for each city in the wellness_centre_beneficiaries table. 
Aggregates the total count of beneficiaries and the count of pensioners filtered by card_type = 'Pensioner' for each city using a subquery. 
Then, it calculates the pensioner percentage by dividing the pensioner count by the total count, multiplying by 100, and rounding it to two decimal places.
*/

