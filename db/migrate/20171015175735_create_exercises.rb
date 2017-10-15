class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :body_part
      t.string :weight_type
      t.string :notes
    end
  end
end
