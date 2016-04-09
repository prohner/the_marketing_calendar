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

  def full_name
    f = ""
    l = ""
    f = first_name unless first_name.nil? || first_name == User.default_value_for_empty_name
    l = last_name unless last_name.nil? || last_name == User.default_value_for_empty_name

    if f == "" && l == ""
      email
    else
      (f.strip + " " + l.strip).strip
    end
  end

  private
    def self.default_value_for_empty_name
      "tmc name tbd"
    end


end
