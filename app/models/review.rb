class Review < ActiveRecord::Base
  belongs_to :product
  validates :product_id, :user_id, :rating,  presence: true
  validates :rating, :inclusion => { :in => 1..5 }

end
