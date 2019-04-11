require "pry"

class TeamsController < ApplicationController
    before_action :find_team, only:  [:show, :edit, :update, :destroy]
    def index
      if params[:search_term]
        @teams = Team.where("name LIKE ?", "%#{params[:search_term]}%")
      else
        @teams = Team.all
      end
    end

    def create
      @team = Team.new(team_params)
      if @team.valid?
        @team.save
        redirect_to teams_path
      else
        render :new
      end
    end

    def new
      @team = Team.new
    end

    def edit
    end

    def update
      @team.update(team_params)
      redirect_to teams_path
    end

    def show
    end

    def destroy
      @team.delete
      redirect_to teams_path
    end

    private

    def find_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :team_id)
    end
  end
