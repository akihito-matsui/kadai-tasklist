class TasksController < ApplicationController
  before_action :require_user_logged_in
  def index
    @tasks = current_user.tasks.order(id: :desc).page(params[:page])
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Task が正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が正常に登録されませんでした'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Task は正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は登録されませんでした'
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end

private

# Strong Parameter
def task_params
  params.require(:task).permit(:content, :status)
end

def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

end