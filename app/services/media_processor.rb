class MediaProcessor
  include ActiveModel::Validations

  attr_accessor :media_id, :user, :type, :medium

  MAX_MEDIUM_LENGTH_IN_SECONDS = 300

  def initialize(media_id, user, type = :youtube)
    @media_id = media_id
    @user = user
    @type = type
  end

  def process(save_record = false)
    case type
    when :youtube
      begin
        video = Yt::Video.new(id: media_id)
        @medium = Medium.new(external_id: media_id)

        medium.name = video.title

        if video.duration > MAX_MEDIUM_LENGTH_IN_SECONDS
          errors.add :base, 'Video is too long'
          return false
        else
          medium.length_in_seconds = video.duration
        end

        if video.age_restricted?
          errors.add :base, 'Video is age-restricted'
          return false
        end

        medium.user = user

        medium.save if save_record
        medium
      rescue Yt::Errors::NoItems => e
        errors.add :base, 'Video not found'
        return false
      end
    end
  end
end
