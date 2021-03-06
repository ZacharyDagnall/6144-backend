class GamesController < ApplicationController

    def show
        @game = Game.find(params[:id])
        render json: @game
    end

    def update
        @game = Game.find(params[:id])
        @game.update(board_state: params[:board_state])
        @game.update(score: params[:score])
        @game.update(game_over: params[:game_over])
        render json: @game
    end

    def leaderboard
        @scores = Game.leaderboard(params[:name])
        render json: @scores
    end

    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        render json: {}
    end

    def rules
        @rules = Game.rules(params[:name])
        render json: @rules
    end


    private
    def game_params
        # byebug
        # params.permit(:board_state)
        # params.permit(board_state: [], :score, :game_over)
    end

end
