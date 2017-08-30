class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.text :name
      t.text :parent_email
      t.column :avatar, :oid, :null => false
      t.timestamps
    end
  end
end
