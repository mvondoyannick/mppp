class HomeController < ApplicationController
  def index
  end

  def download
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
end
