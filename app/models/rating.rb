# == Schema Information
#
# Table name: ratings
#
#  id           :integer          not null, primary key
#  location     :string
#  name         :string
#  review_notes :text
#  score        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  restroom_id  :integer
#  user_id      :integer
#
class Rating < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:restroom, { :required => true, :class_name => "Restroom", :foreign_key => "restroom_id" })
end
