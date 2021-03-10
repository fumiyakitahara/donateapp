class SupportsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]


  def index
    @supports = Support.all.order('created_at DESC')
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    if @support.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @support = Support.find(params[:id])
    @total = @support.orders.sum(:price)
    @comment = Comment.new       
    @comments = @support.comments.order(created_at: :desc)
  end

  def edit
    @support = Support.find(params[:id])
  end

  def update
    @support = Support.find(params[:id])
    if @support.update(support_params)
      redirect_to support_path(params[:id])
    else
      render :edit
    end
  end


  private
    def support_params
      params.require(:support).permit(:item,:price,:reason,:status,:image).merge(user_id: current_user.id)
    end
end
