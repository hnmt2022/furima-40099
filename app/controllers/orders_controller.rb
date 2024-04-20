class OrdersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_item
  before_action :contributor_confirmation
  before_action :sold_out_confirmation

  def index
    gon.public_key = ENV['FURIMA_40099_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?

      Payjp.api_key = ENV['FURIMA_40099_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['FURIMA_40099_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_params
    params.require(:item).permit(:price)
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user
  end

  def sold_out_confirmation
    redirect_to root_path if @item.order.present?
  end
end
