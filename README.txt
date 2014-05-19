baseball_rb README

This is the first version of my baseball VORP calculator app.  It is a single page web
app built with Ruby on Rails and Javascript for AJAX calls.  I did not use JQuery for this
version in order to teach myself the actual Javascript behind AJAX.

The app takes a user's query with a player's name, a start date, and an end date.  It then
makes an AJAX call to construct a URL query to baseballmusings.com.  The Rails program
then parses the resulting page and calculates VORP.  The results are then posted
asynchronously to the main page.  A MySQL database is used to hold the players' names
and their baseballmusings.com ID numbers.