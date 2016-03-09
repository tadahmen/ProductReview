class Product < ActiveRecord::Base

  has_many :reviews
  validates_presence_of :name,
                        message: "please, enter a product name"

end
