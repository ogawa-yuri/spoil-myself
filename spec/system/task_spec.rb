require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do

  describe '新規作成機能' do
    before do
    @task_user = FactoryBot.create(:task_user)
    @task_user2 = FactoryBot.create(:task_user2)
    @task = FactoryBot.create(:task, user: @task_user) 
    @second_task = FactoryBot.create(:second_task, user: @task_user) 
    @third_task = FactoryBot.create(:third_task, user: @task_user) 
    @fourth_task = FactoryBot.create(:fourth_task, user: @task_user2) 
      visit new_user_session_path
      fill_in 'user[email]', with: @task_user.email
      fill_in 'user[password]', with: @task_user.password
      click_button 'ログイン'
    end
   context 'ユーザーがログインしている時' do
      it 'タスクの作成ができる' do
        visit tasks_path
        fill_in 'task[content]', with: "本を読む"
        fill_in'task[expired_at]', with: '002021-11-06'
        click_on '登録する'
        binding.irb
        expect(page).to have_content "やることが作成されました！"
      end
    end
      it '作成済みのタスク一覧が表示される' do
         visit tasks_path
         expect(page).to have_content '買い物'
         expect(page).to have_content '英語の勉強'
         expect(page).to have_content 'スクワット'
      end
      it '他人の作成したタスクは一覧に表示されない' do
        visit tasks_path
        expect(page).to_not have_content 'プログラミング'
      end
   end
end