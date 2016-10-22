class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def show
    @play = Play.find(params[:id])
  end

  def new
    @play = Play.new
  end

  def create
    @play = Play.new(play_params)

    if @play.save
      flash[:notice] = "Your play was successfully uploaded."
      redirect_to @play
    else
      flash.now[:alert] = "There was a problem uploading your play. Please try again."
      render :new
    end
  end

  def edit
    @play = Play.find(params[:id])
  end

  def update
    @play = Play.find(params[:id])
    @play.assign_attributes(play_params)

    if @play.save
      flash[:notice] = "You have updated your '#{@play.title}' play."
      redirect_to @play
    else
      flash.now[:alert] = "There was a problem updating your play. Please try again."
      render :edit
    end
  end

  def destroy
    @play = Play.find(params[:id])

    if @play.delete
      flash[:notice] = "You successfully deleted your play."
      redirect_to plays_path
    else
      flash.now[:alert] = "There was a problem deleting your play."
      render :show
    end
  end

  private

  def play_params
    params.require(:play).permit(:title, :description)
  end
end
