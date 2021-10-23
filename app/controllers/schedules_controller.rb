class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :post_scheduleuser,only: [:show, :edit, :update, :destroy ]

  def index
    @schedules = current_user.schedules
    @schedule = Schedule.new
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = current_user.schedules.build(schedule_params)
    # Schedule.create(schedule_params)
    @schedule.save
    redirect_to schedules_path, notice:"スケジュールが作成されました！"
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice:"スケジュールが削除されました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice:"スケジュールが編集されました"
    else
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:content, :start_time)
  end

  def post_scheduleuser
    @schedule = Schedule.find(params[:id])
    unless @schedule.user_id == current_user.id
      redirect_to schedules_path
    end
  end

end
