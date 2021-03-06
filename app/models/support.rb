class Support < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :order

  with_options presence: true do
    validates :item
    validates :price
    validates :reason
    validates :status
  end
end
