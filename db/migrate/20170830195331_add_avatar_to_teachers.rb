class AddAvatarToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :avatar, :text
  end
end
