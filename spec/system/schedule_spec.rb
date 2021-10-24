require 'rails_helper'
RSpec.describe 'スケジュール管理機能', type: :system do

  describe '新規作成機能' do
    before do
    @schedule_user = FactoryBot.create(:schedule_user)
    @schedule_user2 = FactoryBot.create(:schedule_user2)
    @schedule = FactoryBot.create(:schedule, user: @schedule_user) 
    @second_schedule = FactoryBot.create(:second_schedule, user: @schedule_user) 
    @third_schedule = FactoryBot.create(:third_schedule, user: @schedule_user) 
    @fourth_schedule = FactoryBot.create(:fourth_schedule, user: @schedule_user2) 
      visit new_user_session_path
      fill_in 'user[email]', with: @schedule_user.email
      fill_in 'user[password]', with: @schedule_user.password
      click_button 'ログイン'
    end
   context 'ユーザーがログインしている時' do
      it 'スケジュールの作成ができる' do
        visit schedules_path
        fill_in 'schedule[content]', with: "コンビニで好きなものを買う"
        select '2021', from: 'schedule_start_time_1i'
        select '10月', from: 'schedule_start_time_2i'
        select '30', from: 'schedule_start_time_3i'
        select '14', from: 'schedule_start_time_4i'
        select '30', from: 'schedule_start_time_5i'
        click_on '登録する'
        expect(page).to have_content "スケジュールが作成されました！"
      end
      it '作成済みのスケジュール一覧が表示される' do
         visit schedules_path
         expect(page).to have_content '英語の勉強'
         expect(page).to have_content '買い物'
         expect(page).to have_content 'スクワット'
      end
      it 'スケジュールの編集ができる' do
        visit edit_schedule_path(id: 3)
        fill_in 'schedule[content]', with: "プログラミングの勉強"
        click_on '編集する'
        expect(page).to have_content "スケジュールが編集されました"
      end
      it 'スケジュールの削除ができる' do
        visit schedule_path(id: 3)
        click_on :delete_button
        sleep(1)
        page.driver.browser.switch_to.alert.accept
        sleep(1)
        expect(page).to have_content 'スケジュールが削除されました'
      end
      it '他人の作成したスケジュールは一覧に表示されない' do
        visit schedules_path
        expect(page).to_not have_content '夜食獲得'
      end
      it '他人の作成したスケジュールの詳細画面に飛べない' do
        visit schedule_path(id: 4)
        expect(page).to have_content '今後の予定一覧'
      end
      it '他人の作成したスケジュールの編集画面に飛べない' do
        visit edit_schedule_path(id: 4)
        expect(page).to have_content '今後の予定一覧'
      end
    end
  end
end