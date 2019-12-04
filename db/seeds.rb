Movie.destroy_all
User.destroy_all
Review.destroy_all
Movie.reset_pk_sequence
User.reset_pk_sequence
Review.reset_pk_sequence 

m1 = Movie.create(title: "Scooby Doo", description: "a classic tale of a dog and their human", genre: "comedy")
m2 = Movie.create(title: "Dracula", description: "a tragic tale of darkness", genre: "horror") 
m3 = Movie.create(title: "Home Alone", description: "a courageous tale of family", genre: "comedy")  

u1 = User.create(username: "jmknopf1007", age: 47) 
u2 = User.create(username: "tanner3", age: 76)  
u3 = User.create(username: "tiannsimmons", age: 28)   

r1 = Review.create(movie_id: m1.id, user_id: u1.id, rating:  8) 
r2 = Review.create(movie_id: m2.id, user_id: u1.id, rating:  1) 
r3 = Review.create(movie_id: m2.id, user_id: u2.id, rating:  9)  
r4 = Review.create(movie_id: m3.id, user_id: u3.id, rating:  9)      
r5 = Review.create(movie_id: m1.id, user_id: u3.id, rating:  8)        
r6 = Review.create(movie_id: m2.id, user_id: u3.id, rating:  6)         