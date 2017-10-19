class CreateExerciseSets < ActiveRecord::Migration
  def change
    create_table :exercise_sets do |t|
      t.string :units
      t.integer :weight
      t.integer :reps
      t.integer :exercise_id
    end
  end
end
