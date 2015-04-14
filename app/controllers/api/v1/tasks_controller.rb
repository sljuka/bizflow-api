module Api
  module V1

    class TasksController < ApplicationController

      before_filter :restrict_access 

      def assign
      	task = BizflowRepo.new.tasks[params[:id]]
      	task = Bizflow::BusinessModel::Task.wrap(task)
      	task.assign(@current_user.id)
      end

      def finish
      	task = BizflowRepo.new.tasks[params[:id]]
      	task = Bizflow::BusinessModel::Task.wrap(task)
      	task.finish(@current_user.id)
      end

    end

  end
end

# /api/v1/tasks/:id/assign
# /api/v1/tasks/:id/finish
