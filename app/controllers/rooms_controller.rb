class RoomsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[show]
    before_action :set_place, only: %i[new create]
    before_action :set_room, only: %i[show]
    
    def show
        
    end
    
    def new
        @room = Room.new
        @rooms = Room.where(place: @place)
    end
    
    def create
        @room = Room.new(room_params)
        @room.place = @place
        if @room.save
            redirect_to place_path(@place)
        else
            render :new
        end
        
    end
    
    
    private
    def set_room
        @room = Room.find(params[:id])
    end
    def set_place
        @place = Place.find(params[:place_id])
    end
    def room_params
        params.require(:room).permit(%i[room_name room_number])
    end
    
    
end
