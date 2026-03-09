class PlacesController < ApplicationController

  def index
    rel_entries = Entry.where({"user_id" => session["user_id"]}).select(:place_id)
    @places = Place.where(id: rel_entries)
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
