class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

 def configure_permitted_parameters
   added_attrs = [:name, :email, :password, :password_confirmation, :remember_me, :image]
   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
 end

#  def after_sign_in_path_for(resource)
#    rewards_path
#  end

 def after_sign_in_path_for(resource)
   if current_user.try(:admin?)
      rails_admin_path         
   else 
      tasks_path              
   end
  end

  def guest_user
    current_user == User.find_by(name: 'ゲストユーザー')
  end

 private
   def tasks_count
     @reward_tasks = current_user.tasks.where(status: true, roulette: false)
     @reward_tasks.count
   end
end
