class PodcastsController < ApplicationController
  include Trackable
  before_action :authenticate_user!, only: [:create, :new, :edit, :update]
  before_action :set_podcast, only: [:show, :edit, :update, :destroy], except: [:search, :index]

  # GET /podcasts
  # GET /podcasts.json
  def index
    @page_title = "Nos podcasts"
    @page_description = "Consulter les podcasts"
    @page_keywords = "Podcasts, enseignements, Parole de Dieu"
    @search = Podcast.ransack(params[:q])
    @podcasts = @search.result(distinct: true) #result #Podcast.all
  end

  # GET /podcasts/1
  # GET /podcasts/1.json
  def show
    @page_title = @podcast.title
    @page_description = "Consulter les podcasts"
    @page_keywords = "Podcasts, enseignements, Parole de Dieu"
    track "Viewed Podcast", title: @podcast.title
  end

  # GET /podcasts/new
  def new
    @page_title = "Nouvelle publication"
    @podcast = Podcast.new
  end

  # GET /podcasts/1/edit
  def edit
    @page_title = "Editer #{@podcast.title}"
  end

  # search podcast
  def search
    @q = Podcast.ransack(params[:q])
    @people = @q.result(distinct: true)

    puts @people.as_json(only: [:id, :title])

    respond_to do |format|
      format.html { redirect_to :index, notice: 'Podcast hello.' }
    end
  end

  def rep
  end

  # POST /podcasts
  # POST /podcasts.json
  def create
    @podcast = Podcast.new(podcast_params)

    respond_to do |format|
      if @podcast.save
        format.html { redirect_to @podcast, notice: 'Podcast was successfully created.' }
        format.json { render :show, status: :created, location: @podcast }
      else
        format.html { render :new }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcasts/1
  # PATCH/PUT /podcasts/1.json
  def update
    respond_to do |format|
      if @podcast.update(podcast_params)
        format.html { redirect_to @podcast, notice: 'Podcast was successfully updated.' }
        format.json { render :show, status: :ok, location: @podcast }
      else
        format.html { render :edit }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcasts/1
  # DELETE /podcasts/1.json
  def destroy
    @podcast.destroy
    respond_to do |format|
      format.html { redirect_to podcasts_url(lang: :fr), notice: 'Podcast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def podcast_params
      params.require(:podcast).permit(:title, :date_creation, :content, :video_file, :audio_file, :content_detail, :cover, :type_podcast_id, :extrait)
    end
end
