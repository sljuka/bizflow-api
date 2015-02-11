module Api
  module V1

    class BlueprintsController < ApplicationController

      def index
        @processes = BizflowRepo.new.process_blueprints
      end

    end

  end
end
