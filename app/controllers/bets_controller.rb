class BetsController < ApplicationController
  def index
  end

  def create
    @bet = Bet.new(params_bets)
    @bet.user = current_user
    if @bet.save
      redirect_to matchs_path
    else
      raise
    end

  end

  def params_bets
    params.require(:bet).permit(:place_money, :match_id, :team_number)
  end



end
