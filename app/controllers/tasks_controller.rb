class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index, :toggle]
  skip_before_action :verify_authenticity_token

  def index
    @tasks = Task.where(status: false).order(id: :ASC)
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    binding.irb
    respond_to do |format|
      if @task.save
        format.js { render :lists }
      else
        format.html { redirect_to tasks_path, notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
   @task = Task.find(params[:id])#確認する
   respond_to do |format|
     flash.now[:notice] = 'タスクの編集中'
     format.js { render :edit }
   end
  end

  def update
   @task = Task.find(params[:id])
     respond_to do |format|
       if @task.update(task_params)
         flash.now[:notice] = 'タスクが編集されました'
         format.js { render :lists }
       else
         flash.now[:notice] = 'タスクの編集に失敗しました'
         format.js { render :edit_error }
       end
     end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      flash.now[:notice] = 'タスクが削除されました'
      format.js { render :lists }
    end
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(status: true)
    respond_to do |format|
      flash.now[:notice] = 'タスクを完了にしました'
      format.js { render :lists and return }
   end
  end

  private
  def task_params
    params.require(:task).permit(:id, :content, :expired_at, :status)
  end
end
