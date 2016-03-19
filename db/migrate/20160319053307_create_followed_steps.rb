class CreateFollowedSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :followed_steps do |t|
      t.integer :user_id
      t.integer :step_id

      t.timestamps
    end
  end
end
