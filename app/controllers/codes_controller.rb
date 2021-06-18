class CodesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_code, only: [:show, :edit, :update, :destroy]

  # GET /codes
  # GET /codes.json
  def index
    @codes = Code.all
  end

  def generate
    if request.post?
      # traitement des informations
      @code = params[:code]
      delais = params[:delay].to_i # nombre de copie
      #expire = delais.hours.from_now

      # search code on the platform
      query = Code.find_by_token(@code)
      if query
        # this record exist, try new one
        redirect_to new_code_path, notice: "Il semblerait qu'un code identique existe deja, merci d'en creer un nouveau."
      else
        # save this new recod
        @new_code = Code.new(token: @code, nombre_copy: delais, rest_copy: 0, used: false)
        if @new_code.save
          redirect_to share_path(code: @code), notice: "Nouveau code enregistré avec succès!"
        else
          redirect_to new_code_path, notice: "Une erreur est survenue : #{@new_code.errors.details}"
        end
      end
    elsif request.get?
      # render view
    end
  end

  # share code
  def share

  end

  # GET /codes/1
  # GET /codes/1.json
  def show
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit
  end

  # POST /codes
  # POST /codes.json
  def create
    @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codes/1
  # PATCH/PUT /codes/1.json
  def update
    respond_to do |format|
      if @code.update(code_params)
        format.html { redirect_to @code, notice: 'Code was successfully updated.' }
        format.json { render :show, status: :ok, location: @code }
      else
        format.html { render :edit }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1
  # DELETE /codes/1.json
  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to codes_url, notice: 'Code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def code_params
      params.require(:code).permit(:token)
    end
end
