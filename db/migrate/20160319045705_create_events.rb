class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_on
      t.datetime :ends_on
      t.decimal :revenue

      t.timestamps
    end
  end
end
