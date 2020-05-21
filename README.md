# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Description

App for finding a best seat (closest to the front & middle).
Rows follow alphabetical order with "a" being the first row. Columns follow numerical order from left to right

For example, for a venue with 10 rows and 12 columns with all seats open, the best seat would be A6.


## Solution used for problem

To find the best seat, i have to find the middle seat in a row, so i have used the divide and conquer algorithm

First i have found the middle seat and then based on number of required seats, i divide the row in left and right with respect to the middle seat to find the seat closest to the middle one



##Instructions to use app


Home page contains list of movies with year, title, genre, number_of_seats, an input box and an button to find the best seat, on clicking on which gives you the best seat

you can book the seats using book seats option

The links are given on home page for creating movies and venues

After creating a movie you can view the seats by clicking on seats option in front of movie list
