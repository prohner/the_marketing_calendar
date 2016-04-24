# == Schema Information
#
# Table name: channels
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  icon       :string
#  team_id    :integer
#

class Channel < ApplicationRecord
  has_many :tactics
  belongs_to :team
end
