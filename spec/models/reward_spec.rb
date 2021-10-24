require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'バリデーションのテスト' do

    before do
      @reward_user = FactoryBot.create(:reward_user)
    end

    context 'ユーザーがご褒美を登録・編集する時' do
      it "内容、ユーザー情報がある場合、有効である" do
        reward = FactoryBot.build(:reward, user: @reward_user)
        expect(reward).to be_valid
      end

      it "ユーザー情報がない場合、無効である" do
        reward = FactoryBot.build(:reward)
        expect(reward).not_to be_valid
      end

      it "内容がない場合、無効である" do
        reward = FactoryBot.build(:reward, content: nil, user: @reward_user)
        expect(reward).not_to be_valid
      end
    end
  end
end