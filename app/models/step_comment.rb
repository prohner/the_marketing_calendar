# == Schema Information
#
# Table name: step_comments
#
#  id         :integer          not null, primary key
#  comment    :string
#  step_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StepComment < ApplicationRecord
  belongs_to :user
  belongs_to :step
end
