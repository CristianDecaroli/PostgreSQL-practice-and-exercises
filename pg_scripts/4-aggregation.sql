/*Count the number of facilities:
For our first foray into aggregates, we're going to stick to something simple. 
We want to know how many facilities exist - simply produce a total count. 
*/
SELECT COUNT(*) FROM cd.facilities;

/*Count the number of expensive facilities:
Produce a count of the number of facilities that have a cost to guests of 10 or more.*/
SELECT COUNT(facid) FROM cd.facilities WHERE guestcost > 10;

/* Count the number of recommendations each member makes:
Produce a count of the number of recommendations each member has made. Order by member ID. */
SELECT recommendedby, COUNT(*) AS num
FROM cd.members
WHERE recommendedby IS NOT NULL
GROUP BY recommendedby
ORDER BY recommendedby;

/*List the total slots booked per facility:
Produce a list of the total number of slots booked per facility. 
For now, just produce an output table consisting of facility id and slots, sorted by facility id.*/
SELECT facid, SUM(slots) as total_slots
FROM cd.bookings
GROUP BY facid
ORDER BY facid;

/*List the total slots booked per facility in a given month:
Produce a list of the total number of slots booked per facility in the month of September 2012. 
Produce an output table consisting of facility id and slots, sorted by the number of slots. */
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01'
GROUP BY facid
ORDER BY total_slots;

/*List the total slots booked per facility per month:
Produce a list of the total number of slots booked per facility per month in the year of 2012. 
Produce an output table consisting of facility id and slots, sorted by the id and month. */
SELECT facid, EXTRACT(MONTH FROM starttime) AS month, SUM(slots) AS total_slots
FROM cd.bookings 
WHERE EXTRACT(YEAR FROM starttime) = 2012
GROUP BY facid, month
ORDER BY facid, month;

/*Find the count of members who have made at least one booking:
Find the total number of members (including guests) who have made at least one booking.*/
SELECT count(DISTINCT memid)
FROM cd.bookings

/* List facilities with more than 1000 slots booked:
Produce a list of facilities with more than 1000 slots booked. 
Produce an output table consisting of facility id and slots, sorted by facility id */
SELECT facid, SUM(slots) as total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

/*Find the total revenue of each facility:
Produce a list of facilities along with their total revenue. 
The output table should consist of facility name and revenue, sorted by revenue. 
Remember that there's a different cost for guests and members!*/
SELECT facs.name, SUM(slots * CASE
			WHEN memid = 0 THEN facs.guestcost
			ELSE facs.membercost
		end) as revenue
FROM cd.bookings bks
INNER JOIN cd.facilities facs ON bks.facid = facs.facid
GROUP BY facs.name
ORDER BY revenue;