create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

with all_team as (
Select Team_1, case when Team_1=Winner Then 1 else 0 end as no_of_wins from icc_world_cup
Union all
Select Team_2, case when Team_2=Winner Then 1 else 0 end as no_of_wins from icc_world_cup
)
Select team_1 as team, count(team_1) as Total_Match, 
coalesce(sum(case when no_of_wins = 1 then 1 end),0)Wins,
coalesce(sum(case when no_of_wins = 0 then 1 end),0) Loss
from all_team group by 1 order by 3 Desc,4;

with All_team as (
				Select Team_1 as Team, 
				case when Team_1 = winner Then 1 else 0 end Team_Win 
				from icc_world_cup
			union all
				Select Team_2 as Team, 
				case when Team_2 = winner Then 1 else 0 end Team_Win 
				from icc_world_cup
				)
Select Team,count(Team) Total_Match,
coalesce(sum(team_win),0) Win,coalesce(count(team)-sum(team_win),0) Loss
from All_team
group by team
order by win desc,loss


