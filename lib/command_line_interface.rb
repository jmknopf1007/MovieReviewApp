require 'pry' 


class CommandLineInterface

    def space_helper(num)
        num.times do
            puts ""
        end
    end

    def greet
        puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
        space_helper(2)                                                                                                                                                                    
        puts " #     #  #  #    #  #####    ##     ####   ######  ######  #       #  #    # "
        puts " #     #  #  ##   #    #     #  #   #    #  #       #       #       #   #  #  "
        puts " #     #  #  # #  #    #    #    #  #       #####   #####   #       #    ##   "
        puts "  #   #   #  #  # #    #    ######  #  ###  #       #       #       #    ##   "
        puts "   # #    #  #   ##    #    #    #  #    #  #       #       #       #   #  #  "
        puts "    #     #  #    #    #    #    #   ####   ######  #       ######  #  #    # "                                                                                                                                                         
        # puts "  #  #  #  ######  #        ####    ####   #    #  ######  ### "
        # puts "  #  #  #  #       #       #    #  #    #  ##  ##  #       ### "
        # puts "  #  #  #  #####   #       #       #    #  # ## #  #####    #  "
        # puts "  #  #  #  #       #       #       #    #  #    #  #           "         
        # puts "  #  #  #  #       #       #    #  #    #  #    #  #       ### "
        # puts "   ## ##   ######  ######   ####    ####   #    #  ######  ### " 
        space_helper(2) 
    end
    
    def options
        puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
        space_helper(2)
        puts "Welcome to Vintageflix!".cyan 
        space_helper(2)
        puts "This is a movie database for classic films.".cyan 
        space_helper(2)  
        puts "What would you like to do? Please select a number from 1-8.".cyan   
        space_helper(2)
        puts "(1) Create new user."
        space_helper(2)
        puts "(2) Edit user info."
        space_helper(2)
        puts "(3) View all movies."
        space_helper(2)
        puts "(4) Find a movie by title." 
        space_helper(2)
        puts "(5) Add a movie to our database." 
        space_helper(2) 
        puts "(6) Rate a movie."
        space_helper(2) 
        puts "(7) Find the average rating for a movie." 
        space_helper(2) 
        puts "(8) Exit this program." 
        space_helper(2) 
        puts "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
        space_helper(2) 

        input = gets.chomp

        if input == '1'   
            space_helper(2) 
            puts "Yay! Welcome to the family!".cyan
            new_user
        elsif input == '2'
            space_helper(2) 
            puts "Would you like to edit your info, or delete your account?".cyan  
            edit_user_info
        elsif input == '3' 
            space_helper(2) 
            puts "Sounds good, let's take a look.".cyan
            display_movies
        elsif input == '4'
            space_helper(2) 
            puts "What's the title of the movie you wish to find?".cyan   
            find_by_title
        elsif input == '5'
            space_helper(2) 
            puts "Oh yeah what movie you got for us?!".cyan
            add_movie 
        elsif input == '6'
            space_helper(2) 
            puts "Yeah, let's go rate something.".cyan
            rate_movie
        elsif input == '7'
            space_helper(2) 
            puts "What movie are you looking for?".cyan
            average_movie_rating
        elsif input == '8' 
            space_helper(2)
            #puts "Goodbye!".yellow 
            puts "   #####                                                   "
            puts "  #     #   ####    ####   #####   #####   #   #  ######   "
            puts "  #        #    #  #    #  #    #  #    #   # #   #        "
            puts "  #  ####  #    #  #    #  #    #  #####     #    #####    "
            puts "  #     #  #    #  #    #  #    #  #    #    #    #        "
            puts "  #     #  #    #  #    #  #    #  #    #    #    #        "
            puts "   #####    ####    ####   #####   #####     #    ######   "          
            space_helper(2)   
            exit_program  
        else
            space_helper(2) 
            puts "Command not found.".cyan 
            space_helper(2) 
            options 
        end 
    end

    def display_movies
        space_helper(2) 
        movies = Movie.all.each do |movie|
            puts "#{movie.id}: #{movie.title}: #{movie.description}: #{movie.genre}"  
            space_helper(2)
        end 
        puts "Press any key to return to the homepage.".cyan
        space_helper(2)
        STDIN.getch 
        options 
    end

    # def display_movies
    #     space_helper(2) 
    #     movies = Movie.all.each do |movie|
    #         puts "#{movie.id}: #{movie.title}: #{movie.description}: #{movie.genre}"  
    #         space_helper(2)
    #     end
    #     #space_helper(2) 
    #     puts "Press 'r' to return to the homepage.".yellow
    #     space_helper(2)
    #     display_movie_input = gets.chomp

    #     if display_movie_input != "r"
    #     space_helper(2) 
    #     puts "I'm sorry please press r to return to the homepage.".yellow 
    #     display_movies
    #     elsif display_movie_input == "r"
    #     space_helper(2)
    #     options 
    #     end 
    # end

    def add_movie
        space_helper(2)
        puts "Please enter your username. Type 'exit' to return to the homepage.".cyan
        space_helper(2) 
        username_info = gets.chomp.downcase 
        space_helper(2)
            if username_info == 'exit'
                options
            else 
            @find_user = User.find_by(username: username_info.titleize)  
                if @find_user == nil 
                puts "I'm sorry that user doesn't exist. Please create a new account to add a movie.".cyan 
                space_helper(2) 
                options 
                end
            end 
            if @find_user != nil 
                puts "What's the name of the movie you wish to add?".cyan
                space_helper(2) 
                movie_name = gets.chomp.downcase 
                space_helper(2) 
                @find_movie = Movie.find_by(title: movie_name.titleize) 
                if @find_movie != nil 
                    puts "I'm sorry #{@find_movie.title} is already in the database. Please add a different movie.".cyan     
                    add_movie
                elsif
                    @find_movie == nil  
                    puts "Please enter a description.".cyan
                    space_helper(2) 
                    movie_description = gets.chomp.downcase 
                    space_helper(2) 
                    puts "Please enter a genre.".cyan 
                    space_helper(2) 
                    movie_genre = gets.chomp.downcase 
                    space_helper(2)
                    puts "If you are finished type 'yes', or type 'no' to start over.".cyan
                    space_helper(2) 
                    response = gets.chomp.downcase 
                    space_helper(2) 
                if response != 'yes' && response != 'no' 
                    puts "Command not found.".cyan
                    #space_helper(2) 
                    add_movie 
                elsif response == 'no'
                    puts "Sounds good! Let's try again.".cyan
                    #space_helper(2) 
                    add_movie 
                elsif response == 'yes'
                    puts "Movie added!".cyan  
                    Movie.create(title: movie_name.titleize, description: movie_description, genre: movie_genre) 
                    space_helper(2)  
                    options 
                end
            end
        end
    end

    def find_by_title
        space_helper(2) 
        puts "Type 'exit' to return to the homepage.".cyan 
        space_helper(2) 
        movie_title = gets.chomp.downcase 
        space_helper(2)
        if movie_title == 'exit'
            options
        else  
        @find_movie = Movie.find_by(title: movie_title.titleize) 
                if @find_movie == nil
                    #space_helper(2)
                    puts "I'm sorry, that movie isn't in our database.".cyan  
                    space_helper(2) 
                    options
                else
                    puts "Here's it is! #{@find_movie.title}: #{@find_movie.description}: #{@find_movie.genre}".cyan 
                    space_helper(2)  
                    options 
                end
            end
        end

    def new_user
        space_helper(2) 
        puts "Please enter a username. Type 'exit' to return to the homepage.".cyan
        space_helper(2) 
        username = gets.chomp.downcase
        space_helper(2) 
        if username == 'exit'
            options
        end
        @find_user = User.find_by(username: username.titleize)
            if @find_user != nil
                puts "I'm sorry that username is already taken. Please enter a different name.".cyan 
                new_user
                    else  
                    puts "Enter a age. Please select a number from 1-100.".cyan  
                    space_helper(2) 
                    age_input = gets.chomp.to_i 
                    space_helper(2) 
                    if age_input > 100 || age_input < 1   
                        puts "You must select a number from 1-100. Please try again.".cyan 
                        new_user
                    elsif age_input <= 100 && age_input >= 1 
                    puts "If you are finished type 'yes', or type 'no' to start over.".cyan
                    space_helper(2) 
                    response = gets.chomp.downcase 
                    space_helper(2) 
                if response != 'yes' && response != 'no' 
                    puts "Command not found.".cyan
                    #space_helper(2) 
                    new_user 
                elsif response == 'no'
                    puts "Sounds good! Let's try again.".cyan
                    #space_helper(2) 
                    new_user
                elsif response == 'yes'
                    puts "User created!".cyan 
                    space_helper(2) 
                    User.create(username: username.titleize, age: age_input) 
                    options  
                    end  
                end
            end
        end 


    def rate_movie
        space_helper(2)
        puts "Please enter your username. Type 'exit' to return to the homepage.".cyan 
        space_helper(2) 
        username_info = gets.chomp.downcase
        space_helper(2)
        if username_info == 'exit'
            options
        else 
        @find_user = User.find_by(username: username_info.titleize)  
        #binding.pry 
                if @find_user == nil 
                puts "I'm sorry that user doesn't exist. Please create a new account to rate a movie.".cyan 
                space_helper(2) 
                options 
            end 
        end
            if @find_user != nil 
            puts "What movie would you like to rate?".cyan 
            space_helper(2) 
            movie_title = gets.chomp.downcase 
            space_helper(2) 
            @find_movie = Movie.find_by(title: movie_title.titleize)
                if @find_movie == nil
                    puts "I'm sorry, that movie isn't in our database.".cyan 
                    space_helper(2) 
                    options
                end
            end
                    if @find_movie != nil
                        puts "Enter a rating for this movie. Please select a number from 1-10.".cyan 
                        space_helper(2) 
                        movie_rating = gets.chomp.to_i
                        space_helper(2) 
                        if movie_rating > 10 || movie_rating < 1   
                            puts "You must select a number from 1-10. Please try again.".cyan 
                            rate_movie
                        elsif movie_rating <= 10 && movie_rating >= 1   
                            puts "Rating added!".cyan
                            Review.create(movie_id: @find_movie.id, user_id: @find_user.id, rating: movie_rating)  
                            space_helper(2)  
                            options 
                        end 
                    end 
        end

    def edit_user_info
        space_helper(2) 
        puts "(1) Edit user information."
        space_helper(2) 
        puts "(2) Delete user account."
        space_helper(2) 
        puts "(3) Return to homepage."
        space_helper(2) 

        u_info = gets.chomp 

        if u_info == '1'
            space_helper(2) 
            puts "Alright let's edit.".cyan
            edit_account 
        elsif
            u_info == '2'
            space_helper(2) 
            puts "Sorry to see you go.".cyan 
            delete_account
        elsif
            u_info == '3'
            space_helper(2) 
            puts "Sounds good!".cyan
            space_helper(2) 
            options 
        else
            space_helper(2) 
            puts "Command not found. Please select a number from 1-3.".cyan 
            edit_user_info
        end
    end

    def edit_account
        space_helper(2) 
        puts "Please enter your username. Type 'exit' to return to the homepage.".cyan 
        space_helper(2) 
        username_info = gets.chomp.downcase
        space_helper(2) 
        if username_info == 'exit'
            options
        else 
        @find_user = User.find_by(username: username_info.titleize)  
            if @find_user == nil
                puts "I'm sorry that user doesn't exist.".cyan
                space_helper(2) 
                options 
            end
        end 
                if @find_user != nil 
                    puts "Here is your info- username: #{@find_user.username}, age: #{@find_user.age}.".cyan 
                    space_helper(2) 
                    puts "Please enter a new username.".cyan
                    space_helper(2) 
                    new_name = gets.chomp.downcase  
                    space_helper(2) 
                    puts "Enter a new age. Please select a number from 1-100.".cyan
                    space_helper(2) 
                    new_age = gets.chomp.to_i 
                    space_helper(2)
                    if new_age > 100 || new_age < 1   
                        puts "You must select a number from 1-100. Please try again.".cyan 
                        edit_account
                    elsif new_age <= 100 && new_age >= 1 
                    #space_helper(2) 
                    puts "If you are finished type 'yes', or type 'no' to start over.".cyan
                    space_helper(2) 
                    response = gets.chomp.downcase 
                    space_helper(2) 
                if response != 'yes' && response != 'no' 
                    puts "Command not found.".cyan
                    #space_helper(2) 
                    edit_account 
                elsif response == 'no'
                    puts "Sounds good! Let's try again.".cyan
                    #space_helper(2) 
                    edit_account
                elsif response == 'yes'
                    new_profile = @find_user.update(username: new_name.titleize, age: new_age) 
                    puts "Your new username is: #{@find_user.username}, and your new age is: #{@find_user.age}.".cyan 
                    space_helper(2)  
                    options 
                end
            end
        end
    end


    def delete_account
        space_helper(2) 
        puts "Please enter your username. Type 'exit' to return to the homepage.".cyan
        space_helper(2) 
        username_info = gets.chomp.downcase
        space_helper(2)
        if username_info == 'exit'
            options
        else  
        @find_user = User.find_by(username: username_info.titleize)  
            if @find_user == nil
            puts "I'm sorry that user doesn't exist.".cyan
            space_helper(2) 
            options 
            end 
        end
                if @find_user != nil 
        puts "Here is your info- username: #{@find_user.username}, age: #{@find_user.age}.".cyan
        space_helper(2) 
                end    
                puts "Are you sure you want to leave us? Type 'yes' or 'no' to choose.".cyan 
                    space_helper(2) 
                    choice = gets.chomp
                    space_helper(2)
                    if choice != 'yes' && choice != 'no' 
                        puts "Command not found.".cyan 
                        delete_account 
                    elsif choice == 'no'
                        puts "Sounds good! Thanks for staying with us we love you.".cyan 
                        space_helper(2) 
                        options
                    #end
                    elsif choice == 'yes'
                         all_reviews = Review.where(user_id: @find_user.id) 
                    all_reviews.each_with_index do |r, index|
                        r.destroy
                    end
                    @find_user.destroy 
                end
                        puts "Your account and ratings have been deleted.".cyan 
                        space_helper(2)  
                        options 
                   
    end

    def average_movie_rating 
        space_helper(2) 
        puts "Type 'exit' to return to the homepage.".cyan 
        space_helper(2) 
        movie_name_input = gets.chomp.downcase
        space_helper(2) 
            if movie_name_input == 'exit'
                options
            else 
            @find_movie = Movie.find_by(title: movie_name_input.titleize)  
                if @find_movie == nil 
                    puts "I'm sorry, that movie isn't in our database.".cyan
                    space_helper(2)  
                    options 
                end
            end
        average_movie = []
        final_movie = Review.where(movie_id: @find_movie.id) 
            if final_movie.empty? 
            puts "There are no reviews yet for #{movie_name_input.titleize}.".cyan 
            space_helper(2)  
            options   
        else 
        final_movie.each do |movie|
            average_movie << movie.rating 
            end
        end
        average_rating = (average_movie.reduce(:+).to_f / average_movie.size).round(2) 
        puts "The average rating for #{movie_name_input.titleize} is #{average_rating}.".cyan  
        space_helper(2) 
        options  
    end 

    
    
    # def average_movie_rating
    #     average_movie = []
    #     space_helper(2) 
    #     movie_name_input = gets.chomp.downcase
    #     movie_find = Movie.find_by(title: movie_name_input.titleize)
    #     moviesss = Review.where(movie_id: movie_find.id)  
    #         # binding.pry
    #     moviesss.each do |movie|
    #         average_movie << movie.rating 
    #         end
    #     end
    #     average_rating = (average_movie.reduce(:+).to_f / average_movie.size).round(2) 
    #     # average_rating = average_movie.reduce(:+) / average_movie.size
    #     puts "The average rating for #{movie_name_input.titleize} is #{average_rating}" 
    # end 

    def exit_program
        exit 
    end


end


