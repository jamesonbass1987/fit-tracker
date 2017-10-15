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

Exercise.create(:name => "Squat", :body_part => "Legs", :weight_type => "Barbell")
Exercise.create(:name => "Leg Press", :body_part => "Legs", :weight_type => "Machine")
Exercise.create(:name => "Deadlift", :body_part => "Legs", :weight_type => "Barbell")
Exercise.create(:name => "Leg Extension", :body_part => "Legs", :weight_type => "Machine")
Exercise.create(:name => "Leg Curl", :body_part => "Legs", :weight_type => "Machine")
Exercise.create(:name => "Snatch", :body_part => "Legs", :weight_type => "Barbell")
Exercise.create(:name => "Calf Raise", :body_part => "Legs", :weight_type => "Barbell")
Exercise.create(:name => "Seated Calf Raise", :body_part => "Legs", :weight_type => "Barbell")
Exercise.create(:name => "Bench Press", :body_part => "Chest", :weight_type => "Barbell")
Exercise.create(:name => "Chest Fly", :body_part => "Chest", :weight_type => "Barbell")
Exercise.create(:name => "Dumbbell", :body_part => "Chest", :weight_type => "Barbell")
Exercise.create(:name => "Dips", :body_part => "Chest", :weight_type => "Reps Only")
Exercise.create(:name => "Lat Pulldown", :body_part => "Back", :weight_type => "Machine")
Exercise.create(:name => "Pull Ups", :body_part => "Back", :weight_type => "Reps Only")
Exercise.create(:name => "Bent Over Row", :body_part => "Compound", :weight_type => "Barbell")
Exercise.create(:name => "Shoulder Press", :body_part => "Shoulders", :weight_type => "Dumbbell")
Exercise.create(:name => "Military Press", :body_part => "Shoulders", :weight_type => "Barbell")
Exercise.create(:name => "Lateral Raise", :body_part => "Shoulders", :weight_type => "Dumbbell")
Exercise.create(:name => "Tricep Pushdown", :body_part => "Arms", :weight_type => "Machine")
Exercise.create(:name => "Tricep Extension", :body_part => "Arms", :weight_type => "Dumbbell")
Exercise.create(:name => "Bicep Curl", :body_part => "Arms", :weight_type => "Dumbbell")
Exercise.create(:name => "Preacher Curl", :body_part => "Arms", :weight_type => "Barbell")
Exercise.create(:name => "Hammer Curl", :body_part => "Arms", :weight_type => "Dumbbell")
Exercise.create(:name => "Crunches", :body_part => "Abdominals", :weight_type => "Reps Only")
Exercise.create(:name => "Leg Raise", :body_part => "Abdominals", :weight_type => "Reps Only")
Exercise.create(:name => "Back Extension", :body_part => "Back", :weight_type => "Reps Only")
Exercise.create(:name => "Deadlift", :body_part => "Back", :weight_type => "Barbell")
