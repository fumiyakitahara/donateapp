class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :support

  validates :content, presence: true

end
