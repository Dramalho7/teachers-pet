class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :teacher_id
      t.string :avatar
      t.integer :student_id
      t.timestamps
    end
  end
end
