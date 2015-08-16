class MediaController < ApplicationController
  def index
    @media = Medium.all
  end

  def validate
    service = MediaProcessor.new(params[:video_id], current_user)
    if service.process
      render json: service.medium
    else
      render json: service.errors
    end
  end
end
