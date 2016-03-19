# == Schema Information
#
# Table name: followed_steps
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  step_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FollowedStep < ApplicationRecord
  belongs_to :step
  belongs_to :user
end
