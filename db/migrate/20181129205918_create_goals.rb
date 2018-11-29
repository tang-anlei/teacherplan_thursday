class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :improvement_plan_id
      t.text :comments

      t.timestamps
    end
  end
end
