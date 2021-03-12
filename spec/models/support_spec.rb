require 'rails_helper'

RSpec.describe Support, type: :model do
  before do
    @support = FactoryBot.build(:support)
  end
  describe '支援の申し込み' do
    context '申し込みができる時' do
      it '全ての情報が正しければ登録できる'  do
        expect(@support).to be_valid
      end
    end

    context '申し込みができない時' do
      it 'itemがないと登録できない'  do
        @support.item=""
        @support.valid?
        expect(@support.errors.full_messages).to include("欲しいものを入力してください")
      end
      it 'priceがないと登録できない'  do
        @support.price=""
        @support.valid?
        expect(@support.errors.full_messages).to include("金額を入力してください")
      end
      it 'reasonがないと登録できない'  do
        @support.reason=""
        @support.valid?
        expect(@support.errors.full_messages).to include("「なぜ欲しいのか説明してください」を入力してください")
      end
      it 'stasusがないと登録できない'  do
        @support.status=""
        @support.valid?
        expect(@support.errors.full_messages).to include("「あなたのことについて教えてください」を入力してください")
      end
    end
  end
end
