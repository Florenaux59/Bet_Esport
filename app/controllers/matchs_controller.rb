class MatchsController < ApplicationController



  def index
    @matchs = Match.includes(:team1, :team2, :game).all
    @games = Game.all
    #FakeJob.perform_now
  end

  def show
    @match = Match.find(params[:id])
  end


end
