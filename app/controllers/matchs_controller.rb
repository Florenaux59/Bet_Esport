class MatchsController < ApplicationController



  def index
    @matchs = Match.includes(:team1, :team2, :game).all
    @games = Game.all
<<<<<<< bet_13062024
    #FakeJob.perform_now
=======
    # FakeJob.perform_now
>>>>>>> master
  end

  def show
    @match = Match.find(params[:id])
  end


end
