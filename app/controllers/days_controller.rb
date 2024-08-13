class DaysController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = current_user.games.find(params[:game_id])
    @day = @game.days.new
    @previous_day = @game.days.last
  end

  def create
    @game = current_user.games.find(params[:game_id])
    @day = @game.days.new(day_params)
    if @day.save
      redirect_to game_day_path(@game, @day)
    else
      render :new
    end
  end

  def show
    @game = current_user.games.find(params[:game_id])
    @day = @game.days.find(params[:id])
  end

  private

  def day_params
    params.require(:day).permit(:bought_cups, :bought_signs, :cup_price)
  end
end
