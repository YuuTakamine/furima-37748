class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :basic_auth
  before_action :set_prototype, except: [:index, :new, :create]
  #before_action :move_to_index, except: [:index, :show]
  

  def index
    @items = Item.order("created_at desc")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end 
  end

  #def destroy
    #item = Item.find(params[:id])
    #item.destroy
  #end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

private
  def item_params
    params.require(:item).permit(:user_id, :image,:item_name,:item_explanation,:price,:category_id,:product_condition_id,:delivery_borden_id,:sipping_area_id,:days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_prototype
    @item = Item.find(params[:id])
  end
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end
