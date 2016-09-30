class TasksController < ApplicationController

  def index
    @tasks = Task.all
    render 'index'
  end

  def show
    @task = Task.find(params[:id])
    render 'show'
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to '/tasks'
  end

  def new
    render 'new'
  end

  def create
    task = Task.new
    task.title = params[:title]
    task.description = params[:description]
    task.save
    redirect_to '/tasks'
  end

  def update
    @task=Task.find(params[:id])
    if !params[:title]
      @task.completed_at = Time.now
      @task.save
    else
      @task.update(:title => params[:title], :description=>params[:description])
    end
    redirect_to '/tasks'
  end

  def edit
    @task=Task.find(params[:id])
    render 'edit'
  end

end