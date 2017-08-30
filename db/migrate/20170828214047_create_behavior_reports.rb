class CreateBehaviorReports < ActiveRecord::Migration[5.1]
  def change
    create_table :behavior_reports do |t|
      t.date :date
      t.text :report
      t.integer :student_id
      t.timestamps
    end
  end
end
