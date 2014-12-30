module Api
  module V1
    class ProcessTypesController < ApplicationController

      def index
        render file: "process-types.json"
      end
    
    end
  end
end
