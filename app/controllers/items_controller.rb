class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :ensure_current_user, only: [:edit, :update]

  def index
    @items = Item.order( id: :desc)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end
  




  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def ensure_current_user
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
