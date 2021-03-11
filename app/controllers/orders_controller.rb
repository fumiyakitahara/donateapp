class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @support = Support.find(params[:support_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token], user_id: current_user.id, support_id: params[:support_id])
  end

  def pay_item
    Payjp.api_key = Payjp.api_key = ENV['PAYJP_SECRET_KEY']    # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
