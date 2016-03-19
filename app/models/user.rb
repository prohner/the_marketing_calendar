# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string
#  first_name    :string
#  last_name     :string
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ApplicationRecord
  belongs_to :department
  has_many :tactic_comments
  has_many :step_comments
  has_many :followed_steps
  has_many :followed_tactics
end
