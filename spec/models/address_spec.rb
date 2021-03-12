require 'rails_helper'

RSpec.describe Address, type: :model do

  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所登録' do
    context '住所の登録ができる時' do
      it  '全ての情報が正しければ購入できる' do
        expect(@address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @address.building_number=''
        expect(@address).to be_valid
      end
    end


    context '住所の登録ができない時' do
      it '郵便番号がないと購入できない'  do
        @address.postal_code=''
        @address.valid?
        expect(@address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '都道府県がないと購入できない'  do
        @address.prefecture_id=''
        @address.valid?
        expect(@address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'カテゴリーのidが１を選択されていると投稿できない' do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("都道府県を選択してください")
      end
      it '市区町村がないと購入できない'  do
        @address.city=''
        @address.valid?
        expect(@address.errors.full_messages).to include("市区町村を入力してください")    
      end
      it '番地がないと購入できない'  do
        @address.house_number=''
        @address.valid?
        expect(@address.errors.full_messages).to include("番地を入力してください")
      end
      it '郵便番号にはハイフンがないと購入できない'  do
        @address.postal_code='2321111'
        @address.valid?
        expect(@address.errors.full_messages).to include("郵便番号は不正な値です")
      end
     
    end
  end
end
