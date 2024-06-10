class StoreController < ApplicationController
  def index
    @items = Item.all
    if params[:query].present?
      @items = @items.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end
end
