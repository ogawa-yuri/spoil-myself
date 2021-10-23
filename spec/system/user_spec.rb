require 'rails_helper'
RSpec.describe 'ユーザーや登録画面のテスト', type: :system do

  describe 'ユーザーのテスト' do
    context 'ユーザーを新規作成した場合' do

      before do
        @user = FactoryBot.build(:user)
      end

      it 'タスク一覧画面に遷移する' do
        visit new_user_registration_path
        binding.irb
        fill_in 'user[name]', with: @user.name
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        fill_in 'user[password_confirmation]', with: @user.password_confirmation
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context 'ユーザーがログインせずタスク一覧に飛ぼうとした場合' do
      it 'ログイン画面に遷移する' do
        visit tasks_path
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'ログイン'
      @admin_user = FactoryBot.create(:admin_user)
    end
    context 'ログイン後' do
      it '自分の詳細画面に遷移できる' do
        visit user_path(@user)
        expect(page).to have_content 'general_user@example.com'
      end
      it '他の人の詳細画面に飛べない' do
        visit user_path(@admin_user)
        expect(page).to have_content 'やることを登録する'
      end
      it 'ログアウトができる' do
        visit tasks_path
        click_link 'ログアウト'
        expect(page).to have_content 'ログイン'
      end
    end
  end

  describe '管理画面のテスト' do
    context '管理ユーザーはログイン後' do
      before do
        @admin_user = FactoryBot.create(:admin_user)
        visit rails_admin_path
        fill_in 'user[email]', with: @admin_user.email
        fill_in 'user[password]', with: @admin_user.password
        click_button 'ログイン'
      end
      it '管理画面に遷移できる' do
        expect(page).to have_content 'サイト管理'
      end
      it 'ログアウトができる' do
        visit tasks_path
        click_link 'ログアウト'
        expect(page).to have_content 'ログイン'
      end
    end
    context '一般ユーザーはログイン後' do
      it '管理画面には移動できない' do
        visit rails_admin_path
        @user = FactoryBot.create(:user)
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'ログイン'
        expect(page).to have_content 'やることを登録する'
      end
    end
  end
end
