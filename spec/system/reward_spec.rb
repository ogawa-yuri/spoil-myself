require 'rails_helper'
RSpec.describe 'ご褒美管理機能', type: :system do

  describe '新規作成機能' do
    before do
    @reward_user = FactoryBot.create(:reward_user)
    @reward_user2 = FactoryBot.create(:reward_user2)
    @reward = FactoryBot.create(:reward, user: @reward_user) 
    @second_reward = FactoryBot.create(:second_reward, user: @reward_user) 
    @third_reward = FactoryBot.create(:third_reward, user: @reward_user) 
    @fourth_reward = FactoryBot.create(:fourth_reward, user: @reward_user2) 
      visit new_user_session_path
      fill_in 'user[email]', with: @reward_user.email
      fill_in 'user[password]', with: @reward_user.password
      click_button 'ログイン'
    end
   context 'ユーザーがログインしている時' do
      it 'ご褒美の作成ができる' do
        visit rewards_path
        fill_in 'reward[content]', with: "コンビニで好きなものを買う"
        sleep(1)
        click_on '登録する'
        sleep(1)
        expect(page).to have_content "ご褒美が作成されました！"
      end
      it '作成済みのご褒美一覧が表示される' do
         visit rewards_path
         expect(page).to have_content 'ケーキを買う'
         expect(page).to have_content 'マッサージに行く'
         expect(page).to have_content '30分だらっと過ごす'
      end
      it '他人の作成したご褒美は一覧に表示されない' do
        visit rewards_path
        expect(page).to_not have_content '夜食獲得'
      end
      it 'ご褒美の編集ができる' do
        visit rewards_path
        all('a')[6].click
        fill_in 'content', with: "ヘッドスパに行く"
        click_on '編集する'
        expect(page).to have_content "ご褒美が編集されました"
      end
      it 'ご褒美の削除ができる' do
        visit rewards_path
        all('a')[7].click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "ご褒美が削除されました"
      end
    end
  end
end