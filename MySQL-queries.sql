Abdulellah Abualshour
RUID: 158006704
MySQL Queries
=====================
The schema is as follows:

	Hotel Info:
		name
		hotelURL
		price
		address
		hotel ID
		img URL
	Reviews:
		hotel name
		author
		review ID
		date
		author location
		title
		content
		service rating
		cleanliness rating
		overall rating
		value rating
		sleep quality rating
		rooms rating
		location rating

You can find the csv files for these two tables attached with the submission.
_____________________________________________
(1)
SELECT * FROM reviews WHERE hotel = 'Desert Rose Resort';

*output:
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
id	author	hotel			date		location	title		content			service	cleanliness	overall		value	sleep_quality	rooms	location 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3	lola	Desert Rose Resort	2013-08-24	US		Great		excellent everything	5	5		5		5	5		5	5
4	lila	Desert Rose Resort	2013-08-25	US		Decent		not bad			3.5	3.5		3.5		3.5	3.5		3.5	3.5
==================================================================================
(2)
SELECT hotel, count(*) FROM reviews GROUP BY hotel;

*output:
-----------------------------
hotel			count
-----------------------------
Desert Rose Resort	2
hotel1			1
hotel2			1
hotel3			1
==================================================================================
(3)
SELECT hotel, avg(overall) as overall_average FROM reviews GROUP BY hotel;

*output:
-----------------------------
hotel			avg
-----------------------------
Desert Rose Resort	4.25
hotel1			4
hotel2			1
hotel3			5
==================================================================================
(4)
SELECT hotel, count(*) as count FROM reviews WHERE overall = 5 GROUP BY hotel;

*output:
-----------------------------
hotel			count
-----------------------------
Desert Rose Resort	1
hotel3			1

/* Any hotels that do not appear in the output do not have any 5 overall ratings */
==================================================================================
(5)
SELECT month(date) as month_v, count(*) FROM reviews GROUP BY month_v

*output:
-------------
month	count
-------------
4	1
8	3
12	1
==================================================================================
(6)
SELECT author, count(*) FROM reviews GROUP BY author

*output:
-------------
author	count
-------------
ana	1
john	1
lila	1
lola	1
mike	1
==================================================================================
(7)
SELECT r1.hotel, avg(r1.overall) as hotel_overall, avg(r2.overall) as desert_overall FROM reviews r1, reviews r2 WHERE r2.hotel = 'Desert Rose Resort' GROUP BY r1.hotel HAVING hotel_overall > desert_overall

*output:
--------------------------------------
hotel	hotel_overall	desert_overall
--------------------------------------
hotel3	5		4.25
==================================================================================
(8) Find total authors in each location:
SELECT author_location, count(*) FROM reviews GROUP BY author_location;

*output:
-----------------------------
author_location		count
-----------------------------
US			5
==================================================================================
(9) Hotels that have an average overall rating less than 2:
SELECT hotel, avg(overall) as overall_average FROM reviews GROUP BY hotel HAVING overall_average < 2;

*output:
-------------------------------
hotel		overall_average
-------------------------------
hotel2		1
==================================================================================
(10) Hotels that have bad service (average rating of service less than or equal to 2):
SELECT hotel, avg(service) as service_average FROM reviews GROUP BY hotel HAVING service_average <= 2;

*output:
-------------------------------
hotel		service_average
-------------------------------
hotel2		1

==================================================================================
(11) Comparing the total reviews during August to total reviews during December:
SELECT month(r1.date) as month_v, count(*) FROM reviews r1 GROUP BY month_v HAVING month_v = 8 or month_v = 12

*output:
-------------
month	count
-------------
8	3
12	1
[*]Conclusion: more reviews are posted during the summer (152877) compared to winter (107248), because people have more vacations in the summer.
==================================================================================