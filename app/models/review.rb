class Review < ActiveRecord::Base
  belongs_to :product
  validates :product_id, :user_id, :rating  presence: true

end
