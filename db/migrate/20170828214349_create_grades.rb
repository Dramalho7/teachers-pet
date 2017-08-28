class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.date :date
      t.string :assignment
      t.integer :grade
      t.integer :student_id
      t.timestamps
    end
  end
end
