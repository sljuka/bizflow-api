module Api
  module V1

    class BlueprintsController < ApplicationController

      before_filter :restrict_access 

      def index
        @processes = BizflowRepo.new.process_blueprints
      end

    end

  end
end
