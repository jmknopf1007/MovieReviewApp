Movie.destroy_all
User.destroy_all
Review.destroy_all
Movie.reset_pk_sequence
User.reset_pk_sequence
Review.reset_pk_sequence 

m1 = Movie.create(title: "Scooby Doo", description: "a classic tale of a dog and their human", genre: "comedy")
m2 = Movie.create(title: "Dracula", description: "a tragic tale of darkness", genre: "horror") 
m3 = Movie.create(title: "Home Alone", description: "a courageous tale of family", genre: "comedy")  
m4 = Movie.create(title: "Memento", description: "a crazy tale of no memories", genre: "thriller")  
m5 = Movie.create(title: "Hocus Pocus", description: "a tale of eating children and witches", genre: "comedy")   
m6 = Movie.create(title: "Die Hard", description: "a tale of bravery and glass in feet", genre: "action")    

u1 = User.create(username: "Jmknopf1007", age: 47) 
u2 = User.create(username: "Tanner3", age: 76)  
u3 = User.create(username: "Tiannsimmons", age: 28)    
u4 = User.create(username: "Michaelz", age: 16)    
u5 = User.create(username: "Helen3456", age: 65)    
u6 = User.create(username: "Seansean2", age: 55)     

r1 = Review.create(movie_id: m1.id, user_id: u1.id, rating:  8) 
r2 = Review.create(movie_id: m2.id, user_id: u1.id, rating:  1) 
r3 = Review.create(movie_id: m2.id, user_id: u2.id, rating:  9)  
r4 = Review.create(movie_id: m3.id, user_id: u3.id, rating:  9)      
r5 = Review.create(movie_id: m1.id, user_id: u3.id, rating:  8)        
r6 = Review.create(movie_id: m4.id, user_id: u4.id, rating:  7)         
r7 = Review.create(movie_id: m5.id, user_id: u4.id, rating:  8)         
r8 = Review.create(movie_id: m5.id, user_id: u1.id, rating:  9)          
r9 = Review.create(movie_id: m5.id, user_id: u5.id, rating:  6)         
r10 = Review.create(movie_id: m1.id, user_id: u6.id, rating:  7)         
r11 = Review.create(movie_id: m4.id, user_id: u6.id, rating:  8)          
r12 = Review.create(movie_id: m6.id, user_id: u2.id, rating:  6)         
r13 = Review.create(movie_id: m4.id, user_id: u2.id, rating:  4)         
r14 = Review.create(movie_id: m5.id, user_id: u3.id, rating:  9)         
r15 = Review.create(movie_id: m4.id, user_id: u3.id, rating:  6)          