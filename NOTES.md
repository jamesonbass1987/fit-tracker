TODO AS OF 9:30PM 10/15

- Create Sets Views/Controller Methods
- Fix db models for exercises (unable to create duplicate exercises...potentially in db relationships)
- DESIGN! Use bootstrap
- Create walkthrough video


-MODELS-

Users
has_many :workouts

  - username
  - first_name
  - last_name
  - email
  - password

Workouts
belong_to :users
has_many :exercises
  - name
  - notes

Exercises
belong_to :workouts
has_many :sets
  - name
  - body_part
    - Legs
    - Back
    - Chest
    - Arms
    - Shoulders
    - Abdominals
    - Compound
  - type
    - Barbell
    - Dumbbell
    - Machine
    - Reps Only
  - notes

Exercise_Sets
belong_to :exercise
  - volume
  - reps


-CONTROLLERS & VIEWS-

Application
  - Main Index Page
Authentication
  - Login
  - Signup
Users
  - User Page
Workouts
  - View Workout
  - Create Workout
  - Edit Workout
  - Delete Workout
Exercises
  - View Exercise
  - Create Exercise
  - Edit Exercise
  - Delete Exercise
