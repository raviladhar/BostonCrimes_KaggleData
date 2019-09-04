select * from dbo.tmp5kbon6z6

-- total offenses reports during all five years
select crimeData.YEAR, count(crimeData.OFFENSE_CODE) as total_offense 
from dbo.tmp5kbon6z6 as crimeData
group by crimeData.YEAR
order by total_offense desc


-- frequently reported offenses in the particular streets
select crimeData.OFFENSE_CODE_GROUP, count(crimeData.OFFENSE_CODE_GROUP) as total_offenses, crimeData.STREET 
from dbo.tmp5kbon6z6 as crimeData 
group by crimeData.OFFENSE_CODE_GROUP,  crimeData.STREET
having count(crimeData.OFFENSE_CODE_GROUP) > 5
order by crimeData.OFFENSE_CODE_GROUP

-- frequently reported offenses
select crimeData.OFFENSE_CODE_GROUP, count(crimeData.OFFENSE_CODE_GROUP) as total_offenses
from dbo.tmp5kbon6z6 as crimeData 
group by crimeData.OFFENSE_CODE_GROUP
order by total_offenses Desc


-- frequently reported offenses during the particular timing
select crimeData.HOUR, count(crimeData.OFFENSE_CODE_GROUP) as total_offenses
from dbo.tmp5kbon6z6 as crimeData 
group by crimeData.HOUR
order by total_offenses Desc


-- frequently reported offenses during the particular Daysof weeks
select crimeData.DAY_OF_WEEK, count(crimeData.OFFENSE_CODE_GROUP) as total_offenses
from dbo.tmp5kbon6z6 as crimeData 
group by crimeData.DAY_OF_WEEK
order by total_offenses Desc


-- frequently reported offenses in top 10 District wise
select top(10) crimeData.DISTRICT, count(crimeData.OFFENSE_CODE_GROUP) as total_offenses
from dbo.tmp5kbon6z6 as crimeData 
group by crimeData.DISTRICT
order by total_offenses Desc

--which 10 was the highest crimes reports are being reported in 2018
select top(10) crimeData.OFFENSE_CODE_GROUP, crimeData.YEAR ,count(crimeData.OFFENSE_CODE_GROUP) as total_offenses
from dbo.tmp5kbon6z6 as crimeData 
where crimeData.Year = 2018
group by crimeData.OFFENSE_CODE_GROUP, crimeData.YEAR
order by total_offenses desc

--street shooting crimes mostly
select crimeData.STREET, crimeData.SHOOTING, count(crimeData.STREET) as total_count
from dbo.tmp5kbon6z6 as crimeData 
where crimeData.SHOOTING = 'Y'
group by crimeData.STREET, crimeData.SHOOTING
order by total_count desc


--Every Year more than 10 shooting incidents shooting incidents 
select crimeData.STREET, crimeData.SHOOTING, crimeData.YEAR, count(crimeData.STREET) as total_count
from dbo.tmp5kbon6z6 as crimeData 
where crimeData.SHOOTING = 'Y'
group by crimeData.STREET, crimeData.SHOOTING, crimeData.YEAR
having count(crimeData.STREET) > 10
order by crimeData.YEAR desc , total_count desc

