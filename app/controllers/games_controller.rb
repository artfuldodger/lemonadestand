class GamesController < ApplicationController
  before_action :authenticate_user!

  def create
    game = current_user.games.create
    redirect_to game_path(game)
  end

  def show
    @game = current_user.games.find(params[:id])
  end
end
