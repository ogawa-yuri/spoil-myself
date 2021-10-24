require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'バリデーションのテスト' do

    before do
      @task_user = FactoryBot.create(:task_user)
    end

    context 'ユーザーがタスクを登録・編集する時' do
      it "内容、期限、ユーザー情報がある場合、有効である" do
        task = FactoryBot.build(:task, user: @task_user)
        expect(task).to be_valid
        end

      it "ユーザー情報がない場合、無効である" do
        task = FactoryBot.build(:task)
        expect(task).not_to be_valid
        end

      it "内容がない場合、無効である" do
        task = FactoryBot.build(:task, content: nil, user: @task_user)
        expect(task).not_to be_valid
        end

      it "期限がない場合、無効である" do
        task = FactoryBot.build(:task, expired_at: nil, user: @task_user)
        expect(task).not_to be_valid
      end
    end
  end
end