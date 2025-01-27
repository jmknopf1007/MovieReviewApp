# Vintageflix CLI

For my Mod 1 final project I built a command line movie database application.<br>
The movies in the database were taken from the Rotten Tomatoes website.

## Demo

![](VintageflixApp.gif)

## Built With

ruby ~> 2.6.1<br>
sqlite3 ~> 1.4.0<br>
activerecord-reset-pk-sequence<br>
bubble letters from http://www.network-science.de/ascii/<br>
old school terminal emulator from https://github.com/Swordfish90/cool-retro-term<br>

## Installation 

Fork the repository and then in your terminal:<br> 
- type 'bundle install' and hit enter<br>
- type 'rake db:migrate' and hit enter<br>
- type 'rake db:seed' and hit enter<br>
- for the best effect type 'brew cask install cool-retro-term'<br> 
and use the amber style from preferences. (*optional*)

After that, everything should be set up on your local machine and good to go!<br>

## Running this program

The run file is located in the bin folder.<br>
To run the program, go to your terminal and type 'ruby bin/run.rb' and hit enter.<br>

## How to navigate this program

Follow all the command prompts.<br>
The program is built to guide you through:<br>
- it will handle all user inputs<br>
- let you know if something was not valid<br>
- you can create a new user account<br>
- you can edit/update account information<br> 
- you can delete your account (this also deletes all of your movie ratings)<br>
- you can view all the movies in the database<br>
- you can search for movies by their title<br>
- you can add movies to the database<br>
- you can rate the movies in the database<br>
- you can find the average rating for each movie in the database<br>

## Acknowledgements 

- I want to thank Devin in Mod 2 for his space_helper function idea.<br>
- I want to thank Tiffany in Mod 2 for sharing the reset-pk-sequence gem.<br>
- I want to thank Michael in Mod 2 for showing me the cool-retro-term emulator.<br>
- I want to thank Sean in Mod 1 for showing me how to use STDIN.getch.<br> 
- I want to thank Tanner in Mod 1 for sharing how to make bubble letters with ASCII text.



