class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
      raise
    if @dose.save
      redirect_to cocktail_path(@dose[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
  end

  def dose_params
    params.require(:dose).permit(:description)
  end

end
