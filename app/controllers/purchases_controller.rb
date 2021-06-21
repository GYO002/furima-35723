class PurchasesController < ApplicationController
  before_action :set_item, only: [:index]
  before_action :authenticate_user!, only: [:index]
  before_action :contributor_confirmation, only: [:index]
  before_action :buyer_confirmation, only: [:index]

  def index
    @purchase_address = PurchaseAddress.new
   end
 
  
    def create
    @purchase_address = PurchaseAddress.new(puschase_address_params)
    @item = Item.find(params[:item_id])
      if @purchase_address.valid?
        #Payjp.api_key = "sk_test_9306cc0adf090c74bb27ca4a"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: puschase_address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
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

end



