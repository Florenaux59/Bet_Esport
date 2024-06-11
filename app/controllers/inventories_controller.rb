class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.where(user: current_user)
    if params[:query].present?
      @inventories = @inventories.joins(:item).where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @inventorie = Inventory.new
    @inventorie.item = @item
    @inventorie.user = current_user
    current_user.bank -= @item.price
    if @inventorie.save
      redirect_to items_path
      current_user.save
    else
      render items_path, status: :unprocessable_entity
    end
  end

  def equipped
    @inventorie = Inventory.find(params[:id])
    Inventory.where(user: current_user).update_all(status: "not_equipped")
    @inventorie.update(status: "equipped")
    redirect_to inventories_path
  end
end
