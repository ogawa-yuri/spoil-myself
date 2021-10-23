class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :toggle]
  before_action :check_postuser, only: [:edit, :update, :destroy, :toggle]
  skip_before_action :verify_authenticity_token

  def index
    @tasks = current_user.tasks.where(status: false).order(id: :ASC)
    @task = Task.new

  end

  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        flash.now[:notice] = 'やることが作成されました！'
        format.js { render :lists }
      else
        format.html { redirect_to tasks_path, notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
   @task = Task.find(params[:id])#確認する
   respond_to do |format|
     flash.now[:notice] = 'やることの編集中'
     format.js { render :edit }
   end
  end

  def update
   @task = Task.find(params[:id])
     respond_to do |format|
       if @task.update(task_params)
         flash.now[:notice] = 'やることが編集されました'
         format.js { render :lists }
       else
         flash.now[:notice] = 'やることの編集に失敗しました'
         format.js { render :edit_error }
       end
     end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      flash.now[:notice] = 'やることが削除されました'
      format.js { render :lists }
    end
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(status: true)
    # tasks = current_user.tasks.where(status: true, roulette: false)
    rewards = current_user.rewards
    if tasks_count == 3
      @reward_tasks.each do |task|
        task.update(roulette: true)
      end
      reward_id = current_user.rewards.pluck(:id).sample
      reward = current_user.rewards.find_by(id: reward_id )
      content = reward.content
      respond_to do |format|
        flash.now[:notice] = "おめでとうございます！ご褒美#{content}獲得です！"
        format.js { render :lists and return }
      end
    else
      respond_to do |format|
        flash.now[:notice] = 'やることを完了にしました'
        format.js { render :lists and return }
      end
    end
  end

  private
  def task_params
    params.require(:task).permit(:id, :content, :expired_at, :status, :roulette, :task_image)
  end

  def check_postuser
    @task = Task.find(params[:id])
    unless @task.user_id == current_user.id
      redirect_to tasks_path
    end
  end
end
