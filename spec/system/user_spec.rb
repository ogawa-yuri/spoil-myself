require 'rails_helper'
RSpec.describe 'ユーザーや登録画面のテスト', type: :system do

  describe 'ユーザーのテスト' do
    context 'ユーザーを新規作成した場合' do

      before do
        @user = FactoryBot.build(:user)
      end

      it 'タスク一覧画面に遷移する' do
        visit new_user_registration_path
        fill_in 'user[name]', with: @user.name
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        fill_in 'user[password_confirmation]', with: @user.password_confirmation
        click_on 'アカウント登録'
        expect(page).to have_content 'タスク一覧'
      end
    end
  end
end
