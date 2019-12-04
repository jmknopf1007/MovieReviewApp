require 'pry' 


class CommandLineInterface

    def space_helper(num)
        num.times do
            puts ""
        end
    end


    def greet
        puts "||||||||||||||||||||||||||||||||||||||||||"
        space_helper(2)
        puts "Let's look at some movies!".yellow 
        space_helper(2) 
        puts "||||||||||||||||||||||||||||||||||||||||||"
    end

    def options
        space_helper(2) 
        puts "What would you like to do? Please select a number from 1-6.".yellow  
        space_helper(2)
        puts "(1) View all movies."
        space_helper(2)
        puts "(2) Rate a movie."
        space_helper(2)
        puts "(3) Create new user."
        space_helper(2)
        puts "(4) Edit user info."  
        space_helper(2)
        puts "(5) Add a movie to our database." 
        space_helper(2) 
        puts "(6) Find movie by title."
        space_helper(2) 

        input = gets.chomp

        if input == '1'
            space_helper(2) 
            puts "Sounds good, let's take a look.".yellow 
            display_movies
        elsif input == '2'
            space_helper(2) 
            puts "Yes, let's go rate something.".yellow
            rate_movie
        elsif input == '3' 
            space_helper(2) 
            puts "Yay! Welcome to the family!".yellow
            new_user
        elsif input == '4'
            space_helper(2) 
            puts "Would you like to edit your info, or delete your account?".yellow 
            edit_user_info
        elsif input == '5'
            space_helper(2) 
            puts "Oh yeah what movie you got for us?!".yellow 
            add_movie 
        elsif input == '6'
            space_helper(2) 
            puts "Let's find that movie quick.".yellow 
            find_by_title
        else
            space_helper(2) 
            puts "Command not found.".yellow 
            options 
        end 
    end

    def display_movies
        space_helper(2) 
        movies = Movie.all.each do |movie|
            puts "#{movie.id}: #{movie.title}: #{movie.description}: #{movie.genre}"  
            space_helper(2)
        end
        #space_helper(2) 
        puts "Press r to return to the homepage.".yellow
        space_helper(2)
        display_movie_input = gets.chomp

        if display_movie_input != "r"
        space_helper(2) 
        puts "I'm sorry please press r to return to the homepage.".yellow 
        display_movies
        elsif display_movie_input == "r"
        #space_helper(2)
        options 
        end 
    end

    def add_movie
        space_helper(2)
        puts "Please enter your username.".yellow 
        space_helper(2) 
        username_info = gets.chomp
        space_helper(2) 
        @find_user = User.find_by(username: username_info) 
        if @find_user == nil 
        puts "I'm sorry that user doesn't exist. Please create a new account.".yellow
        new_user
        end 
            if @find_user != nil 
                puts "What's the name of the movie you wish to add?".yellow 
                space_helper(2) 
                movie_name = gets.chomp
                space_helper(2) 
                puts "Please enter a description.".yellow
                space_helper(2) 
                movie_description = gets.chomp
                space_helper(2) 
                puts "Please enter a genre.".yellow 
                space_helper(2) 
                movie_genre = gets.chomp
                space_helper(2) 
                puts "Movie added!"
                Movie.create(title: movie_name, description: movie_description, genre: movie_genre) 
                options 
            end
    end

    def find_by_title
        space_helper(2) 
        puts "What's the title of the movie you wish to find?".yellow 
        space_helper(2) 
        movie_title = gets.chomp 
        space_helper(2) 
        @find_movie = Movie.find_by(title: movie_title)
                if @find_movie == nil
                    #space_helper(2)
                    puts "I'm sorry, that movie isn't in our database.".yellow  
                    options
                else
                    puts "Here's it is! #{@find_movie.title}: #{@find_movie.description}: #{@find_movie.genre}" 
                    options 
                end
    end

    def new_user
        space_helper(2) 
        puts "Please enter your username.".yellow
        space_helper(2) 
        username = gets.chomp
        space_helper(2) 
        puts "Please enter your age.".yellow 
        space_helper(2) 
        age_input = gets.chomp.to_i 
        space_helper(2) 
        puts "User created!".yellow 
        User.create(username: username, age: age_input)
        options   
    end

    def rate_movie
        space_helper(2)
        puts "Please enter your username.".yellow 
        space_helper(2) 
        username_info = gets.chomp
        space_helper(2) 
        @find_user = User.find_by(username: username_info) 
        #binding.pry 
        if @find_user == nil 
        puts "I'm sorry that user doesn't exist. Please create a new account.".yellow
        new_user
        end 
            if @find_user != nil 
            puts "What movie would you like to rate?".yellow 
            space_helper(2) 
            movie_title = gets.chomp
            space_helper(2) 
            @find_movie = Movie.find_by(title: movie_title)
                if @find_movie == nil
                    puts "I'm sorry, that movie isn't in our database.".yellow 
                    options
                end
            end
                    if @find_movie != nil
                        puts "Please enter a rating for this movie.".yellow
                        space_helper(2) 
                        movie_rating = gets.chomp.to_i
                        space_helper(2)  
                        puts "Rating added!" .yellow
                        Review.create(movie_id: find_movie.id, user_id: find_user.id, rating: movie_rating)   
                        options 
                    end 
        
    

    end

    def edit_user_info
        space_helper(2) 
        puts "(1) Edit user information."
        space_helper(2) 
        puts "(2) Delete user account"
        space_helper(2) 

        u_info = gets.chomp

        if u_info == '1'
            space_helper(2) 
            puts "Alright let's edit.".yellow
            edit_account 
        elsif
            u_info == '2'
            space_helper(2) 
            puts "Sorry to see you go.".yellow 
            delete_account
        else
            space_helper(2) 
            puts "Command not found. Select 1 or 2.".yellow
            edit_user_info
        end
    end

    def edit_account
        space_helper(2) 
        puts "Please enter your username.".yellow 
        space_helper(2) 
        username_info = gets.chomp
        space_helper(2) 
        @find_user = User.find_by(username: username_info) 
            if @find_user == nil
                puts "I'm sorry that user doesn't exist.".yellow
                options 
            end 
                if @find_user != nil 
                    puts "Here is your info- #{@find_user.username}: #{@find_user.age}."
                    space_helper(2) 
                    puts "Please enter a new username.".yellow 
                    space_helper(2) 
                    new_name = gets.chomp 
                    space_helper(2) 
                    puts "Please enter a new age.".yellow 
                    space_helper(2) 
                    new_age = gets.chomp 
                    space_helper(2) 
                    new_profile = @find_user.update(username: new_name, age: new_age) 
                    puts "Your new username is: #{@find_user.username}, and your new age is: #{@find_user.age}." 
                    options 
                end

    end


    def delete_account
        space_helper(2) 
        puts "Please enter your username.".yellow 
        space_helper(2) 
        username_info = gets.chomp
        space_helper(2) 
        @find_user = User.find_by(username: username_info) 
            if @find_user == nil
            puts "I'm sorry that user doesn't exist.".yellow
            options 
            end 
                if @find_user != nil 
        puts "Here is your info- #{@find_user.username}: #{@find_user.age}."
        space_helper(2) 
                end    
                puts "Are you sure you want to leave us?".yellow 
                    space_helper(2) 
                    choice = gets.chomp
                    space_helper(2)
                    if choice != 'yes' && choice != 'no' 
                        puts "Command not found, please type yes or no.".yellow 
                        delete_account 
                    elsif choice == 'no'
                        puts "Sounds good! Thanks for staying with us we love you.".yellow 
                        options
                    #end
                    elsif choice == 'yes'
                         all_reviews = Review.where(user_id: @find_user.id) 
                    all_reviews.each_with_index do |r, index|
                        r.destroy
                    end
                    @find_user.destroy 
                end
                        puts "Your account and ratings have been deleted.".yellow  
                        options 
                   
    end

   





end


