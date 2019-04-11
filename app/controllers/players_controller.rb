require "pry"

class PlayersController < ApplicationController
  before_action :find_player, only:  [:show, :edit, :update, :destroy]
  def index
    if params[:search_term]
      @players = Player.where("name LIKE ?", "%#{params[:search_term]}%")
    else
      @players = Player.all
    end
  end

  def create
    @player = Player.new(player_params)
    if @player.valid?
      @player.save
      redirect_to players_path
    else
      @teams = Team.all
      render :new
    end
  end

  def new
    @player = Player.new
    @teams = Team.all
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to players_path
  end

  def show
  end

  def destroy
    @player.delete
    redirect_to players_path
  end

  private

  def find_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :team_id)
  end
end
