class BetsController < ApplicationController
  def index
  end

  def create
    @bet = Bet.new(params_bets)
    @bet.user = current_user
    if @bet.save
      current_user.bank -= params[:bet][:place_money].to_i
      redirect_to matchs_path
      current_user.save
    else
      raise
    end

  end

  def params_bets
    params.require(:bet).permit(:place_money, :match_id, :team_number)
  end



end
