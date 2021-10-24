require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'バリデーションのテスト' do

    before do
      @schedule_user = FactoryBot.create(:schedule_user)
    end

    context 'ユーザーがタスクを登録・編集する時' do
      it "内容、日付、ユーザー情報がある場合、有効である" do
        schedule = FactoryBot.build(:schedule, user: @schedule_user)
        expect(schedule).to be_valid
        end

      it "ユーザー情報がない場合、無効である" do
        schedule = FactoryBot.build(:schedule)
        expect(schedule).not_to be_valid
        end

      it "内容がない場合、無効である" do
        schedule = FactoryBot.build(:schedule, content: nil, user: @schedule_user)
        expect(schedule).not_to be_valid
        end

      it "日付がない場合、無効である" do
        schedule = FactoryBot.build(:schedule, start_time: nil, user: @schedule_user)
        expect(schedule).not_to be_valid
      end
    end
  end
end