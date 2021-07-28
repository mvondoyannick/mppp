class HomeController < ApplicationController
  before_action :authenticate_user!, only: :admin
  before_action :payload_jwt, only: :download
  before_action :control_code, only: :index

  def identify

  end

  def accueil
    @page_title = "Ministère Par la Parole Prophétique"
    @podcasts = Podcast.limit(6).order(created_at: :desc)
  end

  # ahoy traker
  def tracker
    @visits = Ahoy::Visit.order(started_at: :desc) #includes(:events).all
  end

  def team

  end

  # adding calendar
  def calendar
    @page_title = "Calendrier des programmes"
  end

  def index
    if request.post?
      @code = params[:code]
      query = Code.find_by(token: params[:code])
      if query
        # get some information
        if query.nombre_copy.to_i == query.rest_copy.to_i
          puts 'limit reached'
          redirect_to root_path, notice: "Le nombre maximum de #{query.nombre_copy} Manuel(s) de jeune pour ce code a été atteint, merci de demander un nouveau code."
        else
          query.used = true
          query.rest_copy = query.rest_copy.to_i + 1
          respond_to do |format|
            if query.save
              format.html { redirect_to index_path(code: params[:code]), notice: 'Code was successfully created.' }
            else
              puts query.errors.messages
              redirect_to root_path, notice: "Impossible de mettre à jour certaines informations! #{query.errors.details}"
            end
          end
        end
        # if query.nombre_copy.to_i >= query.rest_copy.to_i
         
        # else
        #   redirect_to root_path, notice: "Le nombre maximum de #{query.nombre_copy} Manuel de jeune a été atteint, merci de demander un nouveau code."
        # end
      else
        redirect_to root_path, notice: "Ce code semble etre indisponible ou déja utilisé! Merci de vous rapprocher de l'administrateur"
      end
    else
      # render view
    end
  end

  def download
    if params[:ray].present?

    else
      # not rails params found
      redirect_to root_path, notice: "Information manquante"
    end
  end

  # send mail to user
  def mailman
    a = RestClient.post "https://api:03ee8a853e31d8648cf06b82f7c30dcb-3d0809fb-3486193e" \
	    "@api.mailgun.net/v3/sandbox023900a156f3425e819b872335392423.mailgun.org/messages",
                        :from => "MPPP MAILER BOT <yannick.mvondo@paiemequick.com>",
                        :to => "mvondoyannick@gmail.com",
                        :subject => "Hello",
                        :text => params[:lorem]

    if a.code == 200
      redirect_to dashboard_path, notice: "Mail sended"
    else
      redirect_to dashboard_path, notice: "Impossible to send mail"
    end
  end

  def admin
    @page_title = "Administration"
    @users = UserCommand.all.order(created_at: :desc)
  end

  def list
    @command = UserCommand.all.order(created_at: :desc)
  end

  def download_detail
    email = params[:email]
    @email = email
    @users = UserCommand.where(email: email)
    @count = @users.sum(:nombre).to_i
  end

  # make a command
  def command
    if request.post?
      @command = UserCommand.new(valid_form_data)
      @command.ip = request.remote_ip
      if @command.save
        # create session payload
        hmac_secret = 'my$ecretK3y'
        exp = Time.now.to_i + 4 * 3600
        exp_payload = { data: params[:email], exp: exp }
        token = JWT.encode exp_payload, hmac_secret, 'HS256'
        session[:token] = token
        redirect_to home_download_path(ray: request.request_id, sess_id: session[:token], lang: params[:lang]), notice: "Vous pouvez telecharger l'ensemble du manuel"
      else
        redirect_to root_path, notice: "Une erreur est sruvenue durant le traitement: #{@command.errors.details}"
      end
    end
  end

  def add
    if request.post?
      @title = params[:title]
      @file = params[:file]

      # begin save document
      @document = Document.new(name: @title, file: @file)
      if @document.save
        redirect_to root_path, notice: "Document ajouté"
      else
        redirect_to root_path, notice: "Impossible d'ajouter le document : #{@document.errors.details}"
      end
    end
  end

  private

  def valid_form_data
    params.permit(:name, :second_name, :email, :pays, :nombre)
  end

  # control code
  def control_code
    if params[:code].present?
      # verifier si le code existe
      code = params[:code]
      _query = Code.find_by_token(code)
      if _query && _query.nombre_copy.to_i == _query.rest_copy.to_i
        puts "failed"
      end
    else
      redirect_to root_path, notice: "Session du code manquante, merci de renseigner un code pour continuer!"
    end
  end

  # verify token payload
  def payload_jwt
    if session[:token].present?
      token = session[:token] #JWT.encode exp_payload, hmac_secret, 'HS256'
      hmac_secret = 'my$ecretK3y'
      begin
        puts "Session found : #{session[:token]}"
        decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }
      rescue JWT::ExpiredSignature
        # Handle expired token, e.g. logout user or deny access
        redirect_to root_path, notice: "Session expirée, merci de remplir de formulaire de nouveau!"
      end

    else
      puts "No token found"
      redirect_to root_path, notice: "Session expirée, merci de remplir de formulaire de nouveau!"
    end
  end
end
