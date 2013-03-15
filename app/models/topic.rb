# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  desc       :string(255)
#

class Topic < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :name
=======
  attr_accessible :name, :desc
>>>>>>> dccdb5b12d6be8d4a29f1bf4155b4fc85b94db20
  has_many :relationships
  has_many :courses, through: :relationships
end
