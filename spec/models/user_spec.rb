require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、パスワードがある場合、有効である" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名前がない場合、無効である" do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it "メールアドレスがない場合、無効である" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it "メールアドレスがない場合、無効である" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    expect(user2).not_to be_valid
  end

  it "メールアドレスがない場合、無効である" do
    user = FactoryBot.build(:user, password: nil)
    expect(user).not_to be_valid
  end
end