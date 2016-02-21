class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index

    if params[:filter].present?
      case params[:filter]
      when "popularity"
        @places = Place.order(clicks: :desc)
      when "crowd"
        @places = Place.all.sort  { |a,b| (((a.crowd_current) * 1.0)/a.crowd_max) <=> (((b.crowd_current) * 1.0)/b.crowd_max) }
      when "noise"
        @places = Place.all.sort  { |a,b| (((a.noise_max) * 1.0)/a.noise_num) <=> (((b.noise_max) * 1.0)/b.noise_num) }
      when "comfort"
        @places = Place.all.sort  { |a,b| (((a.comfort_max) * 1.0)/a.comfort_num) <=> (((b.comfort_max) * 1.0)/b.comfort_num) }
      end
    elsif params[:q].present?
        @places = Place.search(params[:q])
    else
      @places = Place.order(clicks: :desc)
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @place.clicks += 1
    @place.save
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
    @place.crowd_current += 1

    @place.noise_max += change_place_params[:noise_change]
    @place.noise_num += 1

    @place.comfort_max += change_place_params[:comfort_change]
    @place.comfort_num += 1

    @place.save

    redirect_to @place
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    @place.crowd_current += 1

    @place.noise_max += change_place_params[:noise_change].to_i
    @place.noise_num += 1

    @place.comfort_max += change_place_params[:comfort_change].to_i
    @place.comfort_num += 1

    @place.save

    redirect_to @place
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find_by_name(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :locationx, :locationy, :clicks, :crowd_max, :crowd_current, :noise_max, :noise_num, :comfort_max, :comfort_num, :description)
    end

    def change_place_params
      params.require(:place).permit(:noise_change, :comfort_change)
    end
end
