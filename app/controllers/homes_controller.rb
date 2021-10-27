class HomesController < ApplicationController

  def guest
    user          = User.new(user_params)
    user.name     = "ゲストユーザー"
    user.email    = SecureRandom.alphanumeric(15) + "@example.com"
    user.password = SecureRandom.alphanumeric(10)
    user.save
    sign_in user
    redirect_to tasks_path
    flash[:notice] = "ゲストユーザーとしてログインしました"
  end

  def admin_sign_in
    user = User.find_or_create_by!(name: "ゲストユーザー（管理者)",
      email: 'admin_guest@example.com', admin: true ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to rails_admin_path, notice: 'ゲストユーザー(管理者）としてログインしました。'
  end
    
    private
    
    def user_params
      params.permit(:name, :email, :password)
    end
end

