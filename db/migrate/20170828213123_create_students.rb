class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :parent_email
      t.integer :class_id
      t.timestamps
    end
  end
end
