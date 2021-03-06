class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]
  
  # GET /pictures or /pictures.json dentro del metodo index aquí hay que revisar si tiene el place id para rescatar todas las fotos.
  def index
    @pictures = Picture.with_attached_photo.all
  end

  # GET /pictures/1 or /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @place = Place.find(params[:place_id])
    @picture = @place.pictures.build
  end

  # GET /pictures/1/edit
  def edit
    @place = Place.find(params[:place_id])

  end

  # POST /pictures or /pictures.json
  def create
    @picture = Picture.new(picture_params)
    @picture.user = current_user
    @picture.place = Place.find(params[:place_id])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: "La imagen se creó correctamente." }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1 or /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: "La imagen se actualizó correctamente." }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1 or /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: "La imagen se destruyó con éxito." }
      format.json { head :no_content }
    end
  end

  def toggle_favorite
    @picture = Picture.find_by(id: params[:id])
    current_user.favorited?(@picture) ? current_user.unfavorite(@picture) : current_user.favorite(@picture)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.with_attached_photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:user_id, :place_id, :photo)
    end
end
