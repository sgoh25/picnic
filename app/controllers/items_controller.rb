class ItemsController < ApplicationController
    before_action :set_item, only: %i[ edit update destroy ]
  
    def new
      @item = Item.new(section_id_param)
    end
  
    def create
      @item = Item.new(item_params)
  
      respond_to do |format|
        if @item.save
          format.html { redirect_to event_path(current_event.id), notice: "Item created." }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def edit
    end
  
    def update
      respond_to do |format|
        if @item.update(item_params)
          format.html { redirect_to event_path(current_event.id), notice: "Item updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @item.destroy
  
      respond_to do |format|
        format.html { redirect_to event_path(current_event.id), notice: "Item deleted." }
        format.json { head :no_content }
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def section_id_param
      params.permit(:section_id)
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:item, :name, :section_id)
    end
  end
  