class CreateActionSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :action_steps do |t|
      t.text :description
      t.datetime :target_date
      t.text :resources_needed
      t.text :implementation_specifics
      t.text :measures_of_success
      t.text :lead
      t.integer :goal_id

      t.timestamps
    end
  end
end
