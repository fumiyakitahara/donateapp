class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :support
  belongs_to :user

  validates :price,    presence: true
  validates :token,    presence: true

end
