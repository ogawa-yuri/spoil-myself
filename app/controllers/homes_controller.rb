class HomesController < ApplicationController

  def guest
    user          = User.new(user_params)
    user.name     = "ゲストユーザー"
    user.email    = SecureRandom.alphanumeric(15) + "@email.com"
    user.password = SecureRandom.alphanumeric(10)
    user.save
    sign_in user
    redirect_to tasks_path
    flash[:notice] = "ゲストユーザーとしてログインしました"
    end
    
    private
    
    def user_params
      params.permit(:name, :email, :password)
    end
end

