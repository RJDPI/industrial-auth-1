class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed followers following discover ]

  before_action :ensure_belongs_to_current_user, only: %i[ feed discover ]

private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end
    def ensure_belongs_to_current_user
      if current_user != @user
        redirect_back fallback_location: root_path, alert: "Sorry! You can only see your own feeds."
      end
    end
end
