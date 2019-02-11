class TasksController < ApplicationController


    def index
        @tasks = Task.all
        @tasks = Task.all.order(:date)
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.create(task_params)
        redirect_to tasks_path
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to tasks_path
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end


    def show
        @tasks = Task.all
        @january = Task.where(date: "2019-01")
        @sum = january.sum(:price)
    end


    private
        def task_params
            params.require(:task).permit(:date, :title, :place, :price, :descripton)
        end
end
