class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :photos
  has_many :users, through: :photos
end
