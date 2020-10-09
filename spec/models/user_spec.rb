require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  it '全ての項目に入力がされていれば保存できること' do
    expect(@user).to be_valid
  end
  it 'nicknameが空だと保存できないこと' do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'emailが空だと保存できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'emailに@が無いと保存できないこと' do
    @user.email = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end
  it 'emailが重複していると保存できないこと' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'passwordが空だと保存できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが５文字以下だと保存できないこと' do
    @user.password = 'tes12'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordが数字だけでは保存できないこと' do
    @user.password = '12345678'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
  end
  it 'passwordに英字だけでは保存できないこと' do
    @user.password = 'abcdefg'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
  end
  it 'passwordが存在してもpassword_confirmationが空では保存できないこと' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'passwordとpassword_confirmationが一致していなければ登録できないこと' do
    @user.password_confirmation = 'test12345'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'first_nameが空では保存できないこと' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank", 'First name Full-width characters')
  end
  it 'first_nameが全角でなければ保存できないこと' do
    @user.first_name = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name Full-width characters')
  end
  it 'last_nameが空では保存できないこと' do
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name Full-width characters')
  end
  it 'last_nameが全角でなければ保存できないこと' do
    @user.last_name = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name Full-width characters')
  end
  it 'first_name_kanaが空では保存できないこと' do
    @user.first_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana Full-width katakana characters')
  end
  it 'first_name_kanaがカタカナでなければ保存できないこと' do
    @user.first_name_kana = 'ひらがな漢字'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
  end
  it 'last_name_kanaが空では保存できないこと' do
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana Full-width katakana characters')
  end
  it 'last_name_kanaがカタカナでなければ保存できないこと' do
    @user.last_name_kana = 'ひらがな漢字'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
  end
  it 'birthdayが空では保存できないこと' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
