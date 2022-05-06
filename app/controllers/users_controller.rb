class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_new, except: [:index, :show]

  def new
    @user = User.find(params[:id])
  end
