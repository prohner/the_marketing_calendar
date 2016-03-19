# == Schema Information
#
# Table name: steps
#
#  id            :integer          not null, primary key
#  title         :string
#  tactic_id     :integer
#  department_id :integer
#  starts_on     :datetime
#  ends_on       :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Step < ApplicationRecord
  belongs_to :tactic
  has_many :step_comments
  belongs_to :department
end
