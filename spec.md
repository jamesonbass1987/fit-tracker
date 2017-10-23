# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) | User, Workout, Exercise, and Exercise Sets
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) | Exercises have many Workouts (Many to Many relationship) and have many Sets (Exercise_Sets), Users have many Workouts, exercises, and sets
- [x] Include user accounts | Included
- [x] Ensure that users can't modify content created by other users | Workouts, sets, and exercises are user specific
- [x] Include user input validations | User accounts are validated via User models (validates_presence_of) which keeps info from persisting to DB, in addition to form content validation on site
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) | Exercises and user accounts cannot be duplicated. Throws error if another account or exercise exists.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
