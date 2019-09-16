module Api
  module V1
    class FriendshipsController < ApplicationController
      before_action :set_friend, only: :destroy

      def index
        @friends = @user.friends
      end

      def destroy
        @user.friends.destroy(@friend)
      end

      private

      def set_friend
        @user = User.find(params[:user_id])
        @friend = @user.friends.find(params[:friend_id])
      end

    end
  end
end