# == Schema Information
#
# Table name: departments
#
#  id              :integer          not null, primary key
#  department_name :string
#  team_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Department < ApplicationRecord
  belongs_to :team
  has_many :users
end
