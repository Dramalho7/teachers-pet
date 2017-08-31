class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.text :email
      t.text :password
      t.integer :student_id
      t.timestamps
    end
  end
end
