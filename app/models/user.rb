class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address
  has_many :supports
  has_many :orders
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }
    validates :phone_number, format: { with: /\A\d{6,11}\z/ }

    validates :last_name
    validates :first_name

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナのみで入力して下さい' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
