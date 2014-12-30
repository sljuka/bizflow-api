module Api
  module V1
    class ProcessesController < ApplicationController

      def index
        @processes = BfProcess.all
      end

      def show
        @process = BfProcess.find(params[:id])
      end

    end
  end
end
