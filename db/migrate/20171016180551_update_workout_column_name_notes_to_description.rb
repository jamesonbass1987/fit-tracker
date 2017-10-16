class UpdateWorkoutColumnNameNotesToDescription < ActiveRecord::Migration
  def change
    rename_column(:workouts, :notes, :description)
  end
end
