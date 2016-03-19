# == Schema Information
#
# Table name: tactic_comments
#
#  id         :integer          not null, primary key
#  comment    :string
#  tactic_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TacticComment < ApplicationRecord
  belongs_to :tactic
  belongs_to :user
end
