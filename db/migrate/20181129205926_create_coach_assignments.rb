class CreateCoachAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :coach_assignments do |t|
      t.integer :user_id
      t.integer :improvement_id

      t.timestamps
    end
  end
end
