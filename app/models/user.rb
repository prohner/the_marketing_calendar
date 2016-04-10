# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  department_id          :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # before_validation :default_values
  # before_create :create_remember_token
  before_validation :clean_up_data

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

    def clean_up_data
      self.email = self.email.downcase
    end

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

    def User.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end


end
