class MatchsController < ApplicationController
  def index
    @matchs = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end
end
