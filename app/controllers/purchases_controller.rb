class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]
  before_action :buyer_confirmation, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
   end
 
  
    def create
    @purchase_address = PurchaseAddress.new(puschase_address_params)
      if @purchase_address.valid?
        pay_item
        @purchase_address.save
        redirect_to root_path
        else
        render :index
      end
  end


  private

    def puschase_address_params
      params.require(:purchase_address).permit(:post_code, :area_id, :municipalities, :address_id, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]).merge(token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def contributor_confirmation
      redirect_to root_path if current_user == @item.user
    end

    def buyer_confirmation
      redirect_to root_path if @item.present?
      #ログインした時に遷移先の商品が売却済みだったら
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
        amount: @item.price,  
        card: puschase_address_params[:token],    
        currency: 'jpy'                 
      )
    end

end



