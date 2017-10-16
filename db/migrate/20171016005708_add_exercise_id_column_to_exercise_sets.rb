class AddExerciseIdColumnToExerciseSets < ActiveRecord::Migration
  def change
    add_column(:exercise_sets, :exercise_id, :integer)
  end
end
