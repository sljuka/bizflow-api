module Api
  module V1

    class ProcessesController < ApplicationController

      before_filter :restrict_access 

      def index
        @processes = BizflowRepo.new.processes
      end

      def show
        @process = BizflowRepo.new.find_process(params[:id])
      end

      def create
        @process = BizflowRepo.new.create_process(params[:id], @current_user.id)
      end

      def run
        @process = BizflowRepo.new.find_process(params[:id])
        @process.run(@current_user.id)
      end

    end

  end
end
