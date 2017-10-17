class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.string :measurement
      t.integer :weight
      t.integer :reps
      t.integer :user_id
      t.integer :exercise_id
    end
  end
end
