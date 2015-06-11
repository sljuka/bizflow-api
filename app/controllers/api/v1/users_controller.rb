module Api
  module V1

    class UsersController < ApplicationController

      def login_info
        @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
        render status: 422 unless @user
      end

    end

  end
end
