class CreateTactics < ActiveRecord::Migration[5.0]
  def change
    create_table :tactics do |t|
      t.string :title
      t.integer :event_id
      t.integer :channel_id
      t.datetime :starts_on
      t.datetime :ends_on
      t.decimal :revenue

      t.timestamps
    end
  end
end
