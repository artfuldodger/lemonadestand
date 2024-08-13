class DaysController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = current_user.games.find(params[:game_id])
    @day = @game.days.new
  end

  def create
    @game = current_user.games.find(params[:game_id])
    @day = @game.days.new(day_params)
    if @day.save
      redirect_to new_game_day_path(@game)
    else
      render :new
    end
  end

  private

  def day_params
    params.require(:day).permit(:bought_cups, :bought_signs, :cup_price)
  end
end
