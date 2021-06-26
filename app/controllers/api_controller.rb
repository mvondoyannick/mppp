class ApiController < ApplicationController
    def index
        render json: {
            message: :rended,
            data: Podcast.all.map do |d|
              {
                id: d.id,
                title: d.title,
                created: d.created_at,
                content: d.content,
                file: "#{request.base_url}#{Rails.application.routes.url_helpers.rails_blob_path(d.audio_file, only_path: true)}"
              }
            end
        }, status: 200
    end
end