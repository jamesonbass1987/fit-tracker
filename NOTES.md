
-MODELS

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
