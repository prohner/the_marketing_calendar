class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.integer :tactic_id
      t.integer :department_id
      t.datetime :starts_on
      t.datetime :ends_on

      t.timestamps
    end
  end
end
