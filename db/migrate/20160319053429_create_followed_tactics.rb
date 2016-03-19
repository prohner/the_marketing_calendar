class CreateFollowedTactics < ActiveRecord::Migration[5.0]
  def change
    create_table :followed_tactics do |t|
      t.integer :user_id
      t.integer :tactic_id

      t.timestamps
    end
  end
end
