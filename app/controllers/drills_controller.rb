class DrillsController < ApplicationController
  def index
    @drills = Drill.all
  end

  def show
    @drill = Drill.find(params[:id])
  end

  def new
    @drill  = Drill.new
  end

  def create
    @drill = Drill.new
    @drill.title = params[:drill][:title]
    @drill.description = params[:drill][:description]

    if @drill.save
      flash[:notice] = "You successfully created a new drill."
      redirect_to @drill
    else
      flash.now[:alert] = "There was a problem uploading your drill. Please try again."
      render :new
    end
  end

  def edit
    @drill = Drill.find(params[:id])
  end

  def update
     @drill = Drill.find(params[:id])
     @drill.title = params[:drill][:title]
     @drill.description = params[:drill][:description]

     if @drill.save
       flash[:notice] = "Drill was updated successfully."
       redirect_to @drill
     else
       flash.now[:alert] = "There was a problem the drill. Please try again."
       render :edit
     end
   end

   def destroy
     @drill = Drill.find(params[:id])

     if @drill.destroy
       flash[:notice] = "\"#{@drill.title}\" was deleted successfully."
       redirect_to drills_path
     else
       flash.now[:alert] = "There was a problem deleting the drill."
       render :show
     end
   end

end
