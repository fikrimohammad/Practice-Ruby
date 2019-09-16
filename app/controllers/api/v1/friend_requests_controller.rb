module Api
  module V1
    class FriendRequestsController < ApplicationController
      before_action :set_friend_request, except: [:index, :create]

      def index
        user = User.find(params[:user_id])
        @friend_requests = FriendRequest.where(friend: user)
        render json: @friend_requests
      end

      def create
        user = User.find(params[:user_id])
        friend = User.find(params[:friend_id])

        @friend_request = user.friend_requests.new(friend: friend)

        if @friend_request.save
          render json: @friend_request, status: :created
        else
          render json: @friend_request.errors, status: :unprocessable_entity
        end
      end

      def approve
        @friend_request.accept
        render json: {}, status: :no_content
      end

      def cancel
        @friend_requests.destroy
        render json: {}, status: :no_content
      end

      def set_friend_request
        @friend_request = FriendRequest.find(params[:id])
      end
    end
  end
end