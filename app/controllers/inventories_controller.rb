class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.where(user: current_user)
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

  def update
    @inventorie = Inventory.find(params[:id])
    @item = Item.find(params[:item_id])
    @inventorie.item = @item
    @inventorie.item.status = "equipped"
    @inventorie.update(inventorie_params)
    redirect_to inventories_path
  end

  private

  def inventorie_params
    params.require(:inventorie).permit(:status)
  end
end
