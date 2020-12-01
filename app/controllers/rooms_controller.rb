class RoomsController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[show]

    before_action :set_room
    def show
        
    end
    
    private
    def set_room
        @room = Room.includes(:available_times).find(params[:id])
    end
    
end
