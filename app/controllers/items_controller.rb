class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :basic_auth
  #before_action :move_to_index, except: [:index, :show]
  

  def index
    #@items = Item.includes(:user)
    #@items = Item.order("created_at DESC")
  end

  def new
    @items = Item.new
  end
  
  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end 
  end

  #def destroy
  #  item = Item.find(params[:id])
  #  item.destroy
  #end

  #def show
    #@items = Item.find(params[:id])
  #end

  #def edit
    #@items = Item.find(params[:id])
  #end

  #def update
    #@items = Item.find(params[:id])
    #@items.update(item_params)
  #end

private
  def item_params
    params.require(:item).permit(:user_id, :image,:item_name,:item_explanation,:price,:category_id,:product_condition_id,:delivery_borden_id,:sipping_area_id,:days_to_ship_id).merge(user_id: current_user.id)
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end
