class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.text :email
      t.text :password

      t.timestamps
    end
  end
end
