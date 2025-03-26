package src;

import java.sql.*;

/**
 * sakila:
 *
 * SELECT COUNT(*) AS total_movies FROM film;
 *
 * SELECT AVG(replacement_cost) AS avg_replacement_cost FROM film;
 *
 * en seleccion simple es filtrar en este hice 3 pq casi me explotan los ojos
 * SELECT * FROM film;
 *
 * SELECT * FROM film WHERE length > 120 LIMIT 10;
 *
 * SELECT * FROM film WHERE rating = 'PG';
 *
 * SELECT film.title AS movie,actor.first_name AS name_actor,actor.last_name AS last_name_actor FROM film JOIN film_category ON film.film_id = film_category.film_id JOIN category ON film_category.category_id = category.category_id JOIN film_actor ON film.film_id = film_actor.film_id JOIN actor ON film_actor.actor_id = actor.actor_id WHERE category.name = 'Comedy' ORDER BY film.title, actor.last_name;
 *
 * SELECT film_id, title, replacement_cost FROM film WHERE replacement_cost > (SELECT AVG(replacement_cost) FROM film) ORDER BY replacement_cost DESC;
 *
 * world:
 *
 * SELECT MAX(Population) AS max_population FROM city;
 *
 * SELECT COUNT(*) AS total_cities FROM city;
 *
 * SELECT * FROM city ;
 *
 * SELECT * FROM city LIMIT 10;
 *
 * SELECT * FROM city WHERE CountryCode = 'JPN';
 *
 * SELECT country.Name AS Country, COUNT(city.ID) AS num_big_cities FROM country JOIN city ON country.Code = city.CountryCode WHERE city.Population > 1000000 GROUP BY country.Name HAVING COUNT(city.ID) >= 2 ORDER BY num_big_cities DESC;
 *
 * SELECT country.Name AS Country, country.Continent AS continent, country.Population AS population FROM country WHERE country.Population > (SELECT AVG(country.Population) FROM country WHERE country.Continent = country.Continent) ORDER BY country.Continent, country.Population DESC;
 */






public class App {
    public static void main(String[] args) {

        Db db = new Db();

        //if true, operates on sakila; if false, operates on world
        boolean base = true;
        Connection c = db.connect(base);

        String[] world = {
                "SELECT COUNT(*) AS total_cities FROM city;",
                "SELECT MAX(Population) AS max_population FROM city;",
                "SELECT * FROM city ;",
                "SELECT * FROM city LIMIT 10;",
                "SELECT * FROM city WHERE CountryCode = 'JPN';",
                "SELECT country.Name AS Country, COUNT(city.ID) AS num_big_cities FROM country JOIN city ON country.Code = city.CountryCode WHERE city.Population > 1000000 GROUP BY country.Name HAVING COUNT(city.ID) >= 2 ORDER BY num_big_cities DESC;",
                "SELECT country.Name AS Country, country.Continent AS continent, country.Population AS population FROM country WHERE country.Population > (SELECT AVG(country.Population) FROM country WHERE country.Continent = country.Continent) ORDER BY country.Continent, country.Population DESC;"
        };

        String[] sakila = {
                "SELECT COUNT(*) AS total_movies FROM film;",
                "SELECT AVG(replacement_cost) AS avg_replacement_cost FROM film;",
                "SELECT * FROM film;",
                "SELECT * FROM film WHERE length > 120 LIMIT 10;",
                "SELECT * FROM film WHERE rating = 'PG';",
                "SELECT film.title AS movie,actor.first_name AS name_actor,actor.last_name AS last_name_actor FROM film JOIN film_category ON film.film_id = film_category.film_id JOIN category ON film_category.category_id = category.category_id JOIN film_actor ON film.film_id = film_actor.film_id JOIN actor ON film_actor.actor_id = actor.actor_id WHERE category.name = 'Comedy' ORDER BY film.title, actor.last_name;",
                "SELECT film_id, title, replacement_cost FROM film WHERE replacement_cost > (SELECT AVG(replacement_cost) FROM film) ORDER BY replacement_cost DESC;"
        };

        //to measure first execute this: globally independent of working db, only execute once
        db.executeQuery("SET profiling = 1;",c);

        //filler query becuase profiling didnt detect first one for some reason
        db.executeQuery("SHOW tables;",c);

        try {Thread.sleep(1000);}
        catch(Exception e) {System.out.println(e);}

        //then, run the queries (twice each)
        if(base)for(int i = 0; i < 7; i++) {
            System.out.println("Executing " + sakila[i] + "...");
            db.sendQuery(sakila[i],c);

            try {Thread.sleep(1 * 1000);}
            catch(Exception e) {System.out.println(e);}

            System.out.println("Executing " + sakila[i] + "...");
            db.sendQuery(sakila[i],c);
        }

        else for(int i = 0; i < 7; i++) {
            db.sendQuery(world[i],c);

            try {Thread.sleep(1 * 1000);}
            catch(Exception e) {System.out.println(e);}

            db.sendQuery(world[i],c);
        }

        //last, execute this
        //structure: Query_ID | Duration   | Query
        ResultSet times = db.sendQuery("SHOW profiles;",c);
        try{
            times.next();
            ResultSetMetaData rsmd = times.getMetaData();
            while (times.next()) {
            for (int i = 2; i <= 3; i++) {
                if (i > 1) System.out.print(",  ");
                String columnValue = times.getString(i);
                System.out.print(columnValue + " " + rsmd.getColumnName(i));
            }
            System.out.println("");
        }
      } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}