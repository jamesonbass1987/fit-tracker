class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.integer :volume
      t.integer :reps
    end
  end
end
