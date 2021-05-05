-- Q1 - Write a SQL query to find the date EURO Cup 2016 started on.
select min(play_date) 
from match_mast 

--Q2 - Write a SQL query to find the number of matches that were won by penalty shootout.

select count(distinct match_no) decided_by_penalty_cnt 
from match_details where decided_by = 'P' ;

-- alternate solution

select count(1) decided_by_penalty_cnt 
from match_details where decided_by = 'P'  
and win_lose = 'W';


-- Q3 -  Write a SQL query to find the match number, date, and score for matches in which no stoppage time was added in the 1st half

-- goal_score column has data issue
-- certain columns have date value

SELECT   match_no, play_date, goal_score
FROM match_mast
WHERE stop1_sec = 0;

--Q4 ---Write a SQL query to compute a list showing the number of substitutions that
-- happened in various stages of play for the entire tournament

select play_half, count(1) from player_in_out
where in_out = 'I'
group by play_half;

--Q5 - Write a SQL query to find the number of bookings that happened in stoppage time

SELECT  COUNT(booking_time) as Total_booking
FROM player_booked
WHERE play_schedule = 'ST'

--Q6 - Write a SQL query to find the number of matches that were won by a single point, but do not include matches decided by penalty shootout.
select count(*)
from match_mast
where decided_by != 'P'
AND  abs( (cast(substring(goal_score, 1, 1) as integer)- cast(substring(goal_score, 3, 1) as integer))) = 1

--Q7 -Write a SQL query to find all the venues where matches with penalty shootouts were played.

select match_mast.venue_id, soccer_venue.venue_name 
from soccer_venue
inner join match_mast on soccer_venue.venue_id = match_mast.venue_id
where decided_by = 'P'

--Q8--Write a SQL query to find the match number for the game with the highest number of penalty shots, and which countries played that match.select * from match_details md join soccer_country sc on (md.team_id = sc.country_id)    where md.match_no in (select match_no from match_details where penalty_score = (select max(penalty_score) from match_details));--Q9 --Write a SQL query to find the goalkeeper’s name and jersey number, playing for Germany, who played in Germany’s group stage matches.

select distinct player_mast.jersey_no, player_mast.player_name 
from player_mast
inner join soccer_country
on team_id = country_id
inner join match_details
on player_mast.team_id = match_details.team_id
where soccer_country.country_name = 'Germany' and match_details.play_stage = 'G'
order by player_mast.jersey_no

--Q10 --Write a SQL query to find all available information about the players under contract to Liverpool F.C. playing for England in EURO Cup 2016.

select * from player_mast
inner join soccer_country
on team_id = country_id
where country_name = 'England'
and playing_club = 'Liverpool'

--Q11 --Write a SQL query to find the players, their jersey number, and playing club who were the goalkeepers for England in EURO Cup 2016

select player_name, jersey_no, playing_club
from player_mast
inner join soccer_country
on team_id = country_id
where country_name = 'England' and posi_to_play = 'GK'

--Q12 --Write a SQL query that returns the total number of goals scored by each position on each country’s team. Do not include positions which scored no goals.

select  count(1) as goal,  pm.team_id, pm.posi_to_play 
 from goal_details  gd 
inner join player_mast pm
on pm.team_id = gd.team_id and pm.player_id = gd.player_id
group by pm.team_id, pm.posi_to_play ;

--Q13 --Write a SQL query to find all the defenders who scored a goal for their teams.

select  count(1) as goal,  pm.team_id, pm.posi_to_play 
 from goal_details  gd 
inner join player_mast pm
on pm.team_id = gd.team_id and pm.player_id = gd.player_id
where pm.posi_to_play = 'DF'
group by pm.team_id, pm.posi_to_play ;

--Q14 ---Write a SQL query to find referees and the number of bookings they made for the entire tournament. Sort your answer by the number of bookings in descending order.select count(*) as no_booking, referee_id --sum(cast(booking_time as integer)) over (partition by referee_id order by booking_time desc) as tournamet_bookingfrommatch_mast mm inner join player_booked pb on mm.match_no = pb.match_no--where referee_id = 70007 and pb.match_no = 19group by referee_idorder by no_booking desc--Q15--Write a SQL query to find the referees who booked the most number of players

select count(pb.player_id) as no_players,  referee_id  --sum(cast(booking_time as integer)) over (partition by referee_id order by booking_time desc) as tournamet_bookingfrommatch_mast mm inner join player_booked pb on mm.match_no = pb.match_no--where referee_id = 70007 and pb.match_no = 19group by referee_idorder by no_players desc;--Q16----Write a SQL query to find referees and the number of matches they worked in each venue.select count(match_no) as match_count, referee_id, venue_idfrom match_mastgroup by referee_id, venue_id;--Q17-- Write a SQL query to find the country where the most assistant referees come from, and the count of the assistant referees

select count(ass_ref_id) as ass_ref_no, country_id
from asst_referee_mast
group by country_id;

--Q18--Write a SQL query to find the highest number of foul cards given in one match

with data(match_no, foul_card_count)
as 
(
	select match_no, count(*) as foul_card_count 
	from player_booked
	group by match_no
	
),
more_data (match_no, foul_Card_count, row_num)
as (
select match_no, foul_Card_count, Row_number() over ( order by foul_Card_count desc) AS row_num
from data
)
select * from more_data where row_num = 1;

--Q19 --Write a SQL query to find the number of captains who were also goalkeepers.

select count(*) as no_captain from 
match_captain mc inner join match_details md 
on mc.match_no = md.match_no
and mc.team_id = md.team_id
and mc.player_captain = md.player_gk

--Q20 --Write a SQL query to find the substitute players who came into the field in the first half of play, within a normal play schedule

select * from player_in_out where play_schedule = 'NT' and play_half = 1 and in_out = 'I'