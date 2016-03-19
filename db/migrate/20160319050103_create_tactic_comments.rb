class CreateTacticComments < ActiveRecord::Migration[5.0]
  def change
    create_table :tactic_comments do |t|
      t.string :comment
      t.integer :tactic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
