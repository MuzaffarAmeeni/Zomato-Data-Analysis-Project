alter table main change ï»¿RestaurantID RestaurantID int;
#Question 1
create view c as select countryname,city,Longitude,Latitude from country inner join main on country.CountryID=main.CountryCode;
select * from c;

#Question 3
select c.countryname,c.city,count(distinct(restaurantid)) from main inner join c on main.city=c.city group by c.countryname,c.city;
create view d as select countryname,city,count(Restaurantname) from main inner join country on main.CountryCode=country.Countryid group by countryname;
select * from d;

#Question 4
select year,quarter,monthname,count(restaurantid) from date inner join main on date.Datekey=main.Datekey_Opening group by year,quarter,monthname;

#Question 5
create view avg_rating as select count(restaurantid),
case
when rating between 1 and 2 then "1-2"
when rating between 2 and 3 then "2-3"
when rating between 3 and 4 then "3-4"
when rating between 4 and 5 then "4-5"
end as avg_ratings from main group by avg_ratings;
select * from avg_rating;

#Question 6
create view avg_cost as select  countryname,Average_Cost_for_two,RestaurantName,
CASE
WHEN COUNTRYCODE =1 THEN Average_Cost_for_two*0.012
WHEN COUNTRYCODE =14 THEN Average_Cost_for_two*1
WHEN COUNTRYCODE =30 THEN Average_Cost_for_two*0.2
WHEN COUNTRYCODE =37 THEN Average_Cost_for_two*1
WHEN COUNTRYCODE =94 THEN Average_Cost_for_two*0.000067
WHEN COUNTRYCODE =148 THEN Average_Cost_for_two*0.6
WHEN COUNTRYCODE =162 THEN Average_Cost_for_two*0.073
WHEN COUNTRYCODE =166 THEN Average_Cost_for_two*0.27
WHEN COUNTRYCODE =184 THEN Average_Cost_for_two*1
WHEN COUNTRYCODE =189 THEN Average_Cost_for_two*0.051
WHEN COUNTRYCODE =191 THEN Average_Cost_for_two*0.0034
WHEN COUNTRYCODE =208 THEN Average_Cost_for_two*0.05
WHEN COUNTRYCODE =214 THEN Average_Cost_for_two*0.27
WHEN COUNTRYCODE=215 THEN Average_Cost_for_two*1.24
WHEN COUNTRYCODE =216 THEN Average_Cost_for_two*1
end as USD_DOLLARS FROM main inner join country on main.CountryCode=country.CountryID ;
select * from avg_cost;

select count(restaurantname),
 case 
 when usd_dollars between 0 and 1 then "0-01"
 when usd_dollars between 1 and 10 then "1-10"
 when usd_dollars between 10 and 20 then "10-20"
 when usd_dollars between 20 and 50 then "20-50"
 when usd_dollars between 50 and 100 then "50-100"
 when usd_dollars between 100 and 200 then "100-200"
 when usd_dollars between 200 and 300 then "200-300"
 when usd_dollars between 300 and 500 then "300-500"
 end as cost_range from avg_cost group by cost_range;
 
 #Question 7
 select concat(round(100 * ((select count(restaurantid) from main where Has_Table_booking="yes")/count(restaurantid)),2),"%") as Has_Table_Booking from main ;
  select concat(round(100 * ((select count(restaurantid) from main where Has_Table_booking="no")/count(restaurantid)),2),"%") as does_Has_Table_Booking from main ;
  
#Question 8
select concat(round(100 * ((select count(restaurantid) from main where Has_Online_delivery="yes")/count(restaurantid)),2),"%") as Has_Online_delivery from main ;
select concat(round(100 * ((select count(restaurantid) from main where Has_Online_delivery="no")/count(restaurantid)),2),"%") as does_not_ve_online_delivery from main ;

#Question 9
select Cuisines,City,round((rating),0) from main group by Cuisines,city;
select cuisines from main where city="New delhi" order by Rating desc limit 10;
select cuisines from main where CountryCode=1 order by Rating desc limit 10;
select RestaurantName from main order by rating desc limit 10;