class TypePodcastsController < ApplicationController
  before_action :set_type_podcast, only: [:show, :edit, :update, :destroy]

  # GET /type_podcasts
  # GET /type_podcasts.json
  def index
    @type_podcasts = TypePodcast.all
  end

  # GET /type_podcasts/1
  # GET /type_podcasts/1.json
  def show
  end

  # GET /type_podcasts/new
  def new
    @type_podcast = TypePodcast.new
  end

  # GET /type_podcasts/1/edit
  def edit
  end

  # POST /type_podcasts
  # POST /type_podcasts.json
  def create
    @type_podcast = TypePodcast.new(type_podcast_params)

    respond_to do |format|
      if @type_podcast.save
        format.html { redirect_to @type_podcast, notice: 'Type podcast was successfully created.' }
        format.json { render :show, status: :created, location: @type_podcast }
      else
        format.html { render :new }
        format.json { render json: @type_podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_podcasts/1
  # PATCH/PUT /type_podcasts/1.json
  def update
    respond_to do |format|
      if @type_podcast.update(type_podcast_params)
        format.html { redirect_to @type_podcast, notice: 'Type podcast was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_podcast }
      else
        format.html { render :edit }
        format.json { render json: @type_podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_podcasts/1
  # DELETE /type_podcasts/1.json
  def destroy
    @type_podcast.destroy
    respond_to do |format|
      format.html { redirect_to type_podcasts_url, notice: 'Type podcast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_podcast
      @type_podcast = TypePodcast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_podcast_params
      params.require(:type_podcast).permit(:name)
    end
end
