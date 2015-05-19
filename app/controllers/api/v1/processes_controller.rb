module Api
  module V1

    class ProcessesController < ApplicationController

      before_filter :restrict_access 

      def index
        blueprints_query = Bizflow::DataModel::ProcessBlueprint.group(:name)
        processes_query = Bizflow::DataModel::Process.order(Sequel.desc(:id))
        if params[:names]
          names = JSON.parse(params[:names])
          blueprints_query = blueprints_query.where(name: names)
          processes_query = processes_query.where(name: names).order(Sequel.desc(:id))
        end

        @blueprints = blueprints_query.all
        @processes = processes_query.all
      end

      def show
        @result = Bizflow::DataModel::ProcessBlueprint[params[:id]]
      end

      def create
        @result = Bizflow::BusinessModel::Process.create_process(params[:id], @current_user.id)
      end

      def run
        process = Bizflow::DataModel::Process[params[:id]]
        Bizflow::Repos::Repo.connection.transaction do 
          
          Bizflow::BusinessModel::Process.wrap(process).start(@current_user.id) do |on|

            on.success { |res|
              @result = res
              render
            }

            on.already_started { |res|
              @result = res
              render status: 422
            }

          end

        end
      end

      def input
        process = BizflowRepo.new.processes[params[:id]]
        action = Bizflow::BusinessModel::InputAction.wrap(process.current)
        action.submit_input(params[:input]) do |on|

          on.bad_input { |res|
            @result = res
            render status: 422
          }

          on.not_active { |res|
            @render = res
            render status: 422
          }

          on.success { |res|
            @result = res
            render
          }

        end
      end

    end

  end
end
