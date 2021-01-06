class HomeController < ApplicationController
  def index
  end

  def download
  end

  # make a command
  def command
    if request.post?
      @command = UserCommand.new(valid_form_data)
      @command.ip = request.remote_ip
      if @command.save
        redirect_to home_download_path(ray: request.request_id), notice: "Vous pouvez telecharger l'ensemble du manuel"
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
end
