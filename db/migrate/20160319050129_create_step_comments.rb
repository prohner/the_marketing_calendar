class CreateStepComments < ActiveRecord::Migration[5.0]
  def change
    create_table :step_comments do |t|
      t.string :comment
      t.integer :step_id
      t.integer :user_id

      t.timestamps
    end
  end
end
