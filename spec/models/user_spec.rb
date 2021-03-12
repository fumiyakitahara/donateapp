require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it '全ての値が正しければ登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaaaaaa666'
        @user.password_confirmation = 'aaaaaaa666'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'メールアドレスは、@が存在しないと登録できない' do
        @user.email = 'userexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードは、半角英語のみでは登録できないこと'  do
        @user.password = 'fashifhaoodj'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end
      it 'パスワードは、数字のみでは登録できないこと' do
        @user.password = 33333333333
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end
      it 'パスワードは、全角英数字混同では登録できないこと' do
        @user.password = 'fjdii32ああ'
        @user.password_confirmation = 'fjdii32ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include( "パスワードは不正な値です")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'パスワードとパスワード（確認用）は、値が違うと登録できない' do
        another_user = FactoryBot.build(:user)
        @user.password = another_user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'ユーザー本名の名字が空では登録できない' do
        @user.last_name= ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)を入力してください")
      end
      it 'ユーザー本名の名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(全角)を入力してください")
      end
      it 'ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ・英字）でなければ登録できない' do
        @user.last_name = 'aaaaaa7777'
        binding.pry
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(全角)は不正な値です")
      end
      it 'ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ・英字）でなければ登録できない' do
        @user.first_name = 'aaaaaa6666'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(全角)は不正な値です")
      end
      it 'ユーザー本名のふりがなの名字が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)を入力してください")
      end
      it 'ユーザー本名のふりがなの名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)を入力してください")
      end
      it 'ユーザー本名の名字のフリガナは、カタカナでなければ登録できない' do
        @user.last_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字(カナ)は全角カタカナのみで入力して下さい")
      end
      it 'ユーザー本名の名前のフリガナは、カタカナでなければ登録できない' do
        @user.first_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(カナ)は全角カタカナのみで入力して下さい")
      end
      it '電話番号が空では登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("電話番号を入力してください")
      end
    end
  end

end
