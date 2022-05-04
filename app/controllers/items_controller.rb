class ItemsController < ApplicationController

  before_action :basic_auth
  before_action :move_to_index, except: [:index, :show]
  

  def index
    @items = Item.includes(:user)
  end

  def new
    @items = Item.new
  end
  
  def create
    Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
  end

private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end
