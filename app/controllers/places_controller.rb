class PlacesController < ApplicationController
    skip_before_action :authenticate_user!, only: %i[show]
    before_action :set_place, only: %i[show edit update destroy]

    def index
        @places = Place.where(user: current_user)
    end
    
    
    def show
        @rooms = Room.where(place: @place)
    end
    
    def new
        @place = Place.new
        @room = Room.new
    end
    
    def create
        place = Place.new(place_params)
        place.user = current_user
        if place.save
            redirect_to new_place_room_path(place)
        else
            render :new
        end 
    end
    
    def edit
    end
    
    def update        
        if @place.update(place_params)
            redirect_to place_path(@place)
        end
    end
    
    def destroy
        if @place.destroy
            redirect_to places_path
        end
    end
    
    
    private
    
    def set_place
        @place = Place.find(params[:id])
    end
    
    
    def place_params
        params.require(:place).permit(:company_name, :fantasy_name)
    end
    

end
