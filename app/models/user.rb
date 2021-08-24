# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:ratings, { :class_name => "Rating", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:restrooms, { :through => :ratings, :source => :restroom })
end
