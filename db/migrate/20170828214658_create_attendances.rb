class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.date :date
      t.boolean :is_present
      t.integer :student_id
      t.timestamps
    end
  end
end
