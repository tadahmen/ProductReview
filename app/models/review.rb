class Review < ActiveRecord::Base

  belongs_to :product
  validates_presence_of :name, :rating,
                        # message:"please enter at least your name and a rating"

end
