class GamesController < ApplicationController
  before_action :authenticate_user!

  def create
    game = current_user.games.create
    redirect_to new_game_day_path(game)
  end

  def show
    game = current_user.games.find(params[:id])
    day = game.days.last
    if day
      redirect_to game_day_path(game, day)
    else
      redirect_to new_game_day_path(game)
    end
  end
end
