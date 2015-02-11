module Api
  module V1

    class ProcessesController < ApplicationController

      def index
        @started_processes = BizflowRepo.new.started_processes(User.first)
      end

      def show
        @process = BizflowRepo.find_process(params[:id])
      end

      def create
        BizflowRepo.create_process(params[:id])
      end

      def run
        @process = Bizflow.find_process(params[:id])
        @process.run
      end

    end

  end
end
