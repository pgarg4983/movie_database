-- Ques 1. Write a SQL query to find the actors who were cast in the movie 'Annie Hall'.
-- Return actor first name, last name and role.

select A.act_fname, A.act_lname from actors as A
join movie_cast as MC ON MC.act_id = A.act_id
join movie as M ON M.mov_id = MC.mov_id
where M.mov_title = "Annie Hall";

-- Ques 2. write a SQL query to find the director who directed a movie that casted a role for 'Alice Harford'. 
-- Return director first name, last name and movie title.
  
select D.dir_fname, D.dir_lname from director as D
join movie_direction as MD ON MD.dir_id = D.dir_id
join movie_cast as MC ON MC.mov_id = MD.mov_id
where MC.role = "Alice Harford";

-- Q3  List all actors' first names and last names along with their genders.

select act_fname as First_Name, act_lname as last_Name, act_gender as genders from actors;

-- Q4 Show the titles and release dates of all movies.

 select mov_title as Titles, mov_dt_rel as Release_dates from movie;

-- Q5 Find the total number of actors in the database.

select count(*) from actors;

-- Q6 Display the full names of all directors.

select concat(dir_fname, dir_lname) as full_name from director;

-- Q7 List the movies with their titles and their corresponding directors' first names and last names.

select M.mov_title as Title, D.dir_fname as First_Name , D.dir_lname as Last_name from movie as M
join movie_direction as MD ON MD.mov_id= M.mov_id
join director as D ON D.dir_id = MD.dir_id;

-- Q8 Retrieve the movies that have a release year after 1990.
 
 select distinct year(mov_dt_rel), mov_title as movies  from movie
 where year(mov_dt_rel) >1990;

-- Q9 Find the average runtime (in minutes) of all movies.

select avg(mov_time) as Average_runtime from  movie;


-- Q10 Show the movie title and the names of its actors for all movies.
 
  select M.mov_title, A.act_fname from movie as M
  inner join movie_cast as MC ON MC.mov_id = M.mov_id
  join actors as A ON A.act_id = MC.act_id;  

-- Q11 List the movies along with the total number of ratings and the average rating for each movie.

select M.mov_title as Title, R.num_o_ratings as Total_rating, R.rev_stars as Average_rating from movie as M
join rating as R ON M.mov_id = R.mov_id;

-- Q12 Retrieve the movie title, director's first name, and director's last name for all movies.
 
 select M.Mov_title as Movie_Title, D.dir_fname as First_Name, D.dir_lname as Last_Name from movie as M
 join movie_direction as MD ON MD.mov_id = M.mov_id 
 join director as D ON MD.dir_id = D.dir_id;
 
-- Q13 Find the movie title and release date for all movies released in the UK.

 select mov_title, mov_dt_rel from movie
 where mov_rel_Country = "UK";

-- Q14 Find all movies released on the 25th day of any month.

select distinct day(mov_dt_rel) , mov_title as Movies from movie
where day(mov_dt_rel) = 25;

-- Q15 Show the movie title and the name of the director for all movies directed by "Christopher Nolan."
  
select M.mov_title from movie as M
join movie_direction as MD ON MD.mov_id = M.Mov_id
join director as D ON MD.dir_id = D.dir_id
where dir_fname = "Christopher" or dir_lname = "Nolan";

-- Ques 16. Write a SQL query to find who directed a movie that casted a role as ‘San’. 
-- Return director first name, last name and movie title.

select D.dir_fname, D.dir_lname, M.mov_title, MC.role from director as D
join movie_direction as MD ON D.dir_id = MD.dir_id
join movie as M ON M.mov_id = MD.mov_id 
join movie_cast as MC ON M.mov_id = MC.mov_id
where role = "san"; 