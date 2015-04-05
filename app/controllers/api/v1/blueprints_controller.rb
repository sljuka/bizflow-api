module Api
  module V1

    class BlueprintsController < ApplicationController

      before_filter :restrict_access 

      def index

        query = BizflowRepo.new.blueprints
        query = query.where(name: params[:names]) if params[:names]
        query = query.group(:name).order(Sequel.desc(:id)) if params[:latest]

        @blueprints = query.all

      end

    end

  end
end
