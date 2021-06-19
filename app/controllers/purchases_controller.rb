class PurchasesController < ApplicationController

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
   end
 
  
    def create
    @purchase_address = PurchaseAddress.new(puschase_address_params)
    @item = Item.find(params[:item_id])
      if @purchase_address.valid?
          @purchase_address.save
          redirect_to root_path
        else
        render :index
      end
  end


  private

    def puschase_address_params
      params.require(:purchase_address).permit(:post_code, :area_id, :municipalities, :address_id, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end

  
end



