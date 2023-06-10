require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる場合' do
      it 'nameとemailとpasswordとpassword_confirmationとage_idとsubject_idとprefecture_idとoperation_idとschooltype_idとschool_nameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができない場合' do
      it 'nameが空では登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードの確認とパスワードの入力が一致しません")
      end
      it 'age_idでid:1を選択した時は登録できない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("年齢を選択してください")
      end
      it 'subject_idでid:1を選択した時は登録できない' do
        @user.subject_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("担当教科を選択してください")
      end
      it 'prefecture_idでid:1を選択した時は登録できない' do
        @user.prefecture_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("お勤め先の学校の都道府県を選択してください")
      end
      it 'operation_idでid:1を選択した時は登録できない' do
        @user.operation_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("国立・公立・私立を選択してください")
      end
      it 'schooltype_idでid:1を選択した時は登録できない' do
        @user.schooltype_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("学校種別を選択してください")
      end
      it 'school_nameが空では登録できない' do
        @user.school_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("学校名を入力してください")
      end
      it 'name（全角）に半角文字が含まれていると登録できない' do
        @user.name = "山田 太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前は全角日本語を使用してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "aaacom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailは不正な値です")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
      
    end
  end
end
