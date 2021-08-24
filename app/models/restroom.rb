# == Schema Information
#
# Table name: restrooms
#
#  id           :integer          not null, primary key
#  location     :string
#  name         :string
#  review_notes :text
#  score        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Restroom < ApplicationRecord
  has_many(:ratings, { :class_name => "Rating", :foreign_key => "restroom_id", :dependent => :destroy })
  has_many(:users, { :through => :ratings, :source => :user })
end
