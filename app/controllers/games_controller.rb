class GamesController < ApplicationController
  before_action :authenticate_user!

  def create
    game = current_user.games.create
    redirect_to new_game_day_path(game)
  end
end
