class AddAvatarToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :avatar, :text
  end
end
