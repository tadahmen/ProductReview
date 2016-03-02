class Review < ActiveRecord::Base

  belongs_to :product
  validates_presence_of :name, :rating
  
end
