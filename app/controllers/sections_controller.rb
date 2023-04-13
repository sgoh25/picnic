class SectionsController < ApplicationController
  before_action :set_section, only: %i[ edit update destroy ]

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to event_path(current_event.id), notice: "Section created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to event_path(current_event.id), notice: "Section updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @items = Item.where("section_id = '#{@section.id}'")
    @items.each do |item|
      item.destroy
    end
    @section.destroy

    respond_to do |format|
      format.html { redirect_to event_path(current_event.id), notice: "Section deleted." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_section
    @section = Section.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def section_params
    params.require(:section).permit(:name, :event_id)
  end
end
