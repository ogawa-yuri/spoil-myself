class RewardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index ]
  skip_before_action :verify_authenticity_token

  def index
    @rewards = Reward.all.order(id: :ASC)
    @reward = Reward.new
  end

  def create
    @reward = current_user.rewards.build(reward_params)
    respond_to do |format|
      if @reward.save
        format.js { render :lists }
      else
        format.html { redirect_to rewards_path, notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
   @reward = Reward.find(params[:id])#確認する
   respond_to do |format|
     flash.now[:notice] = 'タスクの編集中'
     format.js { render :edit }
   end
  end

  def update
   @reward = Reward.find(params[:id])
     respond_to do |format|
       if @reward.update(reward_params)
         flash.now[:notice] = 'タスクが編集されました'
         format.js { render :lists }
       else
         flash.now[:notice] = 'タスクの編集に失敗しました'
         format.js { render :edit_error }
       end
     end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
    respond_to do |format|
      flash.now[:notice] = 'タスクが削除されました'
      format.js { render :lists }
    end
  end

  private
  def reward_params
    params.require(:reward).permit(:id, :content)
  end
end
