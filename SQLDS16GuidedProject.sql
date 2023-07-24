use country;

-- 1.Get the list of the 3 most populated cities.

select * from cities order by population DESC limit 3;

-- 2.Get the list of the 3 cities with the smallest surface.
select * from cities order by surface limit 3;

-- 3.Get the list of states whose department number starts with “97”.
select * from states where state_code like '97%';

-- 4.Get the names of the 3 most populated cities, as well as the name of the associated state.
select cities.name,states.state_name from cities,states 
where cities.city_state = states.id
order by cities.population DESC limit 3;

select name,population,state_name 
from cities left join states 
on cities.city_state = states.id 
order by population desc 
limit 3;

-- 5.Get the list of the name of each State, associated with its code and the number of cities within these States, by sorting in order to get in priority the States which have the largest number of cities.

select city_state,state_name,count(name) as no_of_cities
from cities left join states
on cities.city_state = states.id
group by city_state
order by no_of_cities desc;

-- 6.Get the list of the 3 largest States, in terms of surface area.
select city_state,state_name,round(sum(surface),2) as states_surface 
from cities left join states 
on cities.city_state = states.id 
group by city_state
order by states_surface desc
limit 3;

-- 7.Count the number of cities whose names begin with “San”.
select count(name) as no_of_cities from cities where name like 'San%';

-- 8.Get the list of cities whose surface is greater than the average surface.
select name,surface from cities where surface > (select avg(surface) from cities);

-- 9.Get the list of States with more than 1 million residents.
select city_state,state_name,sum(population) as state_population 
from cities left join states
on cities.city_state = states.id
group by city_state
having sum(population) > 1000000
order by sum(population) desc;

-- 10.Replace the dashes with a blank space, for all cities beginning with “SAN-” (inside the column containing the upper case names).
SET SQL_SAFE_UPDATES=0;
UPDATE cities
SET name = replace(name,'-',' ')
where name like 'SAN%';