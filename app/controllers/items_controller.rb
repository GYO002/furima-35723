class ItemsController < ApplicationController
  
  
  def index
    #@items = Item.includes(:user)
  end

  def new
    @iteme = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end




  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
