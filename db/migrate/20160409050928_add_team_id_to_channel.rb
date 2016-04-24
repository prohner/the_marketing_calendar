class AddTeamIdToChannel < ActiveRecord::Migration[5.0]
  def change
    add_column :channels, :team_id, :integer
  end
end
