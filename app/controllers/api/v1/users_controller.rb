module Api
  module V1

    class UsersController < ApplicationController

      #before_filter :restrict_access 

      def index
        @users = User.all
      end

      def show
        @user = User.find(params[:id])
      end

      def login_info
        @user = User.where(username: params[:username]).try(:first)
        render status: 422 unless @user
      end

    end

  end
end
