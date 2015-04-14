module Api
  module V1

    class ProcessesController < ApplicationController

      before_filter :restrict_access 

      def index
        blueprints_query = BizflowRepo.new.blueprints.group(:name)
        processes_query = BizflowRepo.new.processes.order(Sequel.desc(:id))
        if params[:names]
          names = JSON.parse(params[:names])
          blueprints_query = blueprints_query.where(name: names)
          processes_query = processes_query.where(name: names).order(Sequel.desc(:id))
        end

        @blueprints = blueprints_query.all
        @processes = processes_query.all
      end

      def show
        @process = BizflowRepo.new.processes[params[:id]]
      end

      def create
        @process = BizflowRepo.new.create_process(params[:id], @current_user.id)
      end

      def run
        @process = BizflowRepo.new.run_process(params[:id], @current_user.id)
        render
      end

      def input
        @process = BizflowRepo.new.processes[params[:id]]
        action = Bizflow::BusinessModel::InputAction.wrap(@process.current)
        action.submit_input(params[:input])
        render
      end

    end

  end
end
