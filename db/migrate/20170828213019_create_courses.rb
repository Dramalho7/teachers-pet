class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.text :name
      t.integer :teacher_id
      t.integer :student_id
      t.column :avatar, :oid, :null => false
      t.timestamps
    end
  end
end
