module Api
  module V1

    class TasksController < ApplicationController

      before_filter :restrict_access 

      def index
        @tasks = BizflowRepo.new.tasks
      end

    end

  end
end
