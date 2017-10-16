#USERS

User.create(:username => "jamesonbass", :first_name => "Jameson", :last_name => "Bass", :email => "jb@email.com", :password => "password")

User.create(:username => "meganbass", :first_name => "Megan", :last_name => "Bass", :email => "mb@email.com", :password => "password")

User.create(:username => "amysiminski", :first_name => "Amy", :last_name => "Siminski", :email => "as@email.com", :password => "password")

User.create(:username => "kevinsiminski", :first_name => "Kevin", :last_name => "Siminski", :email => "ks@email.com", :password => "password")

User.create(:username => "davidfefferman", :first_name => "David", :last_name => "Fefferman", :email => "df@email.com", :password => "password")

User.create(:username => "shashajhaveri", :first_name => "Shasha", :last_name => "Jhaveri", :email => "sj@email.com", :password => "password")

#WORKOUTS

Workout.create(:name => "Leg Day")
Workout.create(:name => "Chest and Arms")
Workout.create(:name => "Back and Shoulders")

#EXERCISES

Exercise.create(:name => "Squat", :body_part => "Legs", :weight_type => "Barbell", :description => "The squat is performed by squatting down with a weight held across the upper back under neck and standing up straight again. This is a compound exercise that also involves the glutes (buttocks) and, to a lesser extent, the hamstrings, calves, and the lower back. Lifting belts are sometimes used to help support the lower back. The freeweight squat is one of 'The Big Three' powerlifting exercises, along with the deadlift and the bench press.")

Exercise.create(:name => "Leg Press", :body_part => "Legs", :weight_type => "Machine", :description => "The leg press is performed while seated by pushing a weight away from the body with the feet. It is a compound exercise that also involves the glutes and, to a lesser extent, the hamstrings and the calves. Overloading the machine can result in serious injury if the sled moves uncontrollably towards the trainer.")

Exercise.create(:name => "Deadlift", :body_part => "Legs", :weight_type => "Barbell", :description => "The deadlift is performed by squatting down and lifting a weight off the floor with the hand until standing up straight again. Grips can be face down or opposing with one hand down and one hand up, to prevent dropping. Face up should not be used because this puts excess stress on the inner arms. This is a compound exercise that also involves the glutes, lower back, lats, trapezius (neck) and, to a lesser extent, the hamstrings and the calves. Lifting belts are often used to help support the lower back. The deadlift has two common variants, the Romanian deadlift and the straight-leg-deadlift. Each target the lower back, glutes and the hamstrings differently.")

Exercise.create(:name => "Leg Extension", :body_part => "Legs", :weight_type => "Machine", :description => "The leg extension is performed while seated by raising a weight out in front of the body with the feet. It is an isolation exercise for the quadriceps. Overtraining can cause patellar tendinitis. The legs extension serves to also strengthen the muscles around the knees and is an exercise that is preferred by physical therapists.")

Exercise.create(:name => "Leg Curl", :body_part => "Legs", :weight_type => "Machine", :description => "The leg curl is performed while lying face down on a bench, by raising a weight with the feet towards the buttocks. This is an isolation exercise for the hamstrings.")

Exercise.create(:name => "Snatch", :body_part => "Legs", :weight_type => "Barbell", :description => "The snatch is one of the two current olympic weightlifting events (the other being the clean and jerk). The essence of the event is to lift a barbell from the platform to locked arms overhead in a smooth continuous movement. The barbell is pulled as high as the lifter can manage (typically to mid [ chest] height) (the pull) at which point the barbell is flipped overhead. With relatively light weights (as in the 'power snatch') locking of the arms may not require rebending the knees. However, as performed in contests, the weight is always heavy enough to demand that the lifter receive the bar in a squatting position, while at the same time flipping the weight so it moves in an arc directly overhead to locked arms. When the lifter is secure in this position, he rises (overhead squat), completing the lift.")

Exercise.create(:name => "Calf Raise", :body_part => "Legs", :weight_type => "Barbell", :description => "The standing calf raise is performed by plantarflexing the feet to lift the body. If a weight is used, then it rests upon the shoulders, or is held in the hand(s). This is an isolation exercise for the calves; it particularly emphasises the gastrocnemius muscle, and recruits the soleus muscle.")

Exercise.create(:name => "Seated Calf Raise", :body_part => "Legs", :weight_type => "Barbell", :description => "The seated calf raise is performed by flexing the feet to lift a weight held on the knees. This is an isolation exercise for the calves, and particularly emphasises the soleus muscle.")

Exercise.create(:name => "Bench Press", :body_part => "Chest", :weight_type => "Barbell", :description => "The bench press or dumbbell bench-press is performed while lying face up on a bench, by pushing a weight away from the chest. This is a compound exercise that also involves the triceps and the front deltoids, also recruits the upper and lower back muscles, and traps. The bench press is the king of all upper body exercises and is one of the most popular chest exercises in the world. It is the final exercise in 'The big 3'")

Exercise.create(:name => "Chest Fly", :body_part => "Chest", :weight_type => "Barbell", :description => "The chest fly is performed while lying face up on a bench or standing up, with arms outspread holding weights, by bringing the arms together above the chest. This is a compound exercise for the pectorals. Other muscles worked include deltoids, triceps, and forearms.")

Exercise.create(:name => "Dips", :body_part => "Chest", :weight_type => "Reps Only", :description => "The dip is an exercise used in strength training. Narrow, shoulder-width dips primarily train the triceps, with major synergists being the anterior deltoid, the pectoralis muscles (sternal, clavicular, and minor), and the rhomboid muscles of the back (in that order).")

Exercise.create(:name => "Lat Pulldown", :body_part => "Back", :weight_type => "Machine", :description => "he pulldown exercise is a strength training exercise designed to develop the latissimus dorsi muscle. It performs the functions of downward rotation and depression of the scapulae combined with adduction and extension of the shoulder joint.")

Exercise.create(:name => "Pull Ups", :body_part => "Back", :weight_type => "Reps Only", :description => "The snatch is one of the two current olympic weightlifting events (the other being the clean and jerk). The essence of the event is to lift a barbell from the platform to locked arms overhead in a smooth continuous movement. The barbell is pulled as high as the lifter can manage (typically to mid [ chest] height) (the pull) at which point the barbell is flipped overhead.")

Exercise.create(:name => "Bent Over Row", :body_part => "Compound", :weight_type => "Barbell", :description => "The bent-over row is performed while leaning over, holding a weight hanging down in one hand or both hands, by pulling it up towards the abdomen. This is a compound exercise that also involves the biceps, forearms, traps, and the rear deltoids. The torso is unsupported in some variants of this exercise, in which case lifting belts are often used to help support the lower back.")

Exercise.create(:name => "Shoulder Press", :body_part => "Shoulders", :weight_type => "Dumbbell", :description => "The shoulder press is performed while seated, or standing by lowering a weight held above the head to just above the shoulders, and then raising it again. It can be performed with both arms, or one arm at a time. This is a compound exercise that also involves the trapezius and the triceps.")

Exercise.create(:name => "Military Press", :body_part => "Shoulders", :weight_type => "Barbell", :description => "The military press is similar to the shoulder press but is performed while standing with the feet together. (It is named 'military' because of the similarity in appearance to the 'at attention' position used in most militaries) Unlike the seated shoulder press, the military press involves the majority of the muscles of the core as stabilizers to keep the body rigid and upright, and is thus a more effective compound exercise.")

Exercise.create(:name => "Lateral Raise", :body_part => "Shoulders", :weight_type => "Dumbbell", :description => "The lateral raise (or shoulder fly) is performed while standing or seated, with hands hanging down holding weights, by lifting them out to the sides until just below the level of the shoulders. A slight variation in the lifts can hit the deltoids even harder, while moving upwards, just turn the hands slightly downwards, keeping the last finger higher than the thumb. This is an isolation exercise for the deltoids. Also works the forearms and traps.")

Exercise.create(:name => "Tricep Pushdown", :body_part => "Arms", :weight_type => "Machine", :description => "The pushdown is performed while standing by pushing down on a bar held at the level of the upper chest. It is important to keep the elbows at shoulder width and in line with shoulder/legs. In other words, elbows position should not change while moving the forearm pushes down the bar. This is an isolation exercise for the triceps.")

Exercise.create(:name => "Tricep Extension", :body_part => "Arms", :weight_type => "Dumbbell", :description => "The triceps extension is performed while standing or seated, by lowering a weight held above the head (keeping the upper arms motionless), and then raising it again. It can be performed with both arms, or one arm at a time. This is an isolation exercise for the triceps. It is also known as the french curl.")

Exercise.create(:name => "Bicep Curl", :body_part => "Arms", :weight_type => "Dumbbell", :description => "A number of similar exercises are called bicep curls. These are designed to use the muscles on the top of the arm. Most of the time a person is seated or standing and a weight is held in the hand. The elbow is then bent to make the hand come to the shoulder.")

Exercise.create(:name => "Preacher Curl", :body_part => "Arms", :weight_type => "Barbell", :description => "The Preacher curl is performed while standing or seated, with hands hanging down holding weights (palms facing forwards), by curling them up to the shoulders. It can be performed with both arms, or one arm at a time.")

Exercise.create(:name => "Crunches", :body_part => "Abdominals", :weight_type => "Reps Only", :description => "The crunch is performed while lying face up on the floor with knees bent, by curling the shoulders up towards the pelvis. This is an isolation exercise for the abdominals.")

Exercise.create(:name => "Leg Raise", :body_part => "Abdominals", :weight_type => "Reps Only", :description => "The leg raise is performed while sitting on a bench or flat on the floor by raising the knees towards the shoulders, or legs to a vertical upright position. This is a compound exercise that also involves the hip flexors.")

Exercise.create(:name => "Back Extension", :body_part => "Back", :weight_type => "Reps Only", :description => "The back extension is performed while lying face down partway along a flat or angled bench, so that the hips are supported and the heels secured, by bending down at the waist and then straightening up again. This is a compound exercise that also involves the glutes.")

Exercise.create(:name => "Deadlift", :body_part => "Back", :weight_type => "Barbell", :description => "The deadlift is a very effective compound exercise for strengthening the lower back, but also exercises many other major muscle groups, including quads, hamstrings and abdominals. It is a challenging exercise, as poor form or execution can cause serious injury. A deadlift is performed by grasping a dead weight on the floor and, while keeping the back very straight, standing up by contracting the erector spinae (primary lower back muscle). When performed correctly the role of the arms in the deadlift is only that of cables attaching the weight to the body; the musculature of the arms should not be used to lift the weight. There is no movement more basic to everyday life than picking a dead weight up off of the floor, and for this reason focusing on improving one's deadlift will help prevent back injuries.")
