class TouchdownsController < ApplicationController

  def index
    @touchdowns = Touchdown.all
  end

  def new
    @players = Player.all
    @touchdown = Touchdown.new
  end

  def create
    @players = Player.all
    @touchdown = Touchdown.create({
      number: params[:touchdown][:number],
      player_id: params[:touchdown][:player_id]
      })

      redirect_to touchdowns_path
  end
end
