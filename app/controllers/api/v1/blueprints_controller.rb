module Api
  module V1

    class BlueprintsController < ApplicationController

      before_filter :restrict_access 

      def index
        query = Bizflow::DataModel::ProcessBlueprint.group(:name)
        query = query.where(name: params[:names]) if params[:names]
        query = query.order(Sequel.desc(:id)) if params[:latest]
        @blueprints = query.all
      end

    end

  end
end
