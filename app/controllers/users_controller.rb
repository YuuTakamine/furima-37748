class UsersController < ApplicationController
  before_action :move_to_new, except: [:index, :show]

  def new
    @user = User.find(params[:id])
  end
