# == Schema Information
#
# Table name: followed_tactics
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tactic_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FollowedTactic < ApplicationRecord
  belongs_to :tactic
  belongs_to :user
end
